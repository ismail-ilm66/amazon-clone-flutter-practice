const express = require("express");
const bcryptjs = require("bcryptjs");

const User = require("../models/user");

const authRouter = express.Router();



authRouter.post('/auth/signup' , async (req , res)=>
{
    try
    {
        const {name , email , password} = req.body;

        const exisitingUser = await  User.findOne({email});
        if(exisitingUser)
        {
         return res.status(400).json({msg:'user with mail already exists'});
        }
        const hashedPassword =await bcryptjs.hash(password ,8);
        let user =new User({name,email ,password: hashedPassword });
        user = await user.save();  
        res.json(user);
     
    }
    catch(e)
    {
        res.status(500).json({error:e.message});
    }
});

module.exports = authRouter; 