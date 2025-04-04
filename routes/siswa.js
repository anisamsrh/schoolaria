const pool = require("../db");
const { newSiswa, checkID } = require("../helper/inputChecker");

const AddSiswa = async (req, res) => {
  try {
    const {nama, nrp} = req.body;

    await newSiswa.validateAsync({nama, nrp}, {abortEarly: false});

    const newItem = await pool.query("INSERT INTO siswa (nama, nrp) VALUES ($1, $2) RETURNING *", [nama, nrp]);
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

const ReadSiswa = async (req, res) => {
  try {
    const allItems = await pool.query("SELECT * from siswa");
    res.json(allItems.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

const EditSiswa = async (req, res) => {
  try {
    const {id, nama,nrp} = req.body;

    await checkID.validateAsync(id, {abortEarly: false});
    await newSiswa.validateAsync({nama, nrp}, {abortEarly: false});

    const editedItem = await pool.query("UPDATE siswa SET nama=$1, nrp=$2 WHERE id=$3 RETURNING *", [nama, nrp, id]);

    if (editedItem.rows.length === 0) {
      return res.status(404).json({ error: "Data not found" });
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

const DeleteSiswa = async (req, res) => {
  try {
    const {id} = req.body;

    await checkID.validateAsync(id, {abortEarly: false});

    const deletedItem = await pool.query("DELETE FROM siswa WHERE id=$1", [id]);

    if (deletedItem.rows.length === 0) {
      return res.status(404).json({ error: "Data not found" });
    }

    res.json("Siswa data deleted!");
  } catch (error) {
    if (err.isJoi) {
      const messages = err.details.map(m => m.message);
      return res.status(400).json({ errors : messages});
    }

    console.error(err.message);
    res.status(500).json({error : "Internal Server Error"});
  }
}

module.exports = {AddSiswa, ReadSiswa, EditSiswa, DeleteSiswa}