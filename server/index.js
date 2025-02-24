//Import from packages
const express = require("express");
const mongoose = require("mongoose");

//Import from other files
const authRouter = require("./routes/auth.js");
const adminRouter = require("./routes/admin.js");
const productRouter = require("./routes/product.js");

//Init
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://Prabakaran:Praba%40786%23@cluster0.mn5fk.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
//@->%40 and #->%23

//Middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);

//Connections
mongoose
.connect(DB)
.then(() => {
    console.log("Connection Successfully");
})
.catch((e) => {
    console.log(e);
});

app.listen(PORT, '0.0.0.0', () => {
    console.log(`connected to port ${PORT}`);
});

