const mongoose = require("mongoose");
const { productSchema } = require("./product");

const userSchema = mongoose.Schema({
  name: { required: true, type: String, trim: true },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Please Enter a valid Email Address",
    },
  },
  password: {
    required: true,
    type: String,
    validator: (value) => {
      if (value.length > 6) {
        return;
      }
    },
    message: "Please Enter a valid Email Address",
  },

  address: {
    type: String,
    default: "",
  },

  type: {
    type: String,
    default: "user",
  },
  cart: [
    { product: productSchema, quantity: { type: Number, required: true } },
  ],
});

const User = mongoose.model("User", userSchema);
module.exports = User;
