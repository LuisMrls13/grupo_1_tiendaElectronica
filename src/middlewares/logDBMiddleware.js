const fs =require("fs");

function logDBMiddleware(req,res,next) {
    //fs.writeFileSync("log.txt", "Se ingreso en la pagina "+ req.url);

    fs.appendFileFileSync("logDB.txt", "Se CREO UN REGISTRO AL INGRESAR EN: "+ req.url);
    next();
}

module.exports=logDBMiddleware;