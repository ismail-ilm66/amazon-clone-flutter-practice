const express = require("express");
const auth = require("../middlewares/auth");
const { Product } = require("../models/product");
const User = require("../models/user");
const Order = require("../models/order");
const userRouter = express.Router();

// Function to add the Items to the Cart

userRouter.post("/api/add-to-cart", auth, async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findById(id);
    let user = await User.findById(req.userId);

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
        let p = user.cart.find((prod) => prod.product._id.equals(product._id));
        p.quantity = p.quantity + 1;
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

// To Delete Items From The Cart

userRouter.delete("/api/delete-from-cart/:id", auth, async (req, res) => {
  try {
    const { id } = req.params;
    let product = await Product.findById(id);
    let user = await User.findById(req.userId);

    for (let i = 0; i < user.cart.length; i++) {
      if (user.cart[i].product._id.equals(product._id)) {
        if (user.cart[i].quantity == 1) {
          user.cart.splice(i, 1);
        } else {
          user.cart[i].quantity -= 1;
        }
      }
    }

    user = await user.save();
    res.json(user);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

//Method To Add User Address
userRouter.post("/api/add-user-address", auth, async (req, res) => {
  try {
    const { address } = req.body;
    let user = await User.findById(req.userId);
    user.address = address;
    user = await user.save();
    res.json(user);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

//Method to get the user Orders
userRouter.post("/api/order", auth, async (req, res) => {
  try {
    const { cart, totalPrice, address } = req.body;
    let products = [];
    for (let i = 0; i < cart.length; i++) {
      const product = await Product.findById(cart[i].product._id);
      if (product.quantity >= cart[i].quantity) {
        product.quantity -= cart[i].quantity;
        products.push({ product, quantity: cart[i].quantity });
      } else {
        return res
          .status(400)
          .json({ msg: `${product.name} is Out Of Order!!` });
      }
    }
    let user = await User.findById(req.userId);

    user.cart = [];
    user = await user.save();

    let order = new Order({
      products,
      totalPrice,
      address,
      userId: req.userId,
      orderedAt: new Date().getTime(),
    });
    order = await order.save();
    res.json(order);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

userRouter.get("/api/order/me", auth, async (req, res) => {
  try {
    let orders = await Order.find({ userId: req.userId });
    res.json(orders);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = userRouter;
