const express=require("express");
const mainController=require("../controllers/loginController.js");
const router=express.Router();

router.get("/",mainController.login);
//router.get("/login",mainController.login);

module.exports=router;