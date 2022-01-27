const path = require("path");
let fs = require('fs');

const filepath=path.join(__dirname,"../data/productos/productos.json");
const productos =JSON.parse(fs.readFileSync(filepath, 'utf-8'));

const mainController = {
    index:(req,res)=>{
        res.render('index',{
            "title":"TomyMoly|Home",
            "cssObject":["index.css"],
            "productos":productos
        });
    },
    login:(req,res)=>{
        res.render("login",{req});
    }
};

module.exports = mainController;