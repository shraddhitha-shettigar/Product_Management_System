<%@ page import="java.util.List" %>
<%@ page import="com.model.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Report</title>
    <style>
        :root {
            --primary: #4361ee;
            --primary-dark: #3a56d4;
            --secondary: #3f37c9;
            --accent: #4895ef;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #28a745;
            --danger: #dc3545;
            --warning: #ffc107;
            --info: #17a2b8;
            --border-radius: 8px;
            --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #87CEEB;
            color: var(--dark);
            line-height: 1.6;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .container {
            background-color: white;
            border-radius: var(--border-radius);
            padding: 30px;
            box-shadow: var(--box-shadow);
            margin-top: 20px;
        }
        
        .header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #e9ecef;
        }
        
        h2 {
            color: var(--primary);
            font-weight: 600;
            font-size: 2rem;
        }
        
        .error-message {
            background-color: #f8d7da;
            color: var(--danger);
            padding: 15px;
            border-radius: var(--border-radius);
            border: 1px solid #f5c6cb;
            margin-bottom: 20px;
            font-weight: 500;
        }
        
        .criteria-info {
            background-color: #e7f3ff;
            color: var(--info);
            padding: 15px;
            border-radius: var(--border-radius);
            border: 1px solid #b3d9ff;
            margin-bottom: 25px;
            font-weight: 500;
        }
        
        .table-container {
            overflow-x: auto;
            box-shadow: var(--box-shadow);
            border-radius: var(--border-radius);
            margin-bottom: 30px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: var(--border-radius);
            overflow: hidden;
        }
        
        th {
            background-color: var(--primary);
            color: white;
            padding: 15px;
            font-weight: 600;
            text-align: left;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
        }
        
        td {
            padding: 12px 15px;
            border-bottom: 1px solid #e9ecef;
            transition: background-color 0.3s;
        }
        
        tr:hover td {
            background-color: #f8f9fa;
        }
        
        tr:last-child td {
            border-bottom: none;
        }
        
        .no-data {
            text-align: center;
            font-style: italic;
            color: #6c757d;
            background-color: #f8f9fa;
        }
        
        .back-btn {
            display: inline-block;
            margin: 20px 0;
            padding: 12px 24px;
            background-color: var(--secondary);
            color: white;
            text-decoration: none;
            border-radius: var(--border-radius);
            font-weight: 600;
            transition: all 0.3s;
            box-shadow: var(--box-shadow);
        }
        
        .back-btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e9ecef;
        }
        
        .product-count {
            background-color: #e8f5e8;
            color: var(--success);
            padding: 10px 15px;
            border-radius: var(--border-radius);
            margin-bottom: 15px;
            font-weight: 500;
            text-align: center;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin: 10px;
            }
            
            h2 {
                font-size: 1.5rem;
            }
            
            th, td {
                padding: 8px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Product Report</h2>
        </div>

        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <div class="error-message">
                <%= message %>
            </div>
        <% } else { %>
            
            <div class="criteria-info">
                <strong>Report Criteria:</strong> <%= request.getAttribute("criteria") %>
            </div>

            <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
            %>
                <div class="product-count">
                    Found <%= products.size() %> product(s) matching your criteria
                </div>
            <% } %>

            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        if (products != null && !products.isEmpty()) {
                            for (Product p : products) {
                        %>
                            <tr>
                                <td><%= p.getProductID() %></td>
                                <td><%= p.getProductName() %></td>
                                <td><%= p.getCategory() %></td>
                                <td>₹<%= String.format("%.2f", p.getPrice()) %></td>
                                <td><%= p.getQuantity() %></td>
                            </tr>
                        <% 
                            }
                        } else {
                        %>
                            <tr>
                                <td colspan="5" class="no-data">No products found.</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

        <% } %>

        <div class="footer">
            <a href="report_form.jsp" class="back-btn">Back to Report Criteria</a>
        </div>
    </div>
</body>
</html>