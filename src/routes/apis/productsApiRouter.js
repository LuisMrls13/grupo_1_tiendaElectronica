const express = require('express');
const router = express.Router();
const productsApiController = require('../../controllers/apis/productsApiController');

router.get("/",productsApiController.lista);
router.get("/:id",productsApiController.productoInfo);




module.exports = router;