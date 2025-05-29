package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String name = request.getParameter("productName");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            Product product = new Product(productId, name, category, price, quantity);
            boolean success = productDAO.updateProduct(product);

            if (success) {
                request.setAttribute("message", "Product updated successfully!");
            } else {
                request.setAttribute("message", "Product not found or update failed.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid input format: " + e.getMessage());
        } catch (SQLException e) {
            request.setAttribute("message", "Database error: " + e.getMessage());
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("productupdate.jsp");
        dispatcher.forward(request, response);
    }
}
