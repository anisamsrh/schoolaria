const express = require("express");
const pool = require("./db");

const router = express.Router();

// Create New Chapter
router.post("/chapter", async (req, res) => {
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
});

// Read chapter data 
router.get("/chapter", async (req, res) => {
  try {
    const { one } = req.query; // Mengambil nilai one dari query parameter

    if (!one) {
      const allItems = await pool.query("SELECT * FROM chapter");
      return res.json(allItems.rows);
    }

    if (one) { // Jika one=true, maka id harus ada di body request
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
});

// Delete chapter data
router.delete("/chapter", async (req, res) => {
  try {
    const { id } = req.body;

    await pool.query("DELETE FROM chapter WHERE id = $1", [id]);
    res.json("Item deleted!");
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: "Internal Server Error" });
  }
});



module.exports = router;
