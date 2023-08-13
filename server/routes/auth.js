const express = require("express");
const bcryptjs = require("bcryptjs");

const User = require("../models/user");
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");

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

// for checking if the token is valid or not

authRouter.post('/isValidToken' , async (req , res) => 
{
    try 
    {
        const token = req.header('x-auth-token');
        if(!token) return res.json(false);
       const verified =  jwt.verify(token , "passwordKey");
       if(!verified) return res.json(false);
       const user =     await User.findById(verified.id);
       if(!user) return res.json(false);
       res.json(true);
    }
    catch (e)
    {
        res.status(500).json({error:e.message});

    }
}
);

//Method for getting the User Data

authRouter.get("/" , auth , async (req , res) => 
{
    const user = await User.findById(req.userId);
    res.json({...user._doc , token: req.token});

}
);

module.exports = authRouter; 