const pool = require("../db");
const { parseInt4Range } = require("../helper/int4rangeParser");

const SetPredicates = async (req, res) => {
  try {
    const dataItems = req.body;

    if (!Array.isArray(dataItems) || dataItems.length < 2) {
      return res.status(400).json({ error: 'Minimal harus ada 2 data' });
    }

    const minStart = Math.min(...dataItems.map(g => g.batasBawah));
    const maxEnd = Math.max(...dataItems.map(g => g.batasAtas));
    if (minStart > 0 || maxEnd < 100) {
      return res.status(400).json({
        error: 'Rentang total harus mencakup dari 0 sampai 100'
      });
    }

    const values = [];
    const placeholders = [];

    dataItems.forEach((grade, i) => {
      const idx = i * 3;
      values.push(grade.nama, grade.batasBawah, grade.batasAtas + 1);
      placeholders.push(`($${idx + 1}, int4range($${idx + 2}, $${idx + 3}, '[)'))`);
    });

    await pool.query('BEGIN');

    await pool.query('DELETE FROM predikat');
    await pool.query(`
      INSERT INTO predikat (nama, rentang)
      VALUES ${placeholders.join(', ')}
    `, values);

    await pool.query('COMMIT');

    res.json("Predikat Updated!");
  } catch (err) {
    console.error(err.message);
    await pool.query('ROLLBACK');
    res.status(500).json({error : "Internal Server Error"});
  }
};

const ReadPredicates = async (req, res) => {
  try {
    const allItems = await pool.query("SELECT * from predikat");
    const values = [];
    allItems.rows.map(m => {
      const r = parseInt4Range(m.rentang)
      values.push({"nama" : m.nama, "batasBawah" : r.lower, "batasAtas" : (r.upper-1)});
    })
    res.json(values);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
};

module.exports = {ReadPredicates, SetPredicates};