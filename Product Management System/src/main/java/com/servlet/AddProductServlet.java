package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {
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

        Product newProduct = new Product(productId, name, category, price, quantity);
        productDAO.addProduct(newProduct);
        request.setAttribute("message", "Product added successfully!");
    } catch (Exception e) {
        request.setAttribute("message", "Error: " + e.getMessage());
    }

    RequestDispatcher dispatcher = request.getRequestDispatcher("productadd.jsp");
    dispatcher.forward(request, response);
}
}
