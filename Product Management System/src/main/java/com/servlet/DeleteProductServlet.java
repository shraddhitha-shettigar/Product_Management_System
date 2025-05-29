package com.servlet;

import com.dao.ProductDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            boolean success = productDAO.deleteProduct(productId);

            if (success) {
                request.setAttribute("message", "Product deleted successfully!");
            } else {
                request.setAttribute("message", "Product not found or deletion failed.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid Product ID format: " + e.getMessage());
        } catch (SQLException e) {
            request.setAttribute("message", "Database error: " + e.getMessage());
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("productdelete.jsp");
        dispatcher.forward(request, response);
    }
}
