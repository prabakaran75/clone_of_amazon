const express = require("express");
const adminRouter = express.Router();
const admin = require("../middlewares/adminMiddleware");
const Product = require("../models/product");

//Add Product
adminRouter.post("/admin/add-product", admin, async(req, res) => {
    try{
        const { name, desc, qty, price, category, images } = req.body;
        let product = new Product({
            name,
            desc,
            qty,
            price,
            category,
            images,
        });
        product = await product.save();
        res.json(product);
    } catch(e){
        res.status(500).json({ error: e.message });
    }
})

//Get all the product
adminRouter.get("/admin/get-product", admin, async(req, res) => {
    try{
        const product = await Product.find({});
        res.json(product);
    } catch(e){
        res.status(500).json({error: e.message});
    }
});

//Delete the product
adminRouter.post("/admin/delete-product", admin, async(req, res) => {
    try{
        const{id} = req.body;
        let product = await Product.findByIdAndDelete(id);
        res.json(product);
    } catch(e){
        res.status(500).json({error: e.message});
    }
});

module.exports = adminRouter;