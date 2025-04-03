const pool = require("../db");

const ReadSubParameter = async (req, res) => {
  try {
    const {idParam} = req.body

    // TODO : check ID

    const allItems = await pool.query("SELECT * from subparam WHERE id_param=$1", [idParam]);

    //TODO : Check if the data actually existed

    res.json(allItems.rows);
  } catch (err) {
    console.error(err.message);
  }
}

const AddSubParameter = async (req, res) => {
  try {
    const {nama, idParam} = req.body;

    // TODO : check ID

    const newItem = await pool.query("INSERT INTO subparam (nama, id_param) VALUES ($1, $2) RETURNING *", [nama, idParam]);

    // TODO : Check berhasil
    
    res.json(newItem.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
}

const EditSubParameter = async (req, res) => {
  try {
    const {id, nama} = req.body;

    //TODO : Check (1. ID not *, 2. ID must be number, 3. NAMA NRP must be TEXT and of Valid format, 4. All must be defined)

    const editedItem = await pool.query("UPDATE subparam SET nama=$1 WHERE id=$2 RETURNING *", [nama, id]);

    //TODO : Check if the data actually existed

    res.json(editedItem.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
}

const DeleteSubParameter = async (req, res) => {
  try {
    const {id} = req.body;

    // TODO : check ID

    const deletedItem = await pool.query("DELETE FROM subparam WHERE id=$1", [id]);

    // TODO : Check berhasil

    res.json("Sub Parameter deleted!");
  } catch (error) {
    console.error(error.message);
  }
}

module.exports = {AddSubParameter, EditSubParameter, ReadSubParameter, DeleteSubParameter}