


module.exports=(sequelize,DataTypes)=>{
let alias="Usuario";//nomnbre del modelo e plural

let cols={
    id_usuarios:{
        type: DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true,
        allowNull:false
    }, 
nombreUsuario:
{
    type: DataTypes.STRING(45)
},
NombreCompleto:
{
    type: DataTypes.STRING(45)
}, 
fotoPerfil:
{
    type: DataTypes.STRING(45)
}, 
miembroPlus:{
    type: DataTypes.INTEGER
},
email:{
    type: DataTypes.STRING(45),
    unique: true
},
password:{
    type: DataTypes.STRING(45),
    allowNull:false
}

};

let config={
    tableName:"usuarios",
    timestamps:false//poner por que no puse create y update
}


const Usuario=sequelize.define(alias,cols,config);


return Usuario;
}