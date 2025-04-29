const Joi = require("joi");

const newChapter = Joi.object({
  nama : Joi.string().min(3).required(),
  bobot : Joi.number().min(1).max(10).required()
});

const newParameter = Joi.object({
  nama : Joi.string().min(3).required()
});

const newSubparam = Joi.object({
  nama : Joi.string().min(3).required()
});

const newSiswa = Joi.object({
  nama : Joi.string().min(3).required(),
  nrp : Joi.string().length(10).regex(/^5024(2[0-6])1(0{2}[1-9]|0[1-9][0-9]|[1-9][0-9][0-9])$/) //5024[20-26][001-999]
});

const editNilai = Joi.object({
  idSiswa : Joi.number().min(1).required(), 
  idSubparam : Joi.number().min(1).required(), 
  nilaiBaru : Joi.number().min(0).max(100).required()
})

const checkID = Joi.number().min(1).required();

module.exports = {newChapter, newParameter, newSiswa, newSubparam, checkID, editNilai};