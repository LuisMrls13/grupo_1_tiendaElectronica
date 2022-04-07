module.exports=(sequelize,DataTypes)=>{
    let alias="Telefono";//nomnbre del modelo e plural
    
    let cols={
        idTelefono:{
            type: DataTypes.INTEGER,
            primaryKey:true,
            autoIncrement:true,
            allowNull:false
        }, 
        telefono:
        {
            type: DataTypes.STRING(15)
        },
        idUsuario:{
            type:DataTypes.INTEGER
        }
    };
    
    let config={
        tableName:"telefonos",
        timestamps:false//poner por que no puse create y update
    }
    
    
    const Telefono=sequelize.define(alias,cols,config);
    
    
    return Telefono;
    }