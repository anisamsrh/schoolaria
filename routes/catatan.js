const pool = require("../db");
const { checkID, editNilai } = require("../helper/inputChecker");

const EditCatatan = async (req, res) => {
  try {
    const {idSiswa, idChapter, catatan} = req.body;

    let data = await pool.query(`
      UPDATE catatan SET note = $1
      WHERE id_siswa = $2 AND id_chapter = $3
      RETURNING *;
      `, [catatan, idSiswa, idChapter]);

    if (data.rows.length < 1) {
      data = await pool.query(`
        INSERT INTO catatan (id_siswa, id_chapter, note)
        VALUES ($1, $2, $3)
        ON CONFLICT (id_siswa, id_chapter) DO NOTHING
        RETURNING *;
        `, [idSiswa, idChapter, catatan])
    }

    res.json("Catatan berhasil diubah!")
  } catch (err) {
    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

module.exports = {EditCatatan};