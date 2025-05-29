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
            background: linear-gradient(135deg, rgba(44, 62, 80, 0.95) 0%, rgba(52, 152, 219, 0.9) 100%),
                        url('https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80') center/cover no-repeat fixed;
            color: var(--dark);
            line-height: 1.6;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
            min-height: 100vh;
            position: relative;
        }
        
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80') center/cover no-repeat,
                linear-gradient(135deg, rgba(236, 240, 241, 0.1) 0%, rgba(189, 195, 199, 0.1) 25%, rgba(149, 165, 166, 0.1) 50%, rgba(127, 140, 141, 0.1) 75%, rgba(95, 106, 106, 0.1) 100%);
            z-index: -2;
        }
        
        body::after {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 30%, rgba(52, 152, 219, 0.15) 0%, transparent 50%),
                radial-gradient(circle at 80% 70%, rgba(46, 204, 113, 0.12) 0%, transparent 50%),
                radial-gradient(circle at 40% 80%, rgba(155, 89, 182, 0.1) 0%, transparent 50%),
                linear-gradient(135deg, rgba(44, 62, 80, 0.92) 0%, rgba(52, 152, 219, 0.88) 100%);
            z-index: -1;
        }
        
        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            padding: 35px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15), 0 5px 15px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            z-index: 1;
        }
        
        .header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid rgba(233, 236, 239, 0.6);
        }
        
        h2 {
            color: var(--primary);
            font-weight: 600;
            font-size: 2rem;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
        
        .error-message {
            background: rgba(248, 215, 218, 0.9);
            backdrop-filter: blur(10px);
            color: var(--danger);
            padding: 18px;
            border-radius: var(--border-radius);
            border: 1px solid rgba(245, 198, 203, 0.6);
            margin-bottom: 20px;
            font-weight: 500;
            box-shadow: 0 4px 15px rgba(220, 53, 69, 0.1);
        }
        
        .criteria-info {
            background: rgba(231, 243, 255, 0.9);
            backdrop-filter: blur(10px);
            color: var(--info);
            padding: 18px;
            border-radius: var(--border-radius);
            border: 1px solid rgba(179, 217, 255, 0.6);
            margin-bottom: 25px;
            font-weight: 500;
            box-shadow: 0 4px 15px rgba(23, 162, 184, 0.1);
        }
        
        .table-container {
            overflow-x: auto;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            margin-bottom: 30px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            background: transparent;
            border-radius: 15px;
            overflow: hidden;
        }
        
        th {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            padding: 18px 15px;
            font-weight: 600;
            text-align: left;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }
        
        td {
            padding: 15px;
            border-bottom: 1px solid rgba(233, 236, 239, 0.6);
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(5px);
        }
        
        tr:hover td {
            background: rgba(248, 249, 250, 0.9);
            transform: translateY(-1px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        
        tr:last-child td {
            border-bottom: none;
        }
        
        .no-data {
            text-align: center;
            font-style: italic;
            color: #6c757d;
            background: rgba(248, 249, 250, 0.9) !important;
        }
        
        .back-btn {
            display: inline-block;
            margin: 20px 0;
            padding: 15px 30px;
            background: linear-gradient(135deg, var(--secondary) 0%, var(--primary-dark) 100%);
            color: white;
            text-decoration: none;
            border-radius: var(--border-radius);
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(63, 55, 201, 0.3);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .back-btn:hover {
            background: linear-gradient(135deg, var(--primary-dark) 0%, #2c45c7 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(63, 55, 201, 0.4);
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid rgba(233, 236, 239, 0.6);
        }
        
        .product-count {
            background: rgba(232, 245, 232, 0.9);
            backdrop-filter: blur(10px);
            color: var(--success);
            padding: 15px;
            border-radius: var(--border-radius);
            margin-bottom: 15px;
            font-weight: 500;
            text-align: center;
            border: 1px solid rgba(40, 167, 69, 0.2);
            box-shadow: 0 4px 15px rgba(40, 167, 69, 0.1);
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 25px;
                margin: 10px;
            }
            
            h2 {
                font-size: 1.5rem;
            }
            
            th, td {
                padding: 10px 8px;
                font-size: 0.9rem;
            }
            
            .back-btn {
                padding: 12px 24px;
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