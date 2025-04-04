const pool = require("../db");
const {checkPredikat} = require("../helper/inputChecker");

const ReadSyaratKelulusan = async (req, res) => {
  try {
    const allItems = await pool.query("SELECT nilai from konfigurasi WHERE nama_konfigurasi='predikat_min_lulus'");

    res.json(allItems.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

const EditSyaratKelulusan = async (req, res) => {
  try {
    const {predikatMin} = req.body;

    await checkPredikat.validateAsync(predikatMin, {abortEarly});

    const editedItem = await pool.query("UPDATE konfigurasi SET nilai=$1 WHERE nama_konfigurasi='predikat_min_lulus' RETURNING *", [predikatMin]);

    res.json(editedItem.rows[0]);
  } catch (err) {
    if (err.isJoi) {
      const messages = err.details.map(m => m.message);
      return res.status(404).json({ errors : messages});
    }

    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

module.exports = {ReadSyaratKelulusan, EditSyaratKelulusan}