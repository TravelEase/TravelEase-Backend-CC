import Itinerary from "../models/itinerary.js";

 //DONE CROSS CHECK
export const getItinerary = async (req, res) => {
    try {
        const itinerary = await Itinerary.findAll();
        res.status(200).json(itinerary);
      } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Server Error" });
      }
};



 //DONE CROSS CHECK
export const postItinerary = async(req, res) =>{
  try {
      await Itinerary.create(req.body);
      res.status(201).json({msg: "Rencana perjalanan anda berhasil dibuat!"});
  } catch (error) {
      console.log(error.message);
  }
}

 //DONE CROSS CHECK
export const deleteItinerary = async (req, res) => {
    try {
        const ItineraryExist = await Itinerary.findOne({
          where: {
              id: req.params.id,
          }
        });
        if (!ItineraryExist) {
          return res.status(400).json({ message: "Rencana Perjalanan anda telah dihapus!." });
        }
        await Itinerary.destroy({
          where: {
            id: req.params.id,
          },
        });
        res.status(200).json({ message: "Rencana Perjalanan berhasil dihapus." });
      } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Server Error" });
      }
    };

    //DONE CROSS CHECK
export const getItineraryById = async (req, res) => {
  try {
    const itinerary = await Itinerary.findOne({
      where: {
        id: req.params.id,
      },
    });
    if (itinerary) {
      res.status(200).json(itinerary);
    } else {
      res.status(404).json({ message: "Not Found" });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server Error" });
  }
};