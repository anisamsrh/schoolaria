const pool = require("../db");
const { checkID } = require("../helper/inputChecker");

const GetSummary = async (req, res) => {
  try {
    const {idSiswa} = req.body

    await checkID.validateAsync(idSiswa, {abortEarly: false});

    const minLulus = await pool.query(`
      SELECT lower(p.rentang) from konfigurasi k
      JOIN predikat p ON p.nama = k.nilai
      WHERE nama_konfigurasi = 'predikat_min_lulus'
      `);

    const data = await pool.query(`
        SELECT 
          sub.nama AS "namaChapter",
          sub.total_kesalahan AS "totalKesalahan",
          90 - sub.total_kesalahan AS nilai,
          pd.nama AS "predikat",
          CASE 
            WHEN (90 - sub.total_kesalahan) >= $2 THEN 'Lulus'
            ELSE 'Tidak Lulus'
          END AS status
        FROM (
          SELECT 
            ch.nama,
            SUM(n.angka_nilai) AS total_kesalahan
          FROM chapter ch
          JOIN param p ON p.id_chapter = ch.id
          JOIN subparam sp ON sp.id_param = p.id
          JOIN nilai n ON n.id_subparam = sp.id
          WHERE n.id_siswa = $1
          GROUP BY ch.nama
        ) sub
        JOIN predikat pd ON pd.rentang @> (90 - sub.total_kesalahan)::integer;
      `, [idSiswa, minLulus.rows[0].lower]);

    

    const nilaiFinal = await pool.query(`
      SELECT 
        ROUND((SUM((90 - sub.total_kesalahan) * sub.bobot))/SUM(sub.bobot), 2) AS nilai_final
      FROM (
        SELECT 
          SUM(n.angka_nilai) AS total_kesalahan,
          ch.bobot
        FROM chapter ch
        JOIN param p ON p.id_chapter = ch.id
        JOIN subparam sp ON sp.id_param = p.id
        JOIN nilai n ON n.id_subparam = sp.id
        WHERE n.id_siswa = $1
        GROUP BY ch.nama, ch.bobot
      ) sub;
      `, [idSiswa]);

    res.json({
      nilaiFinal : nilaiFinal.rows[0],
      chapterDetails : data.rows
    })
  } catch (err) {
    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

module.exports = {GetSummary}