package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/displayProducts")
public class DisplayProductsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Product> productList = productDAO.getAllProducts();

            // Debugging output
            System.out.println("Fetched product list size: " + productList.size());
            for (Product p : productList) {
                System.out.println(p.getProductID() + " - " + p.getProductName());
            }

            request.setAttribute("productList", productList);
        } catch (SQLException e) {
            request.setAttribute("message", "Database error: " + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("productdisplay.jsp");
        dispatcher.forward(request, response);
    }

}
