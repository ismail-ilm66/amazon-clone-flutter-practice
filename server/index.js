const express = require("express");
const mongoose = require("mongoose");

const authRouter = require('./routes/auth');

const PORT = 3000;
const app = express();
const DB = 'mongodb+srv://ilm68265:Ilm5232513123.@cluster0.qrsjpjw.mongodb.net/?retryWrites=true&w=majority';

app.use(express.json());
app.use(authRouter);   

mongoose.connect(DB).then(()=>
{
    console.log('Connection Successful');
}).catch((e)=>
{
    console.log(e);
});

app.get("/hello-world", function (req, res) {
    res.json({ hi: "Hello World" });
});
app.listen(PORT, "0.0.0.0", () => {
    console.log('Connected at Port ' + PORT);
});