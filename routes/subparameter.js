const pool = require("../db");
const { checkID, newSubparam } = require("../helper/inputChecker");

const ReadSubParameter = async (req, res) => {
  try {
    const {idParam} = req.body

    await checkID.validateAsync(idParam, {abortEarly: false});

    const allItems = await pool.query("SELECT * from subparam WHERE id_param=$1", [idParam]);

    res.json(allItems.rows);
  } catch (err) {
    if (err.isJoi) {
      const messages = err.details.map(m => m.message);
      return res.status(400).json({ errors : messages});
    }

    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

const AddSubParameter = async (req, res) => {
  try {
    const {nama, idParam} = req.body;

    await newSubparam.validateAsync({nama}, {abortEarly: false});

    const newItem = await pool.query("INSERT INTO subparam (nama, id_param) VALUES ($1, $2) RETURNING *", [nama, idParam]);
    
    res.json(newItem.rows[0]);
  } catch (err) {
    if (err.isJoi) {
      const messages = err.details.map(m => m.message);
      return res.status(400).json({ errors : messages});
    }

    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

const EditSubParameter = async (req, res) => {
  try {
    const {id, nama} = req.body;

    await checkID.validateAsync(id, {abortEarly: false});
    await newSubparam.validateAsync({nama}, {abortEarly: false});

    const editedItem = await pool.query("UPDATE subparam SET nama=$1 WHERE id=$2 RETURNING *", [nama, id]);

    if (editedItem.rows.length === 0) {
      return res.status(404).json({ error: "Subparameter tidak ditemukan" });
    }

    res.json(editedItem.rows[0]);
  } catch (err) {
    if (err.isJoi) {
      const messages = err.details.map(m => m.message);
      return res.status(400).json({ errors : messages});
    }

    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

const DeleteSubParameter = async (req, res) => {
  try {
    const {id} = req.body;

    await checkID.validateAsync(id, {abortEarly: false});

    const deletedItem = await pool.query("DELETE FROM subparam WHERE id=$1 RETURNING *", [id]);

    if (deletedItem.rows.length === 0) {
      return res.status(404).json({ error: "Subparameter tidak ditemukan" });
    }

    res.json("Subparameter deleted!");
  } catch (err) {
    if (err.isJoi) {
      const messages = err.details.map(m => m.message);
      return res.status(400).json({ errors : messages});
    }

    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

module.exports = {AddSubParameter, EditSubParameter, ReadSubParameter, DeleteSubParameter}