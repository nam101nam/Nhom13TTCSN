<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới Thiệu - D-Computer</title>
    <!-- THÊM FONT ROBOTO DÙNG CHUNG CỦA PROJECT -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        /* Sử dụng Font Roboto (hoặc Montserrat nếu bạn muốn style riêng) */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #e6f0fa, #d9e2f2);
            color: #2c3e50;
            line-height: 1.6;
            overflow-x: hidden;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .header {
            background: linear-gradient(90deg, #1e3c72, #2a5298);
            color: white;
            text-align: center;
            padding: 30px 0;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1s ease-in;
        }
        .nav {
            display: flex;
            justify-content: center; /* Đặt center để dễ quản lý hơn */
            gap: 20px; /* Thêm khoảng cách giữa các mục */
            background: rgba(30, 60, 114, 0.9);
            padding: 15px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .nav a, .nav span { /* Thêm .nav span để style cho phần Xin chào */
            color: white;
            text-decoration: none;
            font-weight: 600;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s ease;
            display: inline-block; /* Quan trọng để padding hoạt động */
        }
        .nav a:hover {
            background: #ffcc00;
            color: #1e3c72;
            transform: translateY(-2px);
        }
        /* Style cho phần tên người dùng */
        .nav span {
            padding: 10px 15px;
            background: rgba(255, 255, 255, 0.1);
        }
        
        .content {
            display: flex;
            margin: 40px auto;
            max-width: 1300px;
            gap: 30px;
            animation: fadeIn 1.5s ease-in-out;
        }
        .sidebar {
            width: 30%;
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .sidebar:hover {
            transform: translateY(-5px);
        }
        .sidebar h3 {
            color: #1e3c72;
            border-bottom: 3px solid #1e3c72;
            padding-bottom: 10px;
            font-size: 1.5em;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar ul li {
            padding: 12px 0;
            border-bottom: 1px solid #eee;
            transition: all 0.3s ease;
        }
        .sidebar ul li:hover {
            color: #1e3c72;
            transform: translateX(10px);
        }
        .sidebar p {
            color: #7f8c8d;
            font-style: italic;
            font-size: 0.9em;
        }
        .main {
            width: 70%;
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .main:hover {
            transform: translateY(-5px);
        }
        .product {
            text-align: center;
            margin: 25px 0;
            padding: 25px;
            background: linear-gradient(135deg, #f9f9f9, #ffffff);
            border-radius: 15px;
            transition: all 0.3s ease;
        }
        .product:hover {
            transform: scale(1.02);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        .product img {
            max-width: 100%;
            height: auto; /* Đảm bảo hình ảnh không bị biến dạng */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .product img:hover {
            transform: scale(1.05); /* Giảm scale */
        }
        .product h2 {
            color: #1e3c72;
            margin-bottom: 15px;
            font-size: 2em;
            text-transform: uppercase;
        }
        .main h3 {
            color: #1e3c72;
            border-bottom: 3px solid #1e3c72;
            padding-bottom: 10px;
            font-size: 1.5em;
        }
        .main ul {
            list-style: none;
            padding: 0;
        }
        .main ul li {
            padding: 12px;
            background: #ecf0f1;
            margin: 10px 0;
            border-radius: 8px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            padding-left: 30px; /* Tạo khoảng trống cho bullet point */
        }
        .main ul li:before {
            content: "•";
            color: #1e3c72;
            font-weight: bold;
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.2em;
        }
        .main ul li:hover {
            background: #d5dbe4;
            transform: translateX(5px);
        }
        .footer {
            text-align: center;
            padding: 20px;
            background: linear-gradient(90deg, #2a5298, #1e3c72);
            color: white;
            margin-top: 30px;
            border-top: 3px solid #ffcc00;
            animation: fadeIn 1.5s ease-in-out;
        }
        /* Media Queries cho thiết bị di động */
        @media (max-width: 768px) {
            .content {
                flex-direction: column;
                margin: 20px;
            }
            .sidebar, .main {
                width: 100%;
                margin-bottom: 20px;
            }
            .nav {
                flex-direction: column;
                padding: 10px;
            }
            .nav a, .nav span {
                text-align: center;
                margin: 5px 0;
            }
        }
    </style>
    
<% 
    // ******* LẤY THÔNG TIN USER TỪ SESSION *******
    Object userObj = session.getAttribute("currentUser"); 
    model.User user = null; 
    
    if (userObj != null) {
        user = (model.User) userObj;
    }
%>
</head>
<body>
    <div class="header">
        <h1>Giới Thiệu - D-Computer</h1>
    </div>
    
    <div class="nav">
        <!-- Các link điều hướng chính -->
        <a href="index.jsp">Trang Chủ</a>
        <a href="#danh-muc">Danh Mục</a>
        <a href="#khuyen-mai">Khuyến Mãi</a>
        <a href="diachi.jsp">Địa Chỉ</a>
        
        <!-- Logic ĐĂNG NHẬP / ĐĂNG KÝ / ĐĂNG XUẤT (đã chuyển sang JSP) -->
        <% if (user == null) { %>
            <a href="dangnhap.jsp">Đăng Nhập</a>
            <a href="dangki.jsp">Đăng Kí</a>
        <% } else { %>
            <span>Xin chào</span>
            <a href="LogoutServlet">Đăng xuất</a>
        <% } %>
    </div>
    
    <div class="content">
        <div class="sidebar">
            <h3>Danh Mục</h3>
            <ul>
                <li>Máy Tính Để Bàn</li>
                <li>Laptop Gaming</li>
                <li>Laptop Văn Phòng</li>
                <li>Laptop Lắp Trình</li>
                <li>Laptop Đồ Họa</li>
                <li>Laptop Cao Cấp</li>
                <li>Apple MacBook</li>
                <li>Ram-SSD</li>
                <li>Khác</li>
            </ul>
            <p>Khuyến mãi còn 90 Ngày & Giảm 10 Phần 10 Giá</p>
        </div>
        <div class="main">
            <div class="product">
                <h2>LEGION 2025 LINE-UP</h2>
                <!-- Giữ nguyên placeholder URL để đảm bảo an toàn -->
                <img src="https://via.placeholder.com/400x300/1e3c72/ffffff?text=LEGION+2025" alt="Legion Laptop">
                <p>AI-POWER VAPOR CHAMBER CONQUER YOUR ARENA</p>
                <p>Được trang bị Intel® Core™ i9 processors</p>
            </div>
            <h3>Tin Mới Nhất</h3>
            <ul>
                <li>Tạm Ngừng Hỗ Trợ Kỹ Thuật, Bảo Dưỡng, Bảo Trì</li>
                <li>Đặt Lịch Hẹn Để Được Hỗ Trợ Hơn</li>
                <li>Thông Báo Lịch Làm Việc Đi Đi Là Lẻ 30/4-01/05</li>
                <li>Tắt Máy Tự Động</li>
            </ul>
        </div>
    </div>
    <div class="footer">
        <p>Tân Nhiệt Laptop - Website</p>
    </div>
</body>
</html>
