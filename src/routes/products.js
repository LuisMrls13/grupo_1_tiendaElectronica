const express=require("express");
const productsController=require("../controllers/productsController.js");
const router=express.Router();

router.get("/:id",productsController.id);

router.get("/",productsController.listado);
//router.get("/login",mainController.login);

module.exports=router;