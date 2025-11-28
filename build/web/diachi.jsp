<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Link CSS của bạn -->
    <link rel="stylesheet" href="css/css.css">
    <link rel="stylesheet" href="css/product.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- Thư viện Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Địa Chỉ và Liên Hệ</title>
    <script src="product.js"></script>
    
<% 
    // LẤY THÔNG TIN USER TỪ SESSION SỬ DỤNG KEY "currentUser"
    Object userObj = session.getAttribute("currentUser"); 
    model.User user = null; // CHÚ Ý: Đảm bảo model.User là đường dẫn đúng
    
    if (userObj != null) {
        user = (model.User) userObj;
    }
%>
</head>
<body>
<div>
<div class="container1">
    <div class="header">
        <nav class="menu1">
            <ul>
                <li><a><img class="logo" src="assets/D-conmputer.png"></a></li>
                <li><a href="gioithieu.jsp"><b>Giới thiệu</b></a></li>
                <li><a href="#"><b>Khuyến mãi</b></a></li>
                <li><a href="#"><b>Tin tức</b></a></li>
                <li><a href="#"><input class="input" type="text" placeholder="Tìm kiếm laptop và phụ kiện">
                </a></li>
                
                <% if (user == null) { %>
                    <li><a href="dangnhap.jsp">Đăng nhập</a></li>
                    <li><a href="dangki.jsp">Đăng kí</a></li>
                <% } else { %>
                    <!-- ĐÃ SỬA LẠI: Sử dụng getFullname() vì nó đã tồn tại trong model.User -->
                    <li><span>Xin chào</span></li>
                    <li><a href="LogoutServlet">Đăng xuất</a></li> 
                <% } %>
            </ul>
        </nav>
        <div class="container_icon">
            <a class="icon"><i class="fas fa-heart"></i><span class="badge">0</span></a>
            <a class="icon"><i class="fas fa-shopping-cart"></i><span class="badge">0</span></a>
            <a class="icon"><i class="fas fa-user"></i><span class="badge">0</span></a>
        </div>
        <div>
            <nav class="menu2">
                <ul>
                    <li><a class="danhmuc" href="#"> &#128187;DANH MỤC</a></li>
                    <li><a href="#">Đặt Lịch hẹn để được hỗ trợ tốt hơn</a></li>
                    <li><a href="#">LEGION 2025 LINE-UP</a></li>
                    <li><a href="#">LENOVO IDEAPAD 2024-2025</a></li>
                </ul>
            </nav>
        </div>
    </div> 
</div>

<!-- KHỐI CODE BẢN ĐỒ GOOGLE MAPS -->
<h2 style="text-align: center; margin-top: 20px; color: #333; font-family: 'Roboto', sans-serif;">VỊ TRÍ CỬA HÀNG</h2>
<iframe 
    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.482660!2d105.826!3d21.010!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab7!2s131%20T%C3%B4n%20%C4%90%E1%BB%A9c%20Th%E1%BA%AFng%2C%20%C4%90%E1%BB%91ng%20%C4%90a%2C%20H%C3%A0%20N%E1%BB%99i!5e0!3m2!1svi!2s!4v1695440000000" 
    width="100%" 
    height="600px" 
    style="border:0; margin-bottom: 20px;" 
    allowfullscreen="" 
    loading="lazy" 
    referrerpolicy="no-referrer-when-downgrade">
</iframe>

</div>
</body>
</html>
