const pool = require("../db");

const ReadSyaratKelulusan = async (req, res) => {
  try {
    const allItems = await pool.query("SELECT nilai from konfigurasi WHERE nama_konfigurasi='predikat_min_lulus'");

    //TODO : Check if the data actually existed

    res.json(allItems.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
}

const EditSyaratKelulusan = async (req, res) => {
  try {
    const {predikatMin} = req.body;

    //TODO : Check if predikat exist

    const editedItem = await pool.query("UPDATE konfigurasi SET nilai=$1 WHERE nama_konfigurasi='predikat_min_lulus' RETURNING *", [predikatMin]);

    //TODO : Check if the data actually existed

    res.json(editedItem.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
}

module.exports = {ReadSyaratKelulusan, EditSyaratKelulusan}