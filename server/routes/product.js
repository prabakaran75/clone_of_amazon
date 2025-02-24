const express = require("express")
const productRouter = express.Router();
const auth = require("../middlewares/authMidleware")
const Product = require("../models/product")
//query -> ?
//params -> :
productRouter.get("/api/products", auth, async(req, res) => {
    try{
        console.log(req.query.category);
        const products = await Product.find({category: req.query.category});
        res.json(products);
    }catch(e){
        res.status(500).json({error:e.message});
    }
});

//Create a get request for search a product
productRouter.get("/api/products/search/:name", auth, async(req, res) => {
    try{
        const products = await Product.find({
            name: {$regex: req.params.name, $options: "i"},
        });
        res.json(products);
    }catch(e){
        res.status(500).json({error: e.message});
    }
});

module.exports = productRouter;