const express = require('express');
const mainroutes= require("./routes/main");

var cors = require('cors')
//const loginRoutes=require("./routes/login");
const productsRoutes=require("./routes/products");
const usersRoutes=require("./routes/users");
const usersApi=require("./routes/apis/usersApiRouter");
const productsApi=require("./routes/apis/productsApiRouter");
const methodOverride = require('method-override');
const session = require('express-session');


//para middleware global
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

app.use(session( {secret: "Nuestro mensaje secreto"}));

app.use(cors())


app.listen(3001, ()=>{
    console.log('Servidor funcionando');
});

app.use("/",mainroutes);
app.use("/users",usersRoutes);
app.use("/products",productsRoutes);
app.use("/api/users",usersApi);
app.use("/api/products",productsApi);
//app.use("/login",loginRoutes);
