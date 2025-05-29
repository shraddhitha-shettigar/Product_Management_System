<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
    <style>
        :root {
            --primary-color: #f39c12;
            --primary-hover: #e67e22;
            --secondary-color: #2c3e50;
            --success-color: #2ecc71;
            --error-color: #e74c3c;
            --light-gray: #f5f7fa;
            --border-color: #dfe4ea;
            --text-color: #333;
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
            max-width: 600px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
            padding: 30px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            z-index: 1;
        }
        
        h2 {
            color: var(--secondary-color);
            margin-bottom: 25px;
            text-align: center;
            position: relative;
            padding-bottom: 12px;
        }
        
        h2:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background-color: var(--primary-color);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--secondary-color);
        }
        
        input, select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            font-size: 15px;
            transition: border-color 0.3s, box-shadow 0.3s;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
        }
        
        input:focus, select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(243, 156, 18, 0.2);
            background: rgba(255, 255, 255, 1);
        }
        
        button {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-hover) 100%);
            color: white;
            border: none;
            border-radius: 6px;
            padding: 12px 25px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s ease;
            margin-top: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 15px rgba(243, 156, 18, 0.3);
            backdrop-filter: blur(10px);
        }
        
        button:hover {
            background: linear-gradient(135deg, var(--primary-hover) 0%, #d35400 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(243, 156, 18, 0.4);
        }
        
        .button-icon {
            margin-right: 10px;
            font-size: 18px;
        }
        
        .help-text {
            margin-top: 5px;
            color: #7f8c8d;
            font-size: 13px;
            font-style: italic;
        }
        
        .message {
            padding: 15px;
            margin: 20px 0;
            border-radius: 6px;
            background: rgba(46, 204, 113, 0.1);
            color: var(--success-color);
            border-left: 4px solid var(--success-color);
            backdrop-filter: blur(10px);
        }
        
        .error {
            padding: 15px;
            margin: 20px 0;
            border-radius: 6px;
            background: rgba(231, 76, 60, 0.1);
            color: var(--error-color);
            border-left: 4px solid var(--error-color);
            backdrop-filter: blur(10px);
        }
        
        .back-link {
            display: block;
            text-align: center;
            margin-top: 25px;
            color: var(--secondary-color);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            padding: 10px 20px;
            background: rgba(44, 62, 80, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 8px;
            border: 1px solid rgba(44, 62, 80, 0.2);
        }
        
        .back-link:hover {
            color: white;
            background: rgba(243, 156, 18, 0.9);
            text-decoration: none;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(243, 156, 18, 0.3);
        }
        
        .required-field::after {
            content: '*';
            color: var(--error-color);
            margin-left: 4px;
        }
        
        .info-panel {
            background: rgba(52, 152, 219, 0.1);
            border-left: 4px solid #3498db;
            padding: 15px;
            margin-bottom: 25px;
            border-radius: 6px;
            backdrop-filter: blur(10px);
        }
        
        .info-panel p {
            margin: 0;
            color: #2980b9;
        }
        
        .two-columns {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
            
            .two-columns {
                grid-template-columns: 1fr;
                gap: 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Product</h2>
        
       <!--
<div class="info-panel">
    <p>Enter the Product ID and the new values for the product you want to update.</p>
</div>
-->

        
        <form action="updateProduct" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="productId" class="required-field">Product ID (to update)</label>
                <input type="number" id="productId" name="productId" required min="1" placeholder="Enter existing product ID"/>
                <!-- <div class="help-text">Enter the ID of the product you want to modify</div> -->
                
            </div>
            
            <div class="form-group">
                <label for="productName" class="required-field">New Product Name</label>
                <input type="text" id="productName" name="productName" required maxlength="100" placeholder="Enter updated product name"/>
            </div>
            
            <div class="form-group">
                <label for="category" class="required-field">New Category</label>
                <input type="text" id="category" name="category" required maxlength="50" placeholder="Enter updated category"/>
            </div>
            
            <div class="two-columns">
                <div class="form-group">
                    <label for="price" class="required-field">New Price</label>
                    <input type="number" step="0.01" id="price" name="price" required min="0" placeholder="0.00"/>
                </div>
                
                <div class="form-group">
                    <label for="quantity" class="required-field">New Quantity</label>
                    <input type="number" id="quantity" name="quantity" required min="0" placeholder="0"/>
                </div>
            </div>
            
            <button type="submit">
                <span class="button-icon">🔄</span>
                Update Product
            </button>
        </form>

        <% String message = (String) request.getAttribute("message");
        if (message != null) {
            if (message.startsWith("Error")) { %>
                <p class="error"><%= message %></p>
            <% } else { %>
                <p class="message"><%= message %></p>
            <% }
        }
        %>

        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>

    <script>
        function validateForm() {
            let pid = document.getElementById("productId").value;
            let pname = document.getElementById("productName").value.trim();
            let cat = document.getElementById("category").value.trim();
            let price = document.getElementById("price").value;
            let qty = document.getElementById("quantity").value;

            if (pid <= 0) {
                alert("Product ID must be a positive number");
                return false;
            }
            if (pname.length === 0) {
                alert("Product Name is required");
                return false;
            }
            if (cat.length === 0) {
                alert("Category is required");
                return false;
            }
            if (price < 0) {
                alert("Price cannot be negative");
                return false;
            }
            if (qty < 0) {
                alert("Quantity cannot be negative");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>