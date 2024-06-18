import { Sequelize } from "sequelize";
import db from "../config/Database.js";

const { DataTypes } = Sequelize;
const Comment = db.define(
  "comments",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: "users",
        key: "id",
      },
    },
    place_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: "places",
        key: "id",
      },
    },
    user_comment: {
        type: DataTypes.TEXT,
        allowNull: true,
      },
    user_rating: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
  },
  {
    freezeTableName: true,
    timestamps: false,
  }
);

export default Comment;
