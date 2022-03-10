const express = require('express');
const mainroutes= require("./routes/main");
const loginRoutes=require("./routes/login");
const productsRoutes=require("./routes/products");
const methodOverride = require('method-override');

//var logMiddleware=require("./middlewares/logMiddleware");

const app = express();


app.set('view engine', 'ejs');
app.set('views', './src/views');

//app.use(logMiddleware);

//para poder trabajar con los datos que vana en el body
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

//linea para aceptar metodo PUT Y DELETE
app.use(methodOverride('_method'));

app.use(express.static('public'));


app.listen(3000, ()=>{
    console.log('Servidor funcionando');
});

app.use("/",mainroutes);
app.use("/products",productsRoutes);
app.use("/login",loginRoutes);
