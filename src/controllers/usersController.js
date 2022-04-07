const db = require("../database/models");

const usersController = {
    registerView:(req,res)=>{
        res.render("./users/register");
    },
    registerStore:(req,res)=>
    {
        res.send("se va a registrar");
        db.Usuario.create({
            nombreUsuario: "Manuel",
            NombreCompleto: "manolito",
            fotoPerfil:"la fotos",
            miembroPlus:"0",
            email:"hola2@gmail.com",
            password: "manolo123"
            });
    },
    lista:(req,res)=>{
        db.Usuario.findAll()
        .then(function(usuariosdb){
            
            console.log(usuariosdb);
            res.send(usuariosdb);
        });
    }
    ,
    loginView:(req,res)=>{
        res.render("./users/login");
    },
    login:(req,res)=>{

        req.body.correo;
        
        db.Usuario.findOne({
            where:{
                email:req.body.correo
            }
        })
        .then((resultado)=>{
             
            
            if(resultado.password==req.body.contraseña){
                req.session.usuario=resultado.nombreUsuario;
                
                res.redirect("/");
            }
            else{
                res.redirect("/users/login");
            }
        
        
        }).catch((error)=>{
            res.redirect("/users/login");
        });

        
       
    }
};

module.exports = usersController;