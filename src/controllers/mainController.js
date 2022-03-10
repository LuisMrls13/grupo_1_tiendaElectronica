const path = require("path");
let fs = require('fs');

const filepath=path.join(__dirname,"../data/productos/productos.json");
const productos =JSON.parse(fs.readFileSync(filepath, 'utf-8'));

const mainController = {
    index:(req,res)=>{
       // res.render("index2");

        res.render('home',{
            "productos":productos
        });//rem
    },
    login:(req,res)=>{
        res.render("login",{req});
    }
};

module.exports = mainController;