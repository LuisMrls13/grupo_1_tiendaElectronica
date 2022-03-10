const path = require("path");
let fs = require('fs');

const filepath=path.join(__dirname,"../data/productos/productos.json");
const productos =JSON.parse(fs.readFileSync(filepath, 'utf-8'));

console.log(productos[2].Nombre);