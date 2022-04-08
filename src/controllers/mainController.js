const path = require("path");
let fs = require('fs');

const filepath=path.join(__dirname,"../data/productos/productos.json");
const productos =JSON.parse(fs.readFileSync(filepath, 'utf-8'));

const mainController = {
    index:(req,res)=>{
       // res.render("index2");
       let cadenaUsuario;
       if(req.session.usuario==undefined)
       cadenaUsuario="undefined";
       else
       cadenaUsuario=req.session.usuario;

        res.render('home',{
            "productos":productos,
            cedenaUsuario:cadenaUsuario
        });//rem
    },
    
};

module.exports = mainController;