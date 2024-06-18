import Users from "../models/user.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
 
//DONE CROSS CHECK
export const getUsers = async (req, res) => {
    try {
      const users = await Users.findAll({
        attributes: ['id', 'username', 'email', 'age', 'location']
      });
      res.json(users);
    } catch (error) {
      console.log(error);
    }
  }
  export const getUsersById = async(req,res) => {
    const id = req.params.id;
    try {
        const user = await Users.findByPk(id, {
            attributes:[
                'id',
                'username',
                'email',
                'age',
                'location',
            ]
        });
        if (!user) {
            res.status(404).json({msg:"User not found."});
        } else {
            res.json(user);
        }
    } catch (error) {
        console.log(error);
        res.status(500).json({msg:"Server error."});
    }
  }
  //DONE CROSS CHECK
  export const Register = async(req, res) => {
    const { username, email, password, confPassword, age, location } = req.body;
    if(password !== confPassword) return res.status(400).json({msg: "Password dan Confirm Password tidak cocok"});
    const salt = await bcrypt.genSalt();
    const hashPassword = await bcrypt.hash(password, salt);
    try {
        await Users.create({
            username: username,
            email: email,
            password: hashPassword,
            age: age,
            location: location,

        });
        res.json({msg: "Register Berhasil"});
    } catch (error) {
        console.log(error);
    }
}


//  DONE CROSS CHECK
export const Login = async(req, res) => {
    try {
        const user = await Users.findAll({
            where:{
                email: req.body.email
            }
        });
        const match = await bcrypt.compare(req.body.password, user[0].password);
        if(!match) return res.status(400).json({msg: "Wrong Password"});
        const userId = user[0].id;
        const name = user[0].name;
        const email = user[0].email;
        const accessToken = jwt.sign({userId, name, email}, process.env.ACCESS_TOKEN_SECRET,{
            expiresIn: '20s'
        });
        const refreshToken = jwt.sign({userId, name, email}, process.env.REFRESH_TOKEN_SECRET,{
            expiresIn: '1d'
        });
        await Users.update({refresh_token: refreshToken},{
            where:{
                id: userId
            }
        });
        res.cookie('refreshToken', refreshToken,{
            httpOnly: true,
            maxAge: 24 * 60 * 60 * 1000
        });
        res.json({ userId, accessToken });
    } catch (error) {
        res.status(404).json({msg:"Email tidak ditemukan"});
    }
}

 
 //DONE CROSS CHECK
export const Logout = async(req, res) => {
    const refreshToken = req.cookies.refreshToken;
    if(!refreshToken) return res.sendStatus(204);
    const user = await Users.findAll({
        where:{
            refresh_token: refreshToken
        }
    });
    if(!user[0]) return res.sendStatus(204);
    const userId = user[0].id;
    await Users.update({refresh_token: null},{
        where:{
            id: userId
        }
    });
    res.clearCookie('refreshToken');
    return res.sendStatus(200);
}