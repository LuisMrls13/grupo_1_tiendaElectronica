const express=require("express");
const mainController=require("../controllers/mainController.js");
const router=express.Router();

router.get("/",mainController.index);

router.get("/pruebaSession",function(req,res){
    if(req.session.numeroVisitas==undefined)
    {
        req.session.numeroVisitas=0;
    }
    req.session.numeroVisitas++;
    res.send("Sesion tiene el numero: " +req.session.numeroVisitas);

})

module.exports=router;