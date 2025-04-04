const pool = require("../db");
const {checkID, newParameter} = require("../helper/inputChecker");

const ReadParameter = async (req, res) => {
  try {
    const {idChapter} = req.body

    await checkID.validateAsync(idChapter, {abortEarly: false});

    const allItems = await pool.query("SELECT * from param WHERE id_chapter=$1", [idChapter]);

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

const AddParameter = async (req, res) => {
  try {
    const {nama, idChapter} = req.body;

    await checkID.validateAsync(idChapter, {abortEarly: false});
    await newParameter.validateAsync({nama}, {abortEarly: false});

    const newItem = await pool.query("INSERT INTO param (nama, id_chapter) VALUES ($1, $2) RETURNING *", [nama, idChapter]);
    
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

const EditParameter = async (req, res) => {
  try {
    const {id, nama} = req.body;

    await checkID.validateAsync(id, {abortEarly: false});
    await newParameter.validateAsync({nama}, {abortEarly: false});

    const editedItem = await pool.query("UPDATE param SET nama=$1 WHERE id=$2 RETURNING *", [nama, id]);

    if (editedItem.rows.length === 0) {
      return res.status(404).json({ error: "Parameter tidak ditemukan" });
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

const DeleteParameter = async (req, res) => {
  try {
    const {id} = req.body;

    await checkID.validateAsync(id, {abortEarly: false});

    const deletedItem = await pool.query("DELETE FROM param WHERE id=$1 RETURNING *", [id]);

    if (deletedItem.rows.length === 0) {
      return res.status(404).json({ error: "Parameter tidak ditemukan" });
    }

    res.json("Parameter deleted!");
  } catch (err) {
    if (err.isJoi) {
      const messages = err.details.map(m => m.message);
      return res.status(400).json({ errors : messages});
    }

    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

module.exports = {AddParameter, DeleteParameter, ReadParameter, EditParameter}