const path = require("path");
let fs = require('fs');

const filepath=path.join(__dirname,"../../data/productos/productos.json");//leo mi base de datos
let productos =JSON.parse(fs.readFileSync(filepath, 'utf-8'));//la vuelvo un objeto

const productsApiController={
    lista: function (req,res) {
        let info={
            count:productos.length,
            countByCategory:["Gamer","Basico","Diseño"],
            products:[]};
        let diasnuevo=productos.map(function(item)//con esto pasamos el valor a otra memoria
            { 
                return  {
                    ID:item.ID,
                    Nombre:item.Nombre,
                    Marca:item.Marca,
                    Precio:item.Precio,
                    Descripcion:item.Descripcion,
                    Caracteristicas:item.Caracteristicas,
                    Imagenes:item.Imagenes,
                    url:"/api/products/"+item.ID
                };
            });
            info.products=diasnuevo;
            console.log("Envie info");
            res.json(info);
    },
    productoInfo:(req,res)=>{
        let productoMos=productos.filter(function(item){
            return item.ID==req.params.id;
           }
        ); 
        if(productoMos.length==0)
        {
            res.json("Producto no encontrado");
        }
        else
        {
            res.json(productoMos[0]);
        }
    }
}

module.exports = productsApiController;