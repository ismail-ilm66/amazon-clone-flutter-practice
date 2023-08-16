const jwt = require('jsonwebtoken');
const User = require('../models/user');

const addProduct = (req , res , next)=>
{
try
{
    const token = req.header("x-auth-token");
    if(!token) return res.status(401).json({msg: "No Auth Token Access Denied"});
    const verified = jwt.verify(token , "passwordKey");
    if(!verified) return res.json({msg:'Token Verification failed , Authorization Denied'});
    const user = User.findById(verified.id);
    if(user.type == 'user' || user.type == 'seller')
    {
        return res.status(401).json({msg: "You are not Admin"})
    }
    req.userId = verified.id;
    req.token = token;
    next();
}

catch(e)
{
    res.status(500).json({error: e.message});
}
}

module.exports = addProduct;