// mongodb_operations.js
// FlexiMart - MongoDB Operations
// Database: fleximart
// Collection: products

// -------------------------------
// Operation 1: Load Data 
// -------------------------------

// Run this command in terminal (outside Mongo shell):
// mongoimport --db fleximart --collection products --file products_catalog.json --jsonArray

// -------------------------------
// Operation 2: Basic Query 
// Find all Electronics products with price < 50000
// Return only: name, price, stock
// -------------------------------

db.products.find(
  {
    category: "Electronics",
    price: { $lt: 50000 }
  },
  {
    _id: 0,
    name: 1,
    price: 1,
    stock: 1
  }
);

// -------------------------------
// Operation 3: Review Analysis 
// Find products with average rating >= 4.0
// Use aggregation on reviews array
// -------------------------------

db.products.aggregate([
  {
    $addFields: {
      avg_rating: { $avg: "$reviews.rating" }
    }
  },
  {
    $match: {
      avg_rating: { $gte: 4.0 }
    }
  },
  {
    $project: {
      _id: 0,
      product_id: 1,
      name: 1,
      avg_rating: 1
    }
  }
]);

// -------------------------------
// Operation 4: Update Operation 
// Add a new review to product ELEC001
// -------------------------------

db.products.updateOne(
  { product_id: "ELEC001" },
  {
    $push: {
      reviews: {
        user: "U999",
        rating: 4,
        comment: "Good value",
        date: new Date()
      }
    }
  }
);

// -------------------------------
// Operation 5: Complex Aggregation 
// Calculate average price by category
// Return: category, avg_price, product_count
// Sort by avg_price descending
// -------------------------------

db.products.aggregate([
  {
    $group: {
      _id: "$category",
      avg_price: { $avg: "$price" },
      product_count: { $sum: 1 }
    }
  },
  {
    $project: {
      _id: 0,
      category: "$_id",
      avg_price: { $round: ["$avg_price", 2] },
      product_count: 1
    }
  },
  {
    $sort: { avg_price: -1 }
  }
]);
