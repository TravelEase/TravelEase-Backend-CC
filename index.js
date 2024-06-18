import express from "express";
import db from "./config/Database.js";
import dotenv from "dotenv";
import cookieParser from "cookie-parser";
import router from "./routes/routes.js";
dotenv.config();
const app = express();

try {
    await db.authenticate();
    console.log('Database Connected');
} catch (error) {
    console.error(error);
}

app.get('/', (req, res) => {
    res.send("I'm pretty good today")
})

app.use(cookieParser());
app.use(express.json());
app.use(router);
app.listen(process.env.PORT || 9000, ()=> console.log(`Server running on port 9000`));