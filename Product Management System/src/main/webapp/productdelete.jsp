<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Product</title>
    <style>
        :root {
            --primary-color: #e74c3c;
            --primary-hover: #c0392b;
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
                radial-gradient(circle at 20% 30%, rgba(52, 152, 219, 0.15) 0%, transparent 50%),
                radial-gradient(circle at 80% 70%, rgba(46, 204, 113, 0.12) 0%, transparent 50%),
                radial-gradient(circle at 40% 80%, rgba(155, 89, 182, 0.1) 0%, transparent 50%),
                linear-gradient(135deg, rgba(44, 62, 80, 0.92) 0%, rgba(52, 152, 219, 0.88) 100%);
            z-index: -1;
        }
        
        .container {
            max-width: 500px;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15), 0 5px 15px rgba(0, 0, 0, 0.1);
            padding: 35px;
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
            font-size: 28px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
        
        h2:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-hover) 100%);
            border-radius: 2px;
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
        
        input {
            width: 100%;
            padding: 15px;
            border: 1px solid rgba(223, 228, 234, 0.6);
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(5px);
        }
        
        input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(231, 76, 60, 0.2);
            background: rgba(255, 255, 255, 1);
            transform: translateY(-1px);
        }
        
        input::placeholder {
            color: rgba(51, 51, 51, 0.6);
        }
        
        button {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-hover) 100%);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 15px 25px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s ease;
            margin-top: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 15px rgba(231, 76, 60, 0.3);
        }
        
        button:hover {
            background: linear-gradient(135deg, var(--primary-hover) 0%, #a93226 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(231, 76, 60, 0.4);
        }
        
        .warning-icon {
            margin-right: 10px;
            font-size: 20px;
        }
        
        .warning-text {
            text-align: center;
            margin: 20px 0;
            padding: 18px;
            background: rgba(231, 76, 60, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 8px;
            color: var(--error-color);
            font-size: 14px;
            border: 1px solid rgba(231, 76, 60, 0.2);
            box-shadow: 0 4px 15px rgba(231, 76, 60, 0.1);
        }
        
        .message {
            padding: 18px;
            margin: 20px 0;
            border-radius: 8px;
            background: rgba(46, 204, 113, 0.15);
            backdrop-filter: blur(10px);
            color: var(--success-color);
            border-left: 4px solid var(--success-color);
            border: 1px solid rgba(46, 204, 113, 0.2);
            box-shadow: 0 4px 15px rgba(46, 204, 113, 0.1);
        }
        
        .error {
            padding: 18px;
            margin: 20px 0;
            border-radius: 8px;
            background: rgba(231, 76, 60, 0.15);
            backdrop-filter: blur(10px);
            color: var(--error-color);
            border-left: 4px solid var(--error-color);
            border: 1px solid rgba(231, 76, 60, 0.2);
            box-shadow: 0 4px 15px rgba(231, 76, 60, 0.1);
        }
        
        .back-link {
            display: inline-block;
            text-align: center;
            margin-top: 25px;
            padding: 12px 24px;
            background: linear-gradient(135deg, var(--secondary-color) 0%, #1a252f 100%);
            color: white;
            text-decoration: none;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.3s ease;
            width: 100%;
            box-shadow: 0 4px 15px rgba(44, 62, 80, 0.3);
            backdrop-filter: blur(10px);
        }
        
        .back-link:hover {
            background: linear-gradient(135deg, #1a252f 0%, #0f1419 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(44, 62, 80, 0.4);
        }
        
        .required-field::after {
            content: '*';
            color: var(--error-color);
            margin-left: 4px;
        }
        
        .delete-confirm-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 100;
        }
        
        .modal-content {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            padding: 30px;
            border-radius: 15px;
            max-width: 400px;
            width: 90%;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }
        
        .modal-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        
        .btn-cancel, .btn-confirm {
            padding: 12px 20px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            width: 48%;
            transition: all 0.3s ease;
        }
        
        .btn-cancel {
            background: rgba(241, 242, 246, 0.9);
            color: #333;
            border: 1px solid rgba(223, 228, 234, 0.6);
            backdrop-filter: blur(5px);
        }
        
        .btn-confirm {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-hover) 100%);
            color: white;
            border: none;
            box-shadow: 0 4px 15px rgba(231, 76, 60, 0.3);
        }
        
        .btn-cancel:hover {
            background: rgba(223, 228, 234, 0.9);
            transform: translateY(-1px);
        }
        
        .btn-confirm:hover {
            background: linear-gradient(135deg, var(--primary-hover) 0%, #a93226 100%);
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(231, 76, 60, 0.4);
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 25px;
                margin: 20px auto;
            }
            
            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete Product</h2>
        
       
        <form action="deleteProduct" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="productId" class="required-field">Product ID to Delete</label>
                <input type="number" id="productId" name="productId" required min="1" placeholder="Enter product ID to delete"/>
            </div>
            
            <button type="submit">
                <span class="warning-icon">🗑️</span>
                Delete Product
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
            if (pid <= 0) {
                alert("Product ID must be a positive number");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>