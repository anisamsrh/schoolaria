const pool = require("../db");

// Create New Chapter
const CreateChapter = async (req, res) => {
  try {
    const { nama, bobot } = req.body;
    const newItem = await pool.query(
      "INSERT INTO chapter(nama, bobot) VALUES ($1, $2)",
      [nama, bobot]
    );
    res.json(newItem.rows[0]);
  } catch (err) {
    console.error(err.message);
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

    if (one=== true) { // Jika one=true, maka id harus ada di body request
      const { id } = req.body; // Mengambil id dari body request
      if (!id) {
        return res.status(400).json({ error: "ID is required when one = true" });
      }

      const item = await pool.query("SELECT * FROM chapter WHERE id = $1", [id]);
      return res.json(item.rows[0] || { message: "Chapter not found" });
    }
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

// Delete chapter data
const DeleteChapter = async (req, res) => {
  try {
    const { id } = req.body;

    if (id === undefined) {
      return res.status(400).json({ error: "ID harus disertakan" });
    }

    await pool.query("DELETE FROM chapter WHERE id = $1", [id]);
    res.json("Chapter deleted!");
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

// Edit Chapter Data
const EditChapter = async (req, res) => {
  try {
    const { id, nama, bobot } = req.body;
    
    if (!id || !nama || bobot === undefined) {
      return res.status(400).json({ error: "ID, nama, dan bobot harus disertakan" });
    }

    const updatedItem = await pool.query(
      "UPDATE chapter SET nama = $1, bobot = $2 WHERE id = $3 RETURNING *;",
      [nama, bobot, id]
    );

    if (updatedItem.rows.length === 0) {
      return res.status(404).json({ error: "Chapter tidak ditemukan" });
    }

    res.json(updatedItem.rows[0]);
  } catch (error) {
    
  }
}

module.exports = {CreateChapter, ReadChapter, DeleteChapter, EditChapter}