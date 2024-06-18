import { Sequelize } from 'sequelize';
import dotenv from 'dotenv';

dotenv.config();

const db = new Sequelize("travelease_db1", "root", "", {
  host: "localhost",
  dialect: 'mysql'
});

export default db;
