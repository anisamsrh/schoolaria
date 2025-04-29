const pool = require("../db");
const { checkID, editNilai } = require("../helper/inputChecker");

const ReadNilaiSiswa = async (req, res) => {
  try {
    const {idSiswa, idChapter} = req.body;

    await checkID.validateAsync(idSiswa, {abortEarly: false});

    const data = await pool.query(`
      SELECT 
        COALESCE(n.angka_nilai, 0) AS nilai,
        sp.nama AS subparameter,
        sp.id AS "idSubparameter",
        pr.nama AS "parameter"
      FROM siswa s
      CROSS JOIN subparam sp
      JOIN param pr ON pr.id = sp.id_param
      JOIN chapter ch ON ch.id = pr.id_chapter
      LEFT JOIN nilai n 
        ON n.id_siswa = s.id AND n.id_subparam = sp.id
      WHERE s.id = $1 AND ch.id=$2;`, [idSiswa, idChapter]);

      //TODO : Check if hasil ada
      if (data.rows.length<1) {
        return res.status(404).json({eror : 'ID siswa salah atau data siswa tidak ada!'})
      }

      const catatan = await pool.query(`
        SELECT note FROM catatan
        WHERE id_siswa = $1 AND id_chapter = $2
        `, [idSiswa, idChapter]);

      res.json({
        idChapter,
        nilai : data.rows,
        catatan : catatan.rows[0] || "-"
      });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

const EditNilaiSiswa = async (req, res) => {
  try {
    const { idSiswa, nilai: daftarNilai} = req.body;

    await checkID.validateAsync(idSiswa, {abortEarly: false});

    for (const item of daftarNilai) {
      const { idSubparam, nilai } = item;

      await editNilai.validateAsync({idSubparam, nilai}, {abortEarly: false})

      let result = await pool.query(`
        UPDATE nilai SET angka_nilai = $1
        WHERE id_siswa = $2 AND id_subparam = $3
        RETURNING *`,
        [nilai, idSiswa, idSubparam]
      );

      if (result.rows.length === 0) {
        await pool.query(`
          INSERT INTO nilai (angka_nilai, id_siswa, id_subparam)
          VALUES ($1, $2, $3)
          ON CONFLICT (id_siswa, id_subparam) DO NOTHING`,
          [nilai, idSiswa, idSubparam]
        );
      }
    }


    res.json("Nilai berhasil diubah!");
  } catch (err) {
    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

module.exports = {ReadNilaiSiswa, EditNilaiSiswa};