const express=require("express");
const usersController = require("../controllers/usersController.js");

const router=express.Router();

//let logDBMiddleware=require("../middlewares/logDBMiddleware");

router.get("/register",usersController.registerView);
router.post("/register",usersController.registerStore);
router.get("/list",usersController.lista);
//router.post("/register",logDBMiddleware,usersController.store);


module.exports=router;