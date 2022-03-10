const express=require("express");
const productsController=require("../controllers/productsController.js");
const router=express.Router();



router.get("/",productsController.listado);
//router.get("/login",mainController.login);
router.get("/create",productsController.createView);
router.get("/:id",productsController.id);
router.get("/:id/editView",productsController.editView);
router.put("/:id",productsController.edit);
router.delete("/:id",productsController.delete);
router.post("/",productsController.create);

module.exports=router;