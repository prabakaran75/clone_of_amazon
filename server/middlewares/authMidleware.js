const jwt = require("jsonwebtoken");

const auth = async (req,res,next) => {
    try{
        const token = await req.header("x-auth-token");
        if(!token) return res.status(401).json({msg: "No auth token, access denied!"});
        const verified = await jwt.verify(token,"passwordKey");
        if(!verified)return res.status(401).json({msg: "Token verification failed, authorization denied"});
        req.user = verified.id;
        req.token = token;
        next();
    } catch(e){
        res.status(500).json({error:e.message});
    }
}

module.exports = auth;