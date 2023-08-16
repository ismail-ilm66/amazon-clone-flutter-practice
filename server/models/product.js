const mongoose = require('mongoose');

const productSchema  = mongoose.Schema  (
    {
        name :
        {
            require: true , 
            type: String , 
            trim : true,
        },
        description :
        {
            require: true , 
            type: String , 
            trim : true,
        },

        imagesUrl:[
            {
             require: true , 
             type: String ,
            }
        ],
        
        quantity :
        {
            require: true , 
            type: Number , 
        },
        price :
        {
            require: true , 
            type: Number , 
        },
        category :
        {
            require: true , 
            type: String , 
            trim : true,
        },
       
    }
    );
    const Product = mongoose.model('Product' , productSchema);
    module.exports = Product;