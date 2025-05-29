<%@ page import="java.util.*, com.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --accent-color: #f1c40f;
            --light-gray: #f5f7fa;
            --border-color: #dfe4ea;
            --text-color: #333;
            --success-color: #2ecc71;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, rgba(44, 62, 80, 0.95) 0%, rgba(52, 152, 219, 0.9) 100%),
                        url('https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80') center/cover no-repeat fixed;
            color: var(--text-color);
            line-height: 1.6;
            padding: 20px;
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
                radial-gradient(circle at 20% 30%, rgba(52, 152, 219, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 80% 70%, rgba(46, 204, 113, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 40% 80%, rgba(155, 89, 182, 0.1) 0%, transparent 50%),
                linear-gradient(135deg, rgba(44, 62, 80, 0.92) 0%, rgba(52, 152, 219, 0.88) 100%);
            z-index: -1;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            position: relative;
            z-index: 1;
        }
        
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid var(--border-color);
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }
        
        h2 {
            color: white;
            font-size: 28px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }
        
        .product-count {
            background-color: rgba(52, 152, 219, 0.9);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
        }
        
        .table-wrapper {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
            overflow: hidden;
            margin-bottom: 30px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        thead th {
            background: linear-gradient(135deg, var(--secondary-color) 0%, rgba(44, 62, 80, 0.9) 100%);
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 600;
            position: relative;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
        }
        
        thead th:after {
            content: '';
            position: absolute;
            right: 0;
            top: 25%;
            height: 50%;
            width: 1px;
            background-color: rgba(255, 255, 255, 0.3);
        }
        
        thead th:last-child:after {
            display: none;
        }
        
        tbody tr {
            border-bottom: 1px solid var(--border-color);
            background: rgba(255, 255, 255, 0.8);
        }
        
        tbody tr:last-child {
            border-bottom: none;
        }
        
        tbody tr:hover {
            background: rgba(52, 152, 219, 0.1);
            backdrop-filter: blur(5px);
        }
        
        td {
            padding: 15px;
        }
        
        td:nth-child(4) {
            font-weight: 600;
            color: #e67e22;
        }
        
        td:nth-child(4)::before {
            content: '₹';
        }
        
        .status-cell {
            display: flex;
            align-items: center;
        }
        
        .status-indicator {
            display: inline-block;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            margin-right: 8px;
        }
        
        .in-stock {
            background-color: var(--success-color);
        }
        
        .low-stock {
            background-color: var(--accent-color);
        }
        
        .out-of-stock {
            background-color: #e74c3c;
        }
        
        .empty-state {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
            padding: 50px;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .empty-state p {
            font-size: 18px;
            color: #7f8c8d;
            margin-bottom: 20px;
        }
        
        .empty-state-icon {
            font-size: 60px;
            margin-bottom: 20px;
            color: #bdc3c7;
        }
        
        .back-home {
            display: inline-block;
            padding: 12px 24px;
            background: linear-gradient(135deg, var(--primary-color) 0%, #2980b9 100%);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
            backdrop-filter: blur(10px);
        }
        
        .back-home:hover {
            background: linear-gradient(135deg, #2980b9 0%, #1f5582 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(52, 152, 219, 0.4);
        }
        
        .actions {
            margin-top: 30px;
            display: flex;
            justify-content: center;
        }
        
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .product-count {
                margin-top: 10px;
            }
            
            table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
            
            th, td {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h2>Product List</h2>
            <% 
            List<Product> productList = (List<Product>) request.getAttribute("productList");
            int productCount = (productList != null) ? productList.size() : 0;
            %>
            <span class="product-count"><%= productCount %> Products</span>
        </header>
        
        <% if (productList != null && !productList.isEmpty()) { %>
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Product p : productList) { %>
                            <tr>
                                <td><%= p.getProductID() %></td>
                                <td><%= p.getProductName() %></td>
                                <td><%= p.getCategory() %></td>
                                <td><%= p.getPrice() %></td>
                                <td class="status-cell">
                                    <% 
                                    int qty = p.getQuantity();
                                    String statusClass = "";
                                    if (qty <= 0) {
                                        statusClass = "out-of-stock";
                                    } else if (qty < 10) {
                                        statusClass = "low-stock";
                                    } else {
                                        statusClass = "in-stock";
                                    }
                                    %>
                                    <span class="status-indicator <%= statusClass %>"></span>
                                    <%= qty %>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } else { %>
            <div class="empty-state">
                <div class="empty-state-icon">📦</div>
                <p>No products available in the inventory.</p>
                <a href="productadd.jsp" class="back-home">Add Your First Product</a>
            </div>
        <% } %>
        
        <div class="actions">
            <a href="index.jsp" class="back-home">Back to Home</a>
        </div>
    </div>
</body>
</html>