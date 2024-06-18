import Comment from "../models/comment.js";

export const getallComments = async (req, res) => {
  try {
    const comments = await Comment.findAll();
    res.status(200).json(comments);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server Error" });
  }
};

export const getCommentById = async (req, res) => {
  try {
    const comment = await Comment.findOne({
      where: {
        id: req.params.id,
      },
    });
    if (comment) {
      res.status(200).json(comment);
    } else {
      res.status(404).json({ message: "Not Found" });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server Error" });
  }
};

export const getCommentsByPlaceId = async (req, res) => {
  try {
    const comments = await Comment.findAll({
      where: {
        place_id: req.params.place_id,
      },
    });
    if (comments.length > 0) {
      res.status(200).json(comments);
    } else {
      res.status(404).json({ message: "Not Found" });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server Error" });
  }
};

export const getCommentsByUserId = async (req, res) => {
  try {
    const comments = await Comment.findAll({
      where: {
        user_id: req.params.user_id,
      },
    });
    if (comments.length > 0) {
      res.status(200).json(comments);
    } else {
      res.status(404).json({ message: "Not Found" });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server Error" });
  }
};

// export const postComment = async (req, res) => {
//   try {
//     const ratingAlreadyExist = await Comment.findOne({
//       where: {
//           user_id: req.body.user_id,
//           place_id: req.body.place_id
//       }
//     });
//     const userRating = parseInt(req.body.user_rating);

//     if (ratingAlreadyExist) {
//       return res.status(400).json({ message: "Tempat sudah dirating oleh user." });
//     }
//     if (isNaN(userRating) || userRating < 1 || userRating > 10) {
//       return res.status(400).json({ message: "Rating harus berupa angka antara 1 sampai 10." });
//     }
//     if (req.body.user_comment.length > 100) {
//       return res.status(400).json({ message: "Komentar tidak boleh lebih dari 100 karakter." });
//     }
//     const comment = await Comment.create({
//       user_id: req.body.user_id,
//       event_id: req.body.event_id,
//       user_rating: userRating,
//       user_comment: req.body.user_comment,
//     }, { fields: ['user_id', 'event_id', 'user_rating', 'user_comment'] });
//     res.status(201).json(comment);
//   } catch (error) {
//     console.error(error);
//     res.status(500).json({ message: "Server Error" });
//   }
// };
export const postComment = async(req, res) =>{
  try {
      await Comment.create(req.body);
      res.status(201).json({msg: "komentar anda berhasil dibuat!"});
  } catch (error) {
      console.log(error.message);
  }
}


// export const deleteComment = async (req, res) => {
//   try {
//     const commentExist = await Comment.findOne({
//       where: {
//           id: req.params.id,
//       }
//     });
//     if (!commentExist) {
//       return res.status(400).json({ message: "Komentar anda telah dihapus!." });
//     }
//     await Comment.destroy({
//       where: {
//         id: req.params.id,
//       },
//     });
//     res.status(200).json({ message: "Komentar berhasil dihapus." });
//   } catch (error) {
//     console.error(error);
//     res.status(500).json({ message: "Server Error" });
//   }
// };

