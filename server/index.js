const express = require("express");
const mongoose = require("mongoose");

const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productsRouter = require("./routes/products");
const userRouter = require("./routes/user");

const PORT = 3000;
const app = express();
// Add the Mongoose database link to link your project to the cluster you created
const DB = "";

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productsRouter);
app.use(userRouter);

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.get("/hello-world", function (req, res) {
  res.json({ hi: "Hello World" });
});

app.listen(PORT, "0.0.0.0", () => {
  console.log("Connected at Port " + PORT);
});
