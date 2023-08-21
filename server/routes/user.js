const express = require("express");
const auth = require("../middlewares/auth");
const { Product } = require("../models/product");
const User = require("../models/user");
const userRouter = express.Router();

userRouter.post("/api/add-to-cart", auth, async (req, res) => {
  try {
    const { id } = req.body;
    let product = Product.findById(id);
    let user = User.findById(req.userId);

    if (user.cart.length == 0) {
      user.cart.push({ product, quantity: 1 });
    } else {
      let prodFound = false;

      for (let i = 0; i < user.cart.length; i++) {
        if (user.cart[i].product._id.equals(product._id)) {
          prodFound = true;
        }
      }

      if (prodFound) {
        let p = user.cart.find((prod) => prod._id == product._id);
        p.quantity += 1;
      } else {
        user.cart.push({ product, quantity: 1 });
      }
    }
    user = await user.save();
    res.json(user);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = userRouter;
