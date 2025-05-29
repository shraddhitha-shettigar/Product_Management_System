# Product_Management_System


# 🛒 Product Management System

A web-based Java application to manage product inventory using JSP, Servlets, JDBC, and MySQL following the MVC architecture.

## 🚀 Features

- Add new products
- Update existing product details
- Delete obsolete products
- Display all products
- Generate reports:
  - Products with price greater than a value
  - Products by category
  - Top N products by quantity

## 🗄️ Database Structure

```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT
);
