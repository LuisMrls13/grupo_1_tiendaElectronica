const db = require("../database/models");

const usersController = {
    registerView:(req,res)=>{
        let cadenaUsuario;
       if(req.session.usuario==undefined)
       cadenaUsuario="undefined";
       else
       cadenaUsuario=req.session.usuario;


        let leyendaUsuario;
        if(req.session.usuarioExistente==1)
        leyendaUsuario="Correo ya registrado";
        else
        leyendaUsuario="";
        res.render("./users/register",{leyenda:leyendaUsuario,cadenaUsuario:cadenaUsuario
        });
    },
    registerStore:(req,res)=>
    {
        req.session.usuarioExistente=undefined;
        
        db.Usuario.findOne({
            where:{
                email:req.body.email
            }
        })
        .then((resultado)=>{
            console.log(resultado);
            if (resultado==null)
            {
                db.Usuario.create({
                    nombreUsuario:req.body.username,
                    NombreCompleto: req.body.username,
                    fotoPerfil:"sin foto",
                    miembroPlus:"0",
                    email:req.body.email,
                    password: req.body.password
                    });
                req.session.usuario=req.body.username;
                req.session.nivel=0;
                req.session.usuarioExistente=undefined;
                res.redirect("/");
            }
            else{ 
            req.session.usuarioExistente=1;
            res.redirect("/users/register");
            } 

        }).catch((error)=>{
            req.session.usuarioExistente=1;
            
            res.redirect("/users/register");
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
        let cadenaUsuario;
       if(req.session.usuario==undefined)
       cadenaUsuario="undefined";
       else
       cadenaUsuario=req.session.usuario;
        res.render("./users/login",{cadenaUsuario:cadenaUsuario});
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
                req.session.nivel=resultado.miembroPlus;
                res.redirect("/");
            }
            else{
                res.redirect("/users/login");
            }
        }).catch((error)=>{
            res.redirect("/users/login");
        });

        
       
    },
    closeSesion:(req,res)=>{
        req.session.usuario=undefined;
        req.session.nivel=undefined;
                
        res.redirect("/");
    }
};

module.exports = usersController;