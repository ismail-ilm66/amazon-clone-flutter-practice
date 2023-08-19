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

productsRouter.get("/api/products/search/:name", auth , async (req , res) => 
{
try {
    const products = await Product.find(
        {
            name:{$regex : req.params.name , $options: "i",},
        });
    res.json(products);  
} catch (error) {
    res.status(500).json({error: error.message});
}
}
);

module.exports = productsRouter;