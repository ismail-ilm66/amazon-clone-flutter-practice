# amazon_clone

Full Stack Amazon Clone With Admin Panel. Practice app made by the Course Of @RivaanRanawat.

## Key Features

### User Authentication:

Securely log in with your email and password.

### Persistent Authentication:

Stay logged in across sessions for a seamless experience.

### Product Search:

Quickly find products with a powerful search feature.

### Category Filters:

Refine your search by category to discover items easily.

### Product Details:

Get comprehensive information on product specifications.

### User Ratings:

Share your feedback and view product ratings from others.

### Deal of the Day:

Grab exclusive daily deals and discounts.

### Shopping Cart:

Add items to your cart for convenient shopping.

### Effortless Checkout:

Use Google or Apple Pay for a smooth payment process.

### Order History:

Track and view your previous orders at any time.

### Order Details:

Dive into order specifics and check real-time status updates.

### Logout:

Log out securely to protect your account.

### Admin Control Panel:

Access an administrative dashboard for managing your store.

### Product Management:

Add, remove, or modify products with ease.

### Order Management:

Monitor orders, change order statuses, and track earnings.

### Earnings Overview:

Get a quick snapshot of your store's total earnings.

### Category Analytics:

Visualize earnings data with easy-to-read graphs.

These features provide a comprehensive overview of your application's capabilities, enhancing the user experience and facilitating efficient store management for administrators.

## Initializing The Project:

First of all create the MongoDB Project And Cluster
Now Add the link of the cluster in the server/index file infront of the DB variable
Now in the global_variables files in lib/constants/ replce uri with the yourIPAddress:port the port is 3000 by default you can change it.
Create Cloudinary Project, enable unsigned operation in settings
Head to lib/features/admin/services/admin_services.dart, replace two empty fields with with your Cloud Name and Upload Preset respectively.

## Running App

Now to run the App go to the terminal and use the following commands
cd server
npm install
npm run dev

## Technologies Used

Server: Node.js, Express, Mongoose, MongoDB, Cloudinary

Client: Flutter, Provider
