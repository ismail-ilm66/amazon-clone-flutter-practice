const express = require("express");
const auth = require("../middlewares/auth");
const Product = require("../models/product");


const productsRouter  = express.Router();

productsRouter.get('/api/products' , auth ,async (req , res )  =>  
{
try {
    let products = await Product.find({category:req.query.category});
    res.json(products); 
} catch (error) {
    res.status(500).json({error: e.message});
}
}
);

module.exports = productsRouter;