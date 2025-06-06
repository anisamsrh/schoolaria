const express = require("express");
const cors = require("cors");
require("dotenv").config();

const app = express();
const port = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Cek server
app.get("/", (req, res) => {
  res.send("Server is running!");
});

// Jalankan server
app.listen(port, () => {
  console.log(`Server berjalan di http://localhost:${port}`);
});

const routes = require("./routes/routesHandler");
app.use("/api", routes);
