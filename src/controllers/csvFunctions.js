const path = require("path");
let fs = require('fs');
//info sobre la lectura de archivos => https://desarrolloweb.com/articulos/lectura-archivos-nodejs.html


let csvFunctions = {
    leerCSV: function(ruta) {
        ruta= path.join(__dirname, ruta);
        
        let productosCSV = fs.readFileSync(ruta, 'utf-8');
        this.crearBaseJson(productosCSV);
    },
    escribirJSON: function (tareas) {
        fs.writeFileSync(path.join(__dirname,"../data/productos/productos.json"), JSON.stringify(tareas, null, ' '));
    },
    crearBaseJson: function(cadenaProductos){
        let arregloProguctos =cadenaProductos.split("\r\n");

        let  baseJS=[];
        for(let i=1;i<arregloProguctos.length-1;i++)
        {
           let productoJson={ID:0,Nombre:"",Marca:"",Precio:"",Descripcion:"",Caracteristicas:"",Imagenes:[]};
           let prodcuto1Arreglo=arregloProguctos[i].split(",");
           productoJson.ID=i;
           productoJson.Nombre=prodcuto1Arreglo[0];
           productoJson.Marca=prodcuto1Arreglo[1];
           productoJson.Precio=prodcuto1Arreglo[2];
           //productoJson.Descripcion=prodcuto1Arreglo[3];
           productoJson.Descripcion= fs.readFileSync(path.join(__dirname,"../data/productos/descripciones/"+prodcuto1Arreglo[3]), 'utf-8');
           //productoJson.Caracteristicas=prodcuto1Arreglo[4];
        //   productoJson.Descripcion=productoJson.Descripcion.replace(/\r\n/g,"<br>");

           productoJson.Caracteristicas= fs.readFileSync(path.join(__dirname,"../data/productos/caracteristicas/"+prodcuto1Arreglo[4]), 'utf-8');
           productoJson.Caracteristicas=productoJson.Caracteristicas.replace(/,/g,":");
          // productoJson.Caracteristicas=productoJson.Caracteristicas.replace(/\r\n/g,"<br>");
           for(let a=5;a<prodcuto1Arreglo.length-1;a++)
           {
               if(prodcuto1Arreglo[a]!="")
               productoJson.Imagenes.push(prodcuto1Arreglo[a]);
           }
           baseJS.push(productoJson);
        }
        this.escribirJSON(baseJS);
    }

};

module.exports = csvFunctions;