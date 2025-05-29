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

@WebServlet("/generateReport")
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");

        try {
            List<Product> products = null;

            switch (reportType) {
                case "price":
                    double priceThreshold = Double.parseDouble(request.getParameter("priceThreshold"));
                    products = productDAO.getProductsByPrice(priceThreshold);
                    request.setAttribute("criteria", "Products with price greater than " + priceThreshold);
                    break;
                case "category":
                    String category = request.getParameter("category");
                    products = productDAO.getProductsByCategory(category);
                    request.setAttribute("criteria", "Products in category: " + category);
                    break;
                case "top":
                    int topN = Integer.parseInt(request.getParameter("topN"));
                    products = productDAO.getTopNProducts(topN);
                    request.setAttribute("criteria", "Top " + topN + " products by quantity");
                    break;
                default:
                    request.setAttribute("message", "Invalid report type selected.");
                    break;
            }

            request.setAttribute("products", products);
        } catch (SQLException e) {
            request.setAttribute("message", "Database error: " + e.getMessage());
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid input: " + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("report_result.jsp");
        dispatcher.forward(request, response);
    }
}
