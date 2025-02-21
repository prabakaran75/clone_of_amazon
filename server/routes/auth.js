const express = require("express");
const bcryptjs = require("bcryptjs");
const User = require("../models/user");
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/authMidleware");

const authRouter = express.Router();

//Sign Up
authRouter.post("/api/signup", async (req,res) => {
    try{
    //get the data from client
    const {name, email, password} = req.body;
    //post that data in database
    const existingUser = await User.findOne({ email });
    if(existingUser){
        return res.status(400).json({ msg: "User with same email already exist!" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user =  new User({
        name,
        email,
        password: hashedPassword,
    });
    user = await user.save();
    res.json(user);
    }catch(e){
        res.status(500).json({ error: e.message });
    }
    //return that data to the user
});

//Sign In
authRouter.post("/api/signin", async (req,res) => {
    try{
        const {email, password} = req.body;
        const user = await User.findOne({ email });
        if(!user){
            return res.status(400).json({msg: "User with this email does not exist"});
        }
        const isMatched = await bcryptjs.compare(password, user.password);
        if(!isMatched){
            return res.status(400).json({msg: "Incorrect password"});
        }
        const token = jwt.sign({id: user._id}, "passwordKey");
        res.json({token, ...user._doc})
    } catch(e){
        res.status(500).json({error: e.message});
    }
})

//token
authRouter.post('/tokenIsValid', async (req, res) => {
    try{
        const token = req.header('x-auth-token');
        if(!token) return res.json(false);
        const verified =  await jwt.verify(token,"passwordKey");
        if(!verified) return res.json(false);
        const user = await User.findById(verified.id);
        if(!user) return res.json(false);
        res.json(true);
    }catch(e){
        res.status(500).json({error: e.message});
    }
})

//Fetch user data
authRouter.get('/', auth, async(req,res) => {
    const user = await User.findById(req.user);
    res.json({...user._doc, token: req.token});
})

module.exports = authRouter;