module.exports=(sequelize,DataTypes)=>{
    let alias="Direccion";//nomnbre del modelo e plural
    
    let cols={
        idDirections:{
            type: DataTypes.INTEGER,
            primaryKey:true,
            autoIncrement:true,
            allowNull:false
        }, 
        Direction:
        {
            type: DataTypes.STRING(100)
        },
        idUser:{
            type:DataTypes.INTEGER
        }
    };
    
    let config={
        tableName:"directions",
        timestamps:false//poner por que no puse create y update
    }
    
    
    const Direccion=sequelize.define(alias,cols,config);
    
    
    return Direccion;
    }