const express = require('express');
const router = express.Router();
const usersApiController = require('../../controllers/apis/usersApiController');


//Rutas exigidas para la creación del CRUD
router.get("/",usersApiController.lista);
router.get("/:id",usersApiController.infouser);


module.exports = router;