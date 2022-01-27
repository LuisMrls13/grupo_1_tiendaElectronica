//html
//enviar los datos con los que vamos a responder
const path = require("path");
let fs = require('fs');

const filepath=path.join(__dirname,"../data/productos/productos.json");//leo mi base de datos
let productos =JSON.parse(fs.readFileSync(filepath, 'utf-8'));//la vuelvo un objeto

const productsController = {
    id:(req,res)=>{    
    let numId=parseInt(req.params.id)-1;
    res.render('./products/producto',{
        "title":productos[numId].Nombre,
        "cssObject":[],
        "producto":productos[numId]
    });
    },
    listado:(req,res)=>{
    
        res.render('./products/listado',{
            "title":"Listado de productos",
            "cssObject":[],
            "productos":productos
        });
     
    },
    createView:(req,res)=>{
        res.render("./products/create",{
            "title":"Crear Producto",
            "cssObject":[]
        });
    },
    create:(req,res)=>{
        let productoJson={ID:0,Nombre:"",Marca:"",Precio:"",Descripcion:"",Caracteristicas:"",Imagenes:[]};
        productoJson.ID=productos.length+1;
        productoJson.Nombre=req.body.nombre;
        productoJson.Marca=req.body.marca;
        productoJson.Precio=req.body.precio;
        productoJson.Descripcion= req.body.descripcion;//fs.readFileSync(path.join(__dirname,"../data/productos/descripciones/"+prodcuto1Arreglo[3]), 'utf-8');
        productoJson.Caracteristicas= req.body.caracteristicas;//fs.readFileSync(path.join(__dirname,"../data/productos/caracteristicas/"+prodcuto1Arreglo[4]), 'utf-8');
      
        productoJson.Imagenes.push(req.body.imagen);
        productos.push(productoJson);
        fs.writeFileSync(path.join(__dirname,"../data/productos/productos.json"), JSON.stringify(productos, null, ' '));

        res.redirect("/products/"+productoJson.ID);
    },
    editView:(req,res)=>{
       // res.send("Va a editar el articulo: "+ req.params.id);
       let numId=parseInt(req.params.id)-1;
       res.render('./products/editView',{
        "title":productos[numId].Nombre,
        "cssObject":[],
        "producto":productos[numId]
       });
    },
    edit:(req,res)=>{
        let id=parseInt(req.params.id)-1;
        
        //productos[id].ID=productos.length+1;
        productos[id].Nombre=req.body.nombre;
        productos[id].Marca=req.body.marca;
        productos[id].Precio=req.body.precio;
        productos[id].Descripcion= req.body.descripcion;//fs.readFileSync(path.join(__dirname,"../data/productos/descripciones/"+prodcuto1Arreglo[3]), 'utf-8');
        productos[id].Caracteristicas= req.body.caracteristicas;//fs.readFileSync(path.join(__dirname,"../data/productos/caracteristicas/"+prodcuto1Arreglo[4]), 'utf-8');
      
       // productoJson.Imagenes.push(req.body.imagen);
        //productos.push(productoJson);
        fs.writeFileSync(path.join(__dirname,"../data/productos/productos.json"), JSON.stringify(productos, null, ' '));

        res.redirect("/products/"+productoJson.ID);
    },
    delete:(req,res)=>{

        let id=parseInt(req.params.id);
         productos=productos.filter(function(item){
            
            return item.ID!=id;
           }
        );
        for(let i=0;i<productos.length;i++)
        {
            productos[i].ID=i+1;
        }
        fs.writeFileSync(path.join(__dirname,"../data/productos/productos.json"), JSON.stringify(productos, null, ' '));

        res.redirect("/");

    }
};

module.exports = productsController;