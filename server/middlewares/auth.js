const jwt = require('jsonwebtoken');


const auth = async (req , res , next) =>
{
try
{
const token = req.header("x-auth-token");

if(!token) return res.status(401).json({msg:"No auth Token Access Denied."});
    const verified =  jwt.verify(token , "passwordKey");
       if(!verified) return res.json({msg:'Token Verification failed , Authorization Denied'});

       req.userId = verified.id;
       req.token = token;

       next();
}
catch (e)
{
    res.status(500).json({error : e.message,});
}
}
module.exports = auth;