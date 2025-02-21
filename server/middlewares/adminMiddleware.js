const jwt = require("jsonwebtoken");
const User = require("../models/user");

const admin = async (req, res, next) => {
    try{
        const token = await req.header("x-auth-token");
        if(!token) return res.status(401).json({msg:"No token, access denied!"});
        const verified = await jwt.verify(token,"passwordKey");
        if(!verified) return res.status(401).json({msg:"Verfification failed, authorization failed!"});
        const user = await User.findById(verified.id);
        if(user.type == "user" || user.type == "seller"){
            return res.status(401).json({msg: "Your not a Admin!"});
        }
        req.id = verified.id;
        req.token = token;
        next();
    }catch(e){
        res.status(500).json({error: e.message});
    }
}

module.exports = admin;