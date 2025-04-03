const express = require("express");
const {CreateChapter, DeleteChapter, ReadChapter, EditChapter} = require("./chapter");
const {AddSiswa, ReadSiswa, DeleteSiswa, EditSiswa} = require('./siswa');
const {AddParameter, DeleteParameter, EditParameter, ReadParameter} = require("./parameter");
const {AddSubParameter, EditSubParameter, ReadSubParameter, DeleteSubParameter} = require("./subparameter");
const {ReadSyaratKelulusan, EditSyaratKelulusan} = require("./kelulusan");

const router = express.Router();

router.post("/chapter", CreateChapter);
router.get("/chapter", ReadChapter);
router.delete("/chapter", DeleteChapter);
router.put("/chapter", EditChapter);

router.post("/siswa", AddSiswa);
router.get("/siswa", ReadSiswa);
router.put("/siswa", EditSiswa);
router.delete("/siswa", DeleteSiswa);

router.get("/prm", ReadParameter);
router.post("/prm", AddParameter);
router.put("/prm", EditParameter);
router.delete("/prm", DeleteParameter);

router.get("/subprm", ReadSubParameter);
router.put("/subprm", EditSubParameter);
router.post("/subprm", AddSubParameter);
router.delete("/subprm", DeleteSubParameter);

router.get("/lulus", ReadSyaratKelulusan);
router.put("/lulus", EditSyaratKelulusan);

module.exports = router;
