<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management System</title>

    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, rgba(44, 62, 80, 0.95) 0%, rgba(52, 152, 219, 0.9) 100%),
                        url('https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80') center/cover no-repeat fixed;
            color: #333;
            line-height: 1.6;
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
            padding: 40px 20px;
            position: relative;
            z-index: 1;
        }

        header {
            text-align: center;
            margin-bottom: 50px;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(15px);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .logo {
            font-size: 36px;
            font-weight: 700;
            color: white;
            margin-bottom: 15px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .subtitle {
            color: rgba(255, 255, 255, 0.9);
            font-size: 18px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
        }

        .menu-cards {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            grid-template-rows: auto auto;
            gap: 25px;
            margin-top: 30px;
        }

        .card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
            transition: all 0.3s ease;
            overflow: hidden;
            position: relative;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, #3498db, #2ecc71, #9b59b6, #e74c3c, #f39c12);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .card:hover::before {
            opacity: 1;
        }

        .card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15), 0 10px 25px rgba(0, 0, 0, 0.1);
            background: rgba(255, 255, 255, 0.98);
        }

        .card a {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 30px 20px;
            text-decoration: none;
            color: #333;
            height: 100%;
        }

        .card-icon {
            font-size: 36px;
            margin-bottom: 20px;
            color: #3498db;
            transition: all 0.3s ease;
        }

        .card:hover .card-icon {
            transform: scale(1.1);
            color: #2980b9;
        }

        .card-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 10px;
            transition: color 0.3s ease;
        }

        .card:hover .card-title {
            color: #2c3e50;
        }

        .card-description {
            text-align: center;
            color: #7f8c8d;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .card:hover .card-description {
            color: #5d6d7e;
        }

        /* Specific positioning for interleaved layout */
        .card-1 { grid-column: 1 / 2; grid-row: 1; }
        .card-2 { grid-column: 3 / 4; grid-row: 1; }
        .card-3 { grid-column: 5 / 6; grid-row: 1; }
        .card-4 { grid-column: 2 / 3; grid-row: 2; }
        .card-5 { grid-column: 4 / 5; grid-row: 2; }

        /* Individual card color accents */
        .card-1:hover::before { background: linear-gradient(90deg, #2ecc71, #27ae60); }
        .card-2:hover::before { background: linear-gradient(90deg, #f39c12, #e67e22); }
        .card-3:hover::before { background: linear-gradient(90deg, #e74c3c, #c0392b); }
        .card-4:hover::before { background: linear-gradient(90deg, #3498db, #2980b9); }
        .card-5:hover::before { background: linear-gradient(90deg, #9b59b6, #8e44ad); }

        .footer {
            margin-top: 60px;
            text-align: center;
            color: rgba(255, 255, 255, 0.8);
            font-size: 14px;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
        }

        @media (max-width: 768px) {
            .menu-cards {
                grid-template-columns: 1fr;
                grid-template-rows: auto;
            }

            .card-1, .card-2, .card-3, .card-4, .card-5 {
                grid-column: auto !important;
                grid-row: auto !important;
            }

            .logo {
                font-size: 28px;
            }

            .container {
                padding: 20px 10px;
            }

            header {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">Product Management System</div>
            <div class="subtitle">Manage your products with ease</div>
        </header>

        <div class="menu-cards">
            <div class="card card-1">
                <a href="productadd.jsp">
                    <div class="card-icon"><i class="fas fa-plus"></i></div>
                    <div class="card-title">Add Product</div>
                    <div class="card-description">Create and register new products in the system</div>
                </a>
            </div>

            <div class="card card-2">
                <a href="productupdate.jsp">
                    <div class="card-icon"><i class="fas fa-sync-alt"></i></div>
                    <div class="card-title">Update Product</div>
                    <div class="card-description">Modify existing product information</div>
                </a>
            </div>

            <div class="card card-3">
                <a href="productdelete.jsp">
                    <div class="card-icon"><i class="fas fa-trash"></i></div>
                    <div class="card-title">Delete Product</div>
                    <div class="card-description">Remove products from the system</div>
                </a>
            </div>

            <div class="card card-4">
                <a href="displayProducts">
                    <div class="card-icon"><i class="fas fa-clipboard"></i></div>
                    <div class="card-title">View Products</div>
                    <div class="card-description">Browse all products in the inventory</div>
                </a>
            </div>

            <div class="card card-5">
                <a href="report_form.jsp">
                    <div class="card-icon"><i class="fas fa-chart-bar"></i></div>
                    <div class="card-title">Reports</div>
                    <div class="card-description">Generate and view product reports</div>
                </a>
            </div>
        </div>

        
    </div>
</body>
</html>