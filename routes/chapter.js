const pool = require("../db");
const {newChapter, checkID} = require("../helper/inputChecker")

// Create New Chapter
const CreateChapter = async (req, res) => {
  try {
    const { nama, bobot } = req.body;

    await newChapter.validateAsync({ nama, bobot }, { abortEarly: false });

    const newItem = await pool.query(
      "INSERT INTO chapter(nama, bobot) VALUES ($1, $2) RETURNING *",
      [nama, bobot]
    );

    res.json(newItem.rows[0]);
  } catch (err) {
    if (err.isJoi) {
      const errorMessages = err.details.map(detail => detail.message);
      return res.status(400).json({ errors: errorMessages });
    }

    console.error(err.message);
    res.status(500).json({ error: "Internal Server Error" });
  }
};


// Read chapter data 
const ReadChapter = async (req, res) => {
  try {
    const { one } = req.query; // Mengambil nilai one dari query parameter

    if (!one) {
      const allItems = await pool.query("SELECT * FROM chapter");
      return res.json(allItems.rows);
    }

    if (one === "true") { // Jika one=true, maka id harus ada di body request
      const { id } = req.body; // Mengambil id dari body request
      
      await checkID.validateAsync(id, { abortEarly: false });

      const item = await pool.query("SELECT * FROM chapter WHERE id = $1", [id]);

      if (item.rows.length === 0) {
        return res.status(404).json({ error: "Chapter tidak ditemukan" });
      }

      return res.json(item.rows[0])
    }
  } catch (err) {
    if (err.isJoi) {
      const errorMessages = err.details.map(detail => detail.message);
      return res.status(400).json({ errors: errorMessages });
    }

    console.error(err.message);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

// Delete chapter data
const DeleteChapter = async (req, res) => {
  try {
    const { id } = req.body;

    await checkID.validateAsync(id, { abortEarly: false });

    const deletedItem = await pool.query("DELETE FROM chapter WHERE id = $1 RETURNING *", [id]);

    if (deletedItem.rows.length === 0) {
      return res.status(404).json({ error: "Chapter tidak ditemukan" });
    }

    res.json("Chapter deleted!");
  } catch (err) {
    if (err.isJoi) {
      const errorMessages = err.details.map(detail => detail.message);
      return res.status(400).json({ errors: errorMessages });
    }

    console.error(err.message);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

// Edit Chapter Data
const EditChapter = async (req, res) => {
  try {
    const { id, nama, bobot } = req.body;
    
    await checkID.validateAsync(id, {abortEarly : false});
    await newChapter.validateAsync({nama, bobot}, {abortEarly : false});

    const updatedItem = await pool.query(
      "UPDATE chapter SET nama = $1, bobot = $2 WHERE id = $3 RETURNING *;",
      [nama, bobot, id]
    );

    if (updatedItem.rows.length === 0) {
      return res.status(404).json({ error: "Chapter tidak ditemukan" });
    }

    res.json(updatedItem.rows[0]);
  } catch (error) {
    if (err.isJoi) {
      const errorMessages = err.details.map(detail => detail.message);
      return res.status(400).json({ errors: errorMessages });
    }

    console.error(err.message);
    res.status(500).json({ error: "Internal Server Error" });
  }
}

module.exports = {CreateChapter, ReadChapter, DeleteChapter, EditChapter}