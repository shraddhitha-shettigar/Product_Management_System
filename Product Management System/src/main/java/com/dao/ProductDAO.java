package com.dao;
import java.sql.*;
import java.util.*;
import com.model.Product;

public class ProductDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/test";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_PRODUCT_SQL =
        "INSERT INTO products (ProductID, ProductName, Category, Price, Quantity) VALUES (?, ?, ?, ?, ?)";

    private static final String SELECT_ALL_PRODUCTS =
        "SELECT * FROM products";

    private static final String DELETE_PRODUCT_SQL =
        "DELETE FROM products WHERE ProductID = ?";

    private static final String UPDATE_PRODUCT_SQL =
        "UPDATE products SET ProductName = ?, Category = ?, Price = ?, Quantity = ? WHERE ProductID = ?";

    private static final String SELECT_BY_CATEGORY =
        "SELECT * FROM products WHERE Category = ?";

    private static final String SELECT_BY_PRICE =
        "SELECT * FROM products WHERE Price > ?";

    private static final String SELECT_TOP_PRODUCTS =
        "SELECT * FROM products ORDER BY Quantity DESC LIMIT ?";

    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException(e);
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public void addProduct(Product p) throws SQLException {
        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(INSERT_PRODUCT_SQL)) {
            stmt.setInt(1, p.getProductID());
            stmt.setString(2, p.getProductName());
            stmt.setString(3, p.getCategory());
            stmt.setDouble(4, p.getPrice());
            stmt.setInt(5, p.getQuantity());
            stmt.executeUpdate();
        }
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> list = new ArrayList<>();
        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_PRODUCTS);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Product p = new Product(
                    rs.getInt("ProductID"),
                    rs.getString("ProductName"),
                    rs.getString("Category"),
                    rs.getDouble("Price"),
                    rs.getInt("Quantity")
                );
                list.add(p);

                // Debug output for each product
                System.out.println("Fetched product: " + p.getProductID() + " - " + p.getProductName());
            }
        }

        // Debug total count
        System.out.println("Total products fetched from DB: " + list.size());
        return list;
    }

    public boolean deleteProduct(int id) throws SQLException {
        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(DELETE_PRODUCT_SQL)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean updateProduct(Product p) throws SQLException {
        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(UPDATE_PRODUCT_SQL)) {
            stmt.setString(1, p.getProductName());
            stmt.setString(2, p.getCategory());
            stmt.setDouble(3, p.getPrice());
            stmt.setInt(4, p.getQuantity());
            stmt.setInt(5, p.getProductID());
            return stmt.executeUpdate() > 0;
        }
    }

    public List<Product> getProductsByCategory(String category) throws SQLException {
        List<Product> list = new ArrayList<>();
        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(SELECT_BY_CATEGORY)) {
            stmt.setString(1, category);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    list.add(new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Category"),
                        rs.getDouble("Price"),
                        rs.getInt("Quantity")
                    ));
                }
            }
        }
        return list;
    }

    public List<Product> getProductsByPrice(double price) throws SQLException {
        List<Product> list = new ArrayList<>();
        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PRICE)) {
            stmt.setDouble(1, price);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    list.add(new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Category"),
                        rs.getDouble("Price"),
                        rs.getInt("Quantity")
                    ));
                }
            }
        }
        return list;
    }

    public List<Product> getTopNProducts(int n) throws SQLException {
        List<Product> list = new ArrayList<>();
        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(SELECT_TOP_PRODUCTS)) {
            stmt.setInt(1, n);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    list.add(new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Category"),
                        rs.getDouble("Price"),
                        rs.getInt("Quantity")
                    ));
                }
            }
        }
        return list;
    }
}
