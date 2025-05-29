<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Report Criteria</title>
    <style>
        :root {
            --primary: #4361ee;
            --primary-dark: #3a56d4;
            --secondary: #3f37c9;
            --accent: #4895ef;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #4cc9f0;
            --danger: #f72585;
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
            max-width: 800px;
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
                radial-gradient(circle at 20% 30%, rgba(52, 152, 219, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 80% 70%, rgba(46, 204, 113, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 40% 80%, rgba(155, 89, 182, 0.1) 0%, transparent 50%),
                linear-gradient(135deg, rgba(44, 62, 80, 0.92) 0%, rgba(52, 152, 219, 0.88) 100%);
            z-index: -1;
        }
        
        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
            margin-top: 20px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            z-index: 1;
        }
        
        .header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #e9ecef;
        }
        
        h2 {
            color: var(--primary);
            font-weight: 600;
        }
        
        .form-group {
            margin-bottom: 20px;
            padding: 15px;
            border-radius: var(--border-radius);
            background: rgba(248, 249, 250, 0.8);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        
        .form-group:hover {
            background: rgba(233, 236, 239, 0.9);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }
        
        .form-group label {
            display: flex;
            align-items: center;
            font-weight: 500;
            cursor: pointer;
            margin-bottom: 10px;
        }
        
        .form-group input[type="radio"] {
            margin-right: 10px;
            cursor: pointer;
            width: 18px;
            height: 18px;
            accent-color: var(--primary);
        }
        
        .form-group input[type="text"],
        .form-group input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ced4da;
            border-radius: var(--border-radius);
            font-size: 16px;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
        }
        
        .form-group input[type="text"]:focus,
        .form-group input[type="number"]:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
            background: rgba(255, 255, 255, 1);
        }
        
        .submit-btn {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: var(--border-radius);
            cursor: pointer;
            width: 100%;
            transition: all 0.3s ease;
            font-weight: 600;
            box-shadow: 0 4px 15px rgba(67, 97, 238, 0.3);
            backdrop-filter: blur(10px);
        }
        
        .submit-btn:hover {
            background: linear-gradient(135deg, var(--primary-dark) 0%, #2a44a8 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(67, 97, 238, 0.4);
        }
        
        .back-home {
            display: inline-block;
            margin: 20px 0;
            padding: 10px 20px;
            background: linear-gradient(135deg, var(--secondary) 0%, var(--primary-dark) 100%);
            color: white;
            text-decoration: none;
            border-radius: var(--border-radius);
            font-weight: 500;
            transition: all 0.3s ease;
            text-align: center;
            box-shadow: 0 4px 15px rgba(63, 55, 201, 0.3);
            backdrop-filter: blur(10px);
        }
        
        .back-home:hover {
            background: linear-gradient(135deg, var(--primary-dark) 0%, #2a44a8 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(63, 55, 201, 0.4);
            text-decoration: none;
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Select Report Type</h2>
        </div>

        <form action="generateReport" method="post">
            <div class="form-group">
                <label>
                    <input type="radio" name="reportType" value="price" required> 
                    <span>Products by Price (greater than)</span>
                </label>
                <input type="number" step="0.01" name="priceThreshold" placeholder="Enter price threshold">
            </div>

            <div class="form-group">
                <label>
                    <input type="radio" name="reportType" value="category"> 
                    <span>Products by Category</span>
                </label>
                <input type="text" name="category" placeholder="Enter category">
            </div>

            <div class="form-group">
                <label>
                    <input type="radio" name="reportType" value="top"> 
                    <span>Top N Products by Quantity</span>
                </label>
                <input type="number" name="topN" placeholder="Enter N">
            </div>

            <button type="submit" class="submit-btn">Generate Report</button>
        </form>
        
        <div class="footer">
            <a href="index.jsp" class="back-home">Back to Home</a>
        </div>
    </div>
</body>
</html>