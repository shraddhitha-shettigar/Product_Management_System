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


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT
);


## 📁 Project Structure

```ProductWebApp/
├── WebContent/
│   ├── index.jsp
│   ├── productadd.jsp
│   ├── productupdate.jsp
│   ├── productdelete.jsp
│   ├── productdisplay.jsp
│   ├── reports.jsp
│   ├── report_form.jsp
│   └── report_result.jsp
├── src/
│   ├── com/
│   ├── dao/
│   │   └── ProductDAO.java
│   ├── model/
│   │   └── Product.java
│   └── servlet/
│       ├── AddProductServlet.java
│       ├── UpdateProductServlet.java
│       ├── DeleteProductServlet.java
│       ├── DisplayProductsServlet.java
│       ├── ReportServlet.java
│       └── ReportCriteriaServlet.java
└── WEB-INF/
    └── web.xml
```

## ⚙️ Technologies Used

- **Java (JDK 8+)**
- **JSP & Servlets**
- **JDBC**
- **MySQL**
- **Apache Tomcat (9+)**
- **HTML/CSS**

## 🖼️ Output Screenshots

### 🏠 Home Page
!(screenshots/index.png)

### ➕ Add Product
![Add Product](screenshots/productadd.png)

### 📝 Update Product
![Update Product](screenshots/productupdate.png)

### ❌ Delete Product
![Delete Product](screenshots/productdelete.png)

### 📋 Display Products
![Display Products](screenshots/productdisplay.png)

### 📊 Generate Reports
![Generate Reports](screenshots/reports.png)

