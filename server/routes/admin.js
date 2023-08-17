const express = require("express");
const mongoose = require("mongoose");
const addProduct = require("../middlewares/admin");

const Product = require("../models/product");
const adminRouter = express.Router();

adminRouter.post("/admin/addProduct" , addProduct , async (req , res) => 
{
    try {
        const {name , description , imagesUrl , price , quantity , category , } = req.body;
        let product  =new Product({name , description , imagesUrl , price , quantity , category});
        product= await product.save();
        res.json(product);
    } catch (error) {
        res.status(500).json({error:error.message});
    }

}
);

//Getting all the Products
adminRouter.get("/admin/getProducts"  ,addProduct  ,async (req, res) => 
{
    try {
        const products = await Product.find({});
        res.json(products);
        
    } catch (error) {
        res.status(500).json({error : error.message});
        
    }
}
);

module.exports = adminRouter;