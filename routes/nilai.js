const pool = require("../db");

const ReadNilaiSiswa = async (req, res) => {
  try {
    const {idSiswa} = req.body;

    //TODO : Check id

    const data = await pool.query(`
      SELECT 
        COALESCE(n.angka_nilai, 0) AS nilai,
        sp.nama AS subparameter,
        pr.nama AS "parameter",
        ch.nama AS chapter
      FROM siswa s
      CROSS JOIN subparam sp
      JOIN param pr ON pr.id = sp.id_param
      JOIN chapter ch ON ch.id = pr.id_chapter
      LEFT JOIN nilai n 
        ON n.id_siswa = s.id AND n.id_subparam = sp.id
      WHERE s.id = $1;`, [idSiswa]);

      //TODO : Check if hasil ada
      res.json(data.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({error : err.details[0].message});
  }
}

const EditNilaiSiswa = async (req, res) => {
  try {
    const {idSiswa, idSubparam, nilaiBaru} = req.body;

    //TODO : check input

    let editedData = await pool.query(`
      UPDATE nilai SET angka_nilai=$1 
      WHERE id_siswa=$2 AND id_subparam=$3
      RETURNING *`, [nilaiBaru, idSiswa, idSubparam]);

    if (editedData.rows.length === 0) {
      editedData = await pool.query(`
        INSERT INTO nilai(angka_nilai, id_siswa, id_subparam)
        VALUES (100, 1, 12)
        ON CONFLICT (id_siswa, id_subparam) DO NOTHING;`)
    }

    res.json("Nilai berhasil diubah!");
  } catch (err) {
    console.error(err.message);
    res.status(500).json({error : err.details[0].message});
  }
}

module.exports = {ReadNilaiSiswa, EditNilaiSiswa};