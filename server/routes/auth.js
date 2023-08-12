const express = require("express");
const bcryptjs = require("bcryptjs");

const User = require("../models/user");
const jwt = require("jsonwebtoken");

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
     return res.json(user);
     
    }
    catch(e)
    {
      return  res.status(500).json({error:e.message});
        
    }
});

//Sign In Route..

authRouter.post
(
    '/auth/signin' , async (req , res)=>
{
    try
    {
        const {email , password } = req.body;
        const user  = await User.findOne({email});
        if(!user)
        {
            
        console.log('User Not Found');
        return res.status(400).json({msg:"User With This Email is Not Found Not Found"});

            
        }
        
            
        const isMatched = await bcryptjs.compare(password ,user.password);
        if(!isMatched)
        {
            return res.status(400).json({msg:"Wrong Password!!"});
        }    
        
       const token =  await jwt.sign({id:user._id},"passwordKey");
           return res.json({token , ...user._doc});
            
        
        
    }
    catch (e)
    {
        res.status(500).json({error:e.message});
    }
} 
);

module.exports = authRouter; 