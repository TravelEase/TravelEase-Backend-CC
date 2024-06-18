import express from "express";
import { getUsers, getUsersById, Register, Login, Logout } from "../controllers/users.js";
import { verifyToken } from "../middleware/VerifyToken.js";
import { refreshToken } from "../controllers/RefreshToken.js";
import { getAllPlaces, getPlaceById } from "../controllers/place.js";
import { getItinerary, getItineraryById, postItinerary, deleteItinerary } from "../controllers/itinerary.js";
import { getallComments, postComment } from "../controllers/comment.js";
import { multer, getAllImgByUser, getImageByid, getUploadedImageByUsername, uploadByUser } from '../controllers/image.js';

 
const router = express.Router();

//Auth
router.get('/users', getUsers);
router.get('/users/:id', getUsersById);
router.post('/register', Register);
router.post('/login', Login);
router.get('/token', refreshToken);
router.delete('/logout', Logout);

//Places
router.get("/places", getAllPlaces);
router.get("/places/:id", getPlaceById);

// Itinerary Routes
router.get("/itinerary", getItinerary);
router.get("/itinerary/:id", getItineraryById);
router.post("/itinerary", verifyToken, postItinerary);
router.delete("/itinerary/:id",verifyToken, deleteItinerary);

// // Comment
router.get("/users/:user_id/comments", verifyToken, getallComments);
router.post("/users/:user_id/comments",verifyToken,  postComment);

// //Image Users
router.post('/image', multer, uploadByUser);
router.get('/image',  getAllImgByUser);
router.get('/image/:id', verifyToken, getImageByid);
router.get('/imageuser', verifyToken, getUploadedImageByUsername);

export default router;