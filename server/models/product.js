const mongoose = require("mongoose");
const ratingSchema = require("./rating");

const productSchema = mongoose.Schema({
    name: {
        type: String,
        require: true,
        trim: true,
    },
    desc: {
        type: String,
        require: true,
    },
    qty: {
        type: Number,
        require: true,
    },
    price: {
        type: Number,
        require: true,
    },
    category: {
        type: String,
        require: true,
    },
    images: [
        {
            type: String,
            require: true,
        },
    ],
    ratings: [ratingSchema]
});

const Product = mongoose.model("Product", productSchema);
module.exports = Product;