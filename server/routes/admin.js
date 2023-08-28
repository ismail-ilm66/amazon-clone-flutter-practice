const express = require("express");
const mongoose = require("mongoose");
const { Product } = require("../models/product");
const admin = require("../middlewares/admin");
const adminRouter = express.Router();
const Order = require("../models/order");

adminRouter.post("/admin/addProduct", admin, async (req, res) => {
  try {
    const { name, description, imagesUrl, price, quantity, category } =
      req.body;
    let product = new Product({
      name,
      description,
      imagesUrl,
      price,
      quantity,
      category,
    });
    product = await product.save();
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

//Getting all the Products
adminRouter.get("/admin/getProducts", admin, async (req, res) => {
  try {
    const products = await Product.find({});
    res.json(products);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

adminRouter.post("/admin/deleteProduct", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findByIdAndDelete(id);

    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

adminRouter.get("/admin/getOrders", admin, async (req, res) => {
  try {
    const orders = await Order.find({});
    res.json(orders);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

adminRouter.post("/admin/change-order-status", admin, async (req, res) => {
  try {
    const { id, status } = req.body;
    let order = await Order.findById(id);
    order.staus = status;
    order = await order.save();
    res.json(order);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

adminRouter.get("/admin/get-all-Earnings", admin, async (req, res) => {
  try {
    const orders = await Order.find({});
    let totalEarnings = 0;
    for (let i = 0; i < orders.length; i++) {
      totalEarnings += orders[i].totalPrice;
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
  let mobileEarnings = await fetchCategoryWiseProducts("Mobile");
  let essentialsEarnings = await fetchCategoryWiseProducts("Essentials");

  let appliancesEarnings = await fetchCategoryWiseProducts("Appliances");
  let bookEarnings = await fetchCategoryWiseProducts("Book");
  let fashionEarnings = await fetchCategoryWiseProducts("Fashion");
  let results = {
    totalEarnings,
    mobileEarnings,
    essentialsEarnings,
    appliancesEarnings,
    bookEarnings,
    fashionEarnings,
  };
  res.json(results);
});

async function fetchCategoryWiseProducts(category) {
  let earnings = 0;
  let categoryOrderProducts = await Order.find({
    "products.product.category": category,
  });
  for (let i = 0; i < categoryOrderProducts.length; i++) {
    for (let j = 0; j < categoryOrderProducts[i].products.length; j++) {
      if (categoryOrderProducts[i].products[j].category == category) {
        earnings +=
          categoryOrderProducts[i].products[j].product.price *
          categoryOrderProducts[i].products[j].quantity;
      }
    }
    return earnings;
  }
}
module.exports = adminRouter;
