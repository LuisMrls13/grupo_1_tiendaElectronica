module.exports=(sequelize,DataTypes)=>{
    let alias="MetodoPago";//nomnbre del modelo e plural
    
    let cols={
        idmetodoPago:{
            type: DataTypes.INTEGER,
            primaryKey:true,
            autoIncrement:true,
            allowNull:false
        }, 
        nombreTitular:
        {
            type: DataTypes.STRING(100)
        },
        numeroTarjeta:
        {
            type: DataTypes.STRING(17)
        },
        fechaVencimiento:
        {
            type: DataTypes.STRING(45)
        },
        id_User:{
            type:DataTypes.INTEGER
        }
    };
    
    let config={
        tableName:"metodo_pago",
        timestamps:false//poner por que no puse create y update
    }
    
    
    const MetodoPago=sequelize.define(alias,cols,config);
    
    
    return MetodoPago;
    }