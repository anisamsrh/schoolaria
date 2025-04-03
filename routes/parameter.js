const pool = require("../db");

const ReadParameter = async (req, res) => {
  try {
    const {idChapter} = req.body

    // TODO : check ID

    const allItems = await pool.query("SELECT * from param WHERE id_chapter=$1", [idChapter]);

    //TODO : Check if the data actually existed

    res.json(allItems.rows);
  } catch (err) {
    console.error(err.message);
  }
}

const AddParameter = async (req, res) => {
  try {
    const {nama, idChapter} = req.body;

    // TODO : check ID

    const newItem = await pool.query("INSERT INTO param (nama, id_chapter) VALUES ($1, $2) RETURNING *", [nama, idChapter]);

    // TODO : Check berhasil
    
    res.json(newItem.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
}

const EditParameter = async (req, res) => {
  try {
    const {id, nama} = req.body;

    //TODO : Check (1. ID not *, 2. ID must be number, 3. NAMA NRP must be TEXT and of Valid format, 4. All must be defined)

    const editedItem = await pool.query("UPDATE param SET nama=$1 WHERE id=$2 RETURNING *", [nama, id]);

    //TODO : Check if the data actually existed

    res.json(editedItem.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
}

const DeleteParameter = async (req, res) => {
  try {
    const {id} = req.body;

    // TODO : check ID

    const deletedItem = await pool.query("DELETE FROM param WHERE id=$1", [id]);

    // TODO : Check berhasil

    res.json("Parameter deleted!");
  } catch (error) {
    console.error(error.message);
  }
}

module.exports = {AddParameter, DeleteParameter, ReadParameter, EditParameter}