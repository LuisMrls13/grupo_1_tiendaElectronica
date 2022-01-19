const express = require('express');
const mainroutes= require("./routes/main");
const loginRoutes=require("./routes/login");
const productsRoutes=require("./routes/products");



const app = express();

app.set('view engine', 'ejs');
app.set('views', './src/views');
app.use(express.static('public'));


app.listen(3000, ()=>{
    console.log('Servidor funcionando');
});

app.use("/",mainroutes);
app.use("/products",productsRoutes);
app.use("/login",loginRoutes);
