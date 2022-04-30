const db = require("../../database/models");

const usersApiController={
    lista: function (req,res) {
        
        db.Usuario.findAll()
        .then(function(usuariosdb){
           
            let info={count:usuariosdb.length,users:[]};
            
            let diasnuevo=usuariosdb.map(function(item,index,array)//con esto pasamos el valor a otra memoria
            { 
                return  {id:item.id_usuarios,
                         name:item.nombreUsuario,
                         email:item.email,
                         detail:"/api/users/"+item.id_usuarios
                };
            });
            info.users=diasnuevo;
            
            res.json(info);
        })
        .catch(error => res.json(error));
    },
    infouser:(req,res)=>{
        console.log(req.params.id);
        db.Usuario.findOne({
            where:{
                id_usuarios:req.params.id
            }
        })
        .then((resultado)=>{
           let usuario={
               id:resultado.id_usuarios,
               nombreUsuario:resultado.nombreUsuario,
               NombreCompleto:resultado.NombreCompleto,
               fotoPerfil:resultado.fotoPerfil,
               email:resultado.email
           };
           res.json(usuario);
        }).catch((error)=>{
            res.json("error: Usuario no definido")
        });
    }
    
}

module.exports = usersApiController;