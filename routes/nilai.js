const pool = require("../db");
const { checkID, editNilai } = require("../helper/inputChecker");

const ReadNilaiSiswa = async (req, res) => {
  try {
    const {idSiswa} = req.body;

    await checkID.validateAsync(idSiswa, {abortEarly: false});

    const data = await pool.query(`
      SELECT 
        COALESCE(n.angka_nilai, 0) AS "jumlah kesalahan",
        sp.nama AS subparameter,
        sp.id AS "idSubparameter",
        pr.nama AS "parameter",
        ch.nama AS chapter
      FROM siswa s
      CROSS JOIN subparam sp
      JOIN param pr ON pr.id = sp.id_param
      JOIN chapter ch ON ch.id = pr.id_chapter
      LEFT JOIN nilai n 
        ON n.id_siswa = s.id AND n.id_subparam = sp.id
      WHERE s.id = $1;`, [idSiswa]);

      if (data.rows.length<1) {
        return res.status(404).json({eror : 'ID siswa salah atau data siswa tidak ada!'})
      }
      res.json(data.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

const EditNilaiSiswa = async (req, res) => {
  try {
    const {idSiswa, idSubparam, nilaiBaru} = req.body;

    await editNilai.validateAsync({idSiswa, idSubparam, nilaiBaru}, {abortEarly: false})

    let editedData = await pool.query(`
      UPDATE nilai SET angka_nilai=$1 
      WHERE id_siswa=$2 AND id_subparam=$3
      RETURNING *`, [nilaiBaru, idSiswa, idSubparam]);

    if (editedData.rows.length === 0) {
      editedData = await pool.query(`
        INSERT INTO nilai(angka_nilai, id_siswa, id_subparam)
        VALUES ($1, $2, $3)
        ON CONFLICT (id_siswa, id_subparam) DO NOTHING;`, [nilaiBaru, idSiswa, idSubparam])
    }

    res.json("Nilai berhasil diubah!");
  } catch (err) {
    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

module.exports = {ReadNilaiSiswa, EditNilaiSiswa};