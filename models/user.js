import { DataTypes} from 'sequelize';
import db from '../config/Database.js';


const Users = db.define('users', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    username:{
        type: DataTypes.STRING(20),
        unique: true
    },
    email:{
        type: DataTypes.STRING(100),
        unique: true
    },
    password:{
        type: DataTypes.STRING(200)
    },
    age: {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    location: {
        type: DataTypes.STRING(255),
        allowNull: true
    },
    refresh_token:{
        type: DataTypes.TEXT
    }
}, {
    freezeTableName: true
});

export default Users;


 
(async()=>{
    await db.sync();
})();    