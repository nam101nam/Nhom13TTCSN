<%--
    Trang hiển thị kết quả tìm kiếm 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    String keyword = (String) request.getAttribute("keyword");
    NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kết Quả Tìm Kiếm: <%= keyword != null ? keyword : "" %></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        /* Reset cơ bản */
        html, body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
            color: #111;
        }

        /* Header */
        .header {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .menu1 {
            width: 100%;
            max-width: 1200px;
        }

        .menu1 ul {
            list-style: none;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            gap: 15px;
        }

        .menu1 ul li a {
            font-size: 1.1em;
            color: #111;
            text-decoration: none;
            padding: 10px 15px;
        }

        .menu1 ul li a:hover {
            color: #034b94;
            transition: color 0.3s ease;
        }

        .logo {
            width: 160px;
            height: 70px;
        }

        .input {
            padding: 10px 20px;
            max-width: 300px;
            width: 100%;
            border-radius: 25px;
            border: 1px solid #ccc;
            font-size: 1em;
        }

        .container_icon {
            display: flex;
            align-items: center;
            gap: 20px;
            margin: 10px 0;
        }

        .icon {
            position: relative;
            cursor: pointer;
        }

        .badge {
            position: absolute;
            top: -10px;
            right: -10px;
            background: #0884d1;
            color: white;
            font-size: 12px;
            padding: 4px 6px;
            border-radius: 50%;
        }

        .menu2 {
            margin-top: 15px;
        }

        .menu2 ul {
            display: flex;
            flex-wrap: wrap;
            list-style: none;
            justify-content: center;
            gap: 10px;
        }

        .menu2 ul li a {
            text-decoration: none;
            padding: 10px 15px;
            color: #111;
            border: 1px solid #f5f5f5;
            box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .menu2 ul li a:hover {
            color: #034b94;
            background-color: #f5f5f5;
            transition: all 0.3s ease;
        }

        .menu2 ul li .danhmuc {
            background-color: #034b94;
            color: white;
        }

        /* Search results */
        .content {
            padding: 40px 20px;
            text-align: center;
        }

        .content h1 {
            color: #034b94;
            margin-bottom: 30px;
            font-size: 1.8em;
        }

        .search-results-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 20px;
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .product_item {
            background: #fff;
            border: 1px solid #eee;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
        }

        .product_item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .product_img {
            width: 100%;
            height: 200px;
            object-fit: contain;
            background-color: #f9f9f9;
            padding: 15px;
        }

        .product_title {
            font-size: 1.1em;
            font-weight: 500;
            padding: 10px 15px;
            color: #111;
        }

        .product_price {
            color: #034b94;
            font-weight: bold;
            padding: 5px 15px;
        }

        .more_infor_product {
            color: #555;
            font-size: 0.9em;
            padding: 5px 15px 15px;
        }

        .product3_shopping {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 15px 20px;
        }

        .product3_shopping i {
            font-size: 1.3em;
            color: #034b94;
            cursor: pointer;
        }

        .button_comparation {
            background: #034b94;
            color: #fff;
            border: none;
            padding: 8px 14px;
            border-radius: 20px;
            cursor: pointer;
            font-size: 0.9em;
        }

        .button_comparation:hover {
            background: #0568d3;
        }

        /* Footer */
        footer {
            background-color: #034b94;
            padding: 40px 20px;
            color: #fff;
        }

        .footer_container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: space-between;
        }

        .footer_container * {
            background-color: transparent;
        }

        .service_footer_1 ul {
            list-style: none;
            padding: 0;
        }

        .service_footer_1 ul li a {
            text-decoration: none;
            font-size: 0.9em;
            color: #fff;
            display: block;
            padding: 8px 0;
        }

        .service_footer_1 ul li a:hover {
            color: #ddd;
            transition: color 0.3s ease;
        }

        .logo_footer {
            text-align: center;
        }

        .desc_store_footer {
            text-align: center;
            color: #fff;
            margin-top: 30px;
            line-height: 1.6;
            font-size: 0.9em;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .menu1 ul {
                flex-direction: column;
                gap: 10px;
            }

            .input {
                max-width: 100%;
            }

            .menu2 ul {
                flex-direction: column;
                align-items: center;
            }

            .search-results-grid {
                grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
            }

            .footer_container {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }
        }

        @media (max-width: 480px) {
            .product_img {
                height: 180px;
            }

            .product_title {
                font-size: 1em;
            }

            .content h1 {
                font-size: 1.5em;
            }
        }
    </style>
</head>
<body>
    <!-- HEADER -->
    <div class="container1">
        <div class="header">
            <nav class="menu1">
                <ul>
                    <li><a><img class="logo" src="assets/D-conmputer.png"></a></li>
                    <li><a href="#"><b>Giới thiệu</b></a></li>
                    <li><a href="#"><b>Khuyến mãi</b></a></li>
                    <li><a href="#"><b>Tin tức</b></a></li>
                    <li><a><input class="input" type="text" placeholder="Tìm kiếm laptop và phụ kiện"></a></li>
                    
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
                        <li><a class="danhmuc" href="#">&#128187; DANH MỤC</a></li>
                        <li><a href="#">Đặt lịch hẹn hỗ trợ</a></li>
                        <li><a href="#">LEGION 2025 LINE-UP</a></li>
                        <li><a href="#">LENOVO IDEAPAD 2024-2025</a></li>
                    </ul>
                </nav>
            </div>
        </div> 
    </div>

    <!-- SEARCH RESULTS -->
    <div class="content">
        <h1>Kết Quả Tìm Kiếm Cho: "<%= keyword != null ? keyword : "Tất cả" %>"</h1>
        
        <% if (products == null || products.isEmpty()) { %>
            <p>Không tìm thấy sản phẩm nào phù hợp với từ khóa "<%= keyword %>".</p>
        <% } else { %>
        <div class="search-results-grid">
            <% for (Product p : products) {
                String formattedPrice = formatter.format(p.getProduct_price()).replace("₫", "").trim() + " VNĐ";
            %>
                <div class="product_item">
               <a href="product_detail.jsp?id=<%= p.getId() %>" style="text-decoration: none; color: black;">
                        <% if (p.getImages() != null && !p.getImages().isEmpty()) { %>
                          <img class="product_img" src="<%= (p.getImages() != null && !p.getImages().isEmpty()) ? p.getImages().get(0) : "assets/placeholder.png" %>" alt="<%= p.getProduct_title() %>">
                        <% } else { %>
                            <p>Không có hình ảnh</p>
                        <% } %>
                        <div class="product_title"><%= p.getProduct_title() %></div>
                        <div class="product_price"><%= formattedPrice %></div>
                        <div class="more_infor_product">CPU: <%= p.getCpu() %> / RAM: <%= p.getRam() %></div>
                        <div class="product3_shopping">
                            <i class="fa fa-shopping-cart"></i>
                            <button class="button_comparation">So sánh</button>
                        </div>
                    </a>
                </div>
            <% } %>
        </div>
        <% } %>
    </div>

    <!-- FOOTER -->
    <footer>
        <div class="footer_container">
            <div class="logo_footer">
                <p>Theo Dõi Chúng Tôi</p><br>
                <img src="assets/footera_notice_img.svg">
            </div>
            <div class="service_footer_1">
                <ul>
                    <li><a>HỖ TRỢ KHÁCH HÀNG &#9776;</a></li>
                    <li><a>Hỏi Đáp</a></li>
                    <li><a>Thông Tin Thanh Toán</a></li>
                    <li><a>Góp ý Khiếu Nại</a></li>
                    <li><a>Tuyển Dụng</a></li>
                    <li><a>Vận Chuyển</a></li>
                </ul>
            </div>
            <div class="service_footer_1">
                <ul>
                    <li><a>CHÍNH SÁCH &#9776;</a></li>
                    <li><a>Chính sách bảo mật thông tin</a></li>
                    <li><a>Chính sách bảo hành</a></li>
                    <li><a>Chính sách thanh toán</a></li>
                    <li><a>Chính sách vận chuyển</a></li>
                    <li><a>Chính sách đổi trả</a></li>
                </ul>
            </div>
            <div class="service_footer_1">
                <ul>
                    <li><a>DANH MỤC SẢN PHẨM &#9776;</a></li>
                    <li><a>Laptop MSI</a></li>
                    <li><a>Macbook</a></li>
                    <li><a>Laptop Asus</a></li>
                    <li><a>Laptop HP</a></li>
                </ul>
            </div>
        </div>
        <div class="desc_store_footer">
            <p>Công ty TNHH Công Nghệ Số D-computer</p>
            <p>Địa chỉ: 2C Bạch Đằng, P. Chương Dương, Q. Hoàn Kiếm, TP. Hà Nội</p>
            <p>Hotline: 0328775956 - Mail: nguyendung28022005@gmail.com</p>
        </div>
    </footer>
</body>
</html>