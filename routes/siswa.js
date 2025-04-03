const pool = require("../db");

const AddSiswa = async (req, res) => {
  try {
    const {nama, nrp} = req.body;

    const newItem = await pool.query("INSERT INTO siswa (nama, nrp) VALUES ($1, $2)", [nama, nrp]);
    res.json(newItem.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
}

const ReadSiswa = async (req, res) => {
  try {
    const allItems = await pool.query("SELECT * from siswa");
    res.json(allItems.rows);
  } catch (err) {
    console.error(err.message);
  }
}

const EditSiswa = async (req, res) => {
  try {
    const {id, nama,nrp} = req.body;

    //TODO : Check (1. ID not *, 2. ID must be number, 3. NAMA NRP must be TEXT and of Valid format, 4. All must be defined)

    const editedItem = await pool.query("UPDATE siswa SET nama=$1, nrp=$2 WHERE id=$3 RETURNING *", [nama, nrp, id]);

    //TODO : Check if the data actually existed

    res.json(editedItem.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
}

const DeleteSiswa = async (req, res) => {
  try {
    const {id} = req.body;

    // TODO : check ID

    const deletedItem = await pool.query("DELETE FROM siswa WHERE id=$1", [id]);

    // TODO : Check berhasil

    res.json("Siswa data deleted!");
  } catch (error) {
    console.error(error.message);
  }
}

module.exports = {AddSiswa, ReadSiswa, EditSiswa, DeleteSiswa}