<%-- 
    Document   : index
    Created on : Oct 6, 2025, 4:21:54 PM
    Author     : Welcome to Windows10
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<% 
    // Lấy đối tượng đã được lưu trong Session với key LÀ "currentUser"
    Object userObj = session.getAttribute("currentUser"); 
    
    // Khai báo biến User, khởi tạo là null
    model.User user = null; 
    
    if (userObj != null) {
        // Ép kiểu (Cast) đối tượng đã lấy được về đúng class model.User
        user = (model.User) userObj;
    }
%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/css.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- dùng thư viện font awesome để lấy icon-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="js/js.js"></script>
    <title>Document</title>
</head>
<body>
<div>
<div class="container1">
    <div class="header">
        <nav class="menu1">
            <ul>
                <li><a><img class="logo" src="assets/D-conmputer.png"></a></li>
                <li><a href="gioithieu.jsp"><b>Giới thiệu</b></a></li>
                <li><a href="khuyenmai.jsp"><b>Khuyến mãi</b></a></li>
                <li><a href="diachi.jsp"><b>Địa Chỉ</b></a></li>
              <!-- index.jsp (Bạn tìm đoạn <li> chứa form tìm kiếm và thay thế) -->
                     <li>
                        <form action="search" method="get" style="display: flex;position: relative;">
                            <input class="input" type="text" name="query" placeholder="Tìm kiếm laptop và phụ kiện">
                            <button type="submit" class="search-button">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                     </li>
                <% if (user == null) { %>
              <li><a href="dangnhap.jsp">Đăng nhập</a></li>
              <li><a href="dangki.jsp">Đăng ký</a></li>
          <% } else { %>
              <li><a href="LogoutServlet">Đăng xuất</a></li>
          <% } %>
            </ul>
        </nav>
        <div class="container_icon">
                <a class="icon"><i class="fas fa-heart"></i><span class="badge">0</span><a>
                <a class="icon"><i class="fas fa-shopping-cart"></i><span class="badge">0</span><a>
                <a class="icon"><i class="fas fa-user"></i><span class="badge">0</span></a>
        </div>
        <div>
            <nav class="menu2">
                <ul>
                    <li><a class="danhmuc" href="#"> &#128187;DANH MỤC</a></li>
                    <li><a href="datlich.jsp">Đặt Lịch hẹn để được hỗ trợ tốt hơn</a></li>
                    <li><a href="#">LEGION 2025 LINE-UP</a></li>
                    <li><a href="#">LENOVO IDEAPAD 2024-2025</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
  <div class="content">
    <div class="part1_content">
           
            <nav class="menu3">
                             <div class="social_link">
                                  <a href="#"><img src="assets/FaceBook.jpg" alt="facebook"></a>
                                  <a href="#"><img src="assets/tiktok.jpg" alt="Youtube"></a>
                                  <a href="#"><img src="assets/YouTube.jpg" alt="Tiktok"></a>
                             </div>
                <ul>
                    <li><a href="#">Máy Tính xách tay &#10217;</a>
                            <ul>
                                <li><a href="#" class="title1_submenu3a">Laptop theo hãng </a></li>
                                <li><a href="#">Acer &#10217;</a>
                                          <ul>
                                            <li><a href="#">Acer Aspire</a></li>
                                            <li><a href="#">Acer Nitro</a></li>
                                            <li><a href="#">Acer Predator</a></li>
                                            <li><a href="#">Acer Swift</a></li>
                                          </ul>  
                                </li>
                                <li><a href="#">Gigabyte </a></li>
                                <li><a href="#">APPLE &#10217;</a>
                                          <ul>
                                            <li><a href="#">Macbook Air</a></li>
                                            <li><a href="#">Macbook Pro</a></li>
                                            <li><a href="#">iMac</a></li>
                                          </ul>
                                </li>
                                <li><a href="#">ASUS &#10217;</a>
                                           <ul>
                                            <li><a href="#">Asus Zenbook Series</a></li>
                                            <li><a href="#">Asus Vivobook Series</a></li>
                                            <li><a href="#">Asus TUF</a></li>
                                            <li><a href="#">Aus ROG</a></li>
                                           </ul>
                                </li>
                                <li><a href="#">DELL &#10217;</a>
                                           <ul>
                                            <li><a href="#">Dell Inspiron</a></li>
                                            <li><a href="#">Dell Alienware</a></li>
                                            <li><a href="#">Dell Vostro</a></li>
                                            <li><a href="#">Dell Latitude</a></li>
                                            <li><a href="#">Dell Precision</a></li>
                                            <li><a href="#">Dell Gaming</a></li>
                                            <li><a href="#">Dell XPS</a></li>
                                           </ul>
                                </li>
                                <li><a href="#">HP &#10217;</a>
                                            <ul>
                                             <li><a href="#">HP Zbook</a></li>
                                             <li><a href="#">HP Elitebook</a></li>
                                             <li><a href="#">HP Envy</a></li>
                                             <li><a href="#">HP Pavilion</a></li>
                                             <li><a href="#">HP Probook</a></li>
                                             <li><a href="#">HP Gaming</a></li>
                                            </ul>
                                </li>
                                <li><a href="#">LENOVO &#10217;</a>
                                            <ul>
                                            <li><a href="#">Lenovo Ideapad</a></li>
                                            <li><a href="#">Lenovo LOQ</a></li>
                                            <li><a href="#">Lenovo Legion</a></li>
                                            <li><a href="#">Lenovo Thinkbook</a></li>
                                            <li><a href="#">Lenovo Yoga Seies</a></li>
                                            </ul>
                                </li>
                                <li><a href="#">MICROSOFT </a></li>
                                <li><a href="#">THINKPAD </a></li>
                                <li><a href="#">THINKBOOK </a></li>
                                <li><a href="#">Tình Trạng </a></li>
                                <li><a href="#">Brand New 100% </a></li>
                                <li><a href="#">Outlet/Referbished </a></li>
                                <li><a href="#">Like New</a></li>
                            </ul>
                    </li>
                    <li><a href="#">Laptop Gaming &#10217;</a>
                            <ul>
                                <li><a href="#">Laptop gaming Acer &#10217; </a>
                                            <ul>
                                                <li><a href="#">Acer Nitro</a></li>
                                                <li><a href="#">Acer Predator</a></li>
                                            </ul>
                                </li>
                                <li><a href="#">Laptop gaming Lenovo &#10217; </a>
                                            <ul>
                                                <li><a href="#">Lenovo Legion</a></li>
                                                <li><a href="#">Lenovo Ideapad Gaming</a></li>
                                                <li><a href="#">Lenovo LOQ</a></li>
                                            </ul>
                                </li>
                                <li><a href="#">Laptop gaming HP &#10217; </a>
                                             <ul>
                                                <li><a href="#">HP Omen</a></li>
                                                <li><a href="#">HP Victus</a></li>
                                             </ul>
                                </li>
                                <li><a href="#">Laptop gaming ASUS &#10217; </a>
                                             <ul>
                                                <li><a href="#">Asus ROG</a></li>
                                                <li><a href="#">Asus TUF</a></li>
                                             </ul>
                                </li>
                                <li><a href="#">Laptop gaming DELL  &#10217;</a>
                                             <ul>
                                                <li><a href="#">Dell Alienware</a></li>
                                                <li><a href="#">Dell Gaming</a></li>
                                             </ul>
                                </li>
                            </ul>
                    </li>
                    <li><a href="#">Laptop Văn Phòng  &#10217;</a>
                            <ul>
                                <li><a href="#">Acer  &#10217; </a>
                                             <ul>
                                                <li><a href="#">Acer Aspire</a></li>
                                                <li><a href="#">Acer Swift</a></li>
                                             </ul>
                                </li>
                                <li><a href="#">Dell &#10217;</a>
                                             <ul>
                                                <li><a href="#">Dell Ispiron</a></li>
                                                <li><a href="#">Dell Latitude</a></li>
                                                <li><a href="#">Dell Vostro</a></li>
                                                <li><a href="#">Dell XPS</a></li>
                                             </ul>
                                </li>
                                <li><a href="#">Asus &#10217;</a>
                                             <ul>
                                                <li><a href="#">Asus Zenbook</a></li>
                                                <li><a href="#">Asus Vivobook</a></li>
                                             </ul>
                                </li>
                                <li><a href="#">Apple &#10217;</a>
                                             <ul>
                                                <li><a href="#">Macbook Air</a></li>
                                                <li><a href="#">Macbook Pro</a></li>
                                             </ul>
                                </li>
                            </ul>
                    </li>
                    <li><a href="#">Laptop Lập Trình</a></li>
                    <li><a href="#">Laptop Đồ họa</a></li>
                    <li><a href="#">Laptop Cao cấp</a></li>
                    <li><a href="#">Apple MacBook</a></li>
                    <li><a href="#">Ram-SSD</a></li>
                    <li><a href="#">Kho Phụ Kiện</a></li>
                    <li><a href="#">Cổng Chuyển</a></li>
                    <li><a href="#">Tản Nhiệt Laptop</a></li>
                </ul>
            </nav>  
          <div class="reviewimage">
            <img id="slider" alt="ảnh"  src="assets/reviewimage.webp">
            <nav class="menu_beneath_picture">
                <ul>
                    <li><a href="#">Tạm Ngưng Hỗ Trợ Kĩ Thuật,Bảo Dưỡng, Bảo Trì</a></li>
                    <li><a href="#">Đặt Lịch Hẹn Trước Để Được Hỗ Trợ Tốt hơn</a></li>
                    <li><a href="#">Thông Báo Lịch Làm Việc Dịp Đại Lễ 30/4-01/05</a></li>
                    <li><a href="#">Thông Báo Bảo Trì Website</a></li>
                </ul>
            </nav>
          </div>

            <div class="news">
              <p class="news_title">TIN MỚI NHẤT</p>
              <nav class="news_menu">
                <ul>
                    <li><a href="#">Tạm Ngưng Hỗ Trợ Kĩ Thuật,Bảo Dưỡng, Bảo Trì</a></li>
                    <li><a href="#">Đặt Lịch Hẹn Trước Để Được Hỗ Trợ Tốt hơn</a></li>
                    <li><a href="#">Thông Báo Lịch Làm Việc Dịp Đại Lễ 30/4-01/05</a></li>
                    <li><a class="all_news" href="#">Tất cả tin tức</a></li>
                </ul>
              </nav>
            </div>
        </div>
        <div id="counttime" class="counttime"> <h2>Khuyến Mãi</h2></div><br><br>
        <div>
            <h2 class="title_part2_content">Một số sản phẩm tham khảo</h2>
        </div>
    <div class="part2_content">
   
            <div class="product1">
                 <div class="product_items">
                     <img class="product_img" src="assets/DellGamingG15_5530.png">
                     <div class="product_title"><a href="product_detail.jsp?id=1" style="text-decoration: none;color: black;">Dell G15 5530 2023 i5-13450HX RAM 16GB SSD 512GB RTX 3050 6 GB 15.6" FHD 120Hz</a></div>
                     <div class="product_price">22.990.000</div>
                     <div class="amount_of_product">1 phiên bản</div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình:<br> CPU:  -Intel Core i5 13450HX<br>-RAM: Từ 16GB DDR5 4800MHz<br>-Màn hình:  15.6″, FHD IPS (1920x1080), 120Hz<br>-Card Đồ họa: NVIDIA GeForce RTX 3050 6GB </div>
                 </div>
                  <div class="product_items">
                     <img class="product_img" src="assets/Gigabyte A16.png">
                     <div class="product_title"><a href="product_detail.jsp?id=2" style="text-decoration: none;color: black;">Gigabyte Gaming A16 GA6H CMHH2VN893SH i5-13420H RAM 16GB SSD 512GB RTX™ 4050 16" FHD+ 165Hz</a></div>
                     <div class="product_price">22.990.000</div>
                     <div class="amount_of_product">1 phiên bản</div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình<br> CPU:  Intel Core i5 13420H<br> RAM: 16GB DDR5 5200MHz<br> Màn hình: 16″, FHD+ (1920x1200) IPS, 165Hz<br> Card Đồ họa: Nvidia Geforce RTX 4050 6GB GDDR6</div>
                 </div>
                  <div class="product_items" >
                     <img class="product_img" src="assets/Lenovo_ideapad_slim_3_2025.png">
                     <div class="product_title"><a href="product_detail.jsp?id=3" style="text-decoration: none;color: black;">Lenovo IdeaPad Slim 3 15IRH10 2025 83K1002PVN i5 13420H RAM 16GB SSD 512GB 15.1" 2.5K OLED 165Hz</a></div>
                     <div class="product_price">17.890.000</div>
                     <div class="amount_of_product">1 phiên bản</div>
                     <div class="more_infor_product"> Chi Tiết Cấu Hình<br> CPU:  Intel Core i5 13420H<br> RAM: 16GB DDR5 4800MHz (nâng cấp được)<br> Màn hình: 15.1", 2.5K(2560x1600) OLED, 500nits<br> Card Đồ họa:Intel UHD Graphics</div>
                 </div>
                 <div class="product_items">
                     <img class="product_img" src="assets/ThinkBook 14 G7+2025.jpg">
                     <div class="product_title"><a href="product_detail.jsp?id=4" style="text-decoration: none;color: black;">Thinkbook 14 G7+ 2025 Ultra 5 225H RAM 32GB SSD 1TB 14.5" 3K 120Hz</a></div>
                     <div class="product_price">21.590.000</div>
                     <div class="amount_of_product">1 phiên bản</div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình<br> CPU: Intel Core Ultra 5 225H<br> RAM: 32GB LPDDR5x 8533MHz, onboard,<br> Màn hình: 14.5″ 3K (3072×1920), ~500nits<br> Card Đồ họa: Intel® Arc™ 130T GPU (onboard)</div>
                 </div>
             </div>
                 <div class="shortyoutube">
                     <iframe width="250" height="444" class="videoshort" src="https://www.youtube.com/embed/XpD21zVWNqY?autoplay=1&loop=1&playlist=XpD21zVWNqY&mute=1" allowfullscreen ></iframe>
                     <iframe width="250" height="444" class="videoshort" src="https://www.youtube.com/embed/Gc0XVYBrYAw?autoplay=1&loop=1&playlist=Gc0XVYBrYAw&mute=1" allowfullscreen></iframe>
                 </div>
    </div>
    <div class="part3_content">
                <br><br><br><h1>Laptop theo nhu cầu</h1>
            <div class="product2"> 
                 <a href="#"><div class="product_items2"> 
                       <img class="product_img2" src="assets/vanphonghoctap.webp">
                       <div class="application_icon">
                           <img src="assets/photoshop.jpg">
                           <img src="assets/word.jpg">
                           <img src="assets/Google.jpg">
                       </div>
                       <div class="product_title">Học Tập,Văn Phòng</div>
                       <div class="more_infor_product">Được thiết kế cho việc xử lí các công việc văn phòng, học tập trên trường, không thích hợp để chơi game hay làm đồ họa</div>
                     </div></a> 
               <a href="#"><div class="product_items2"> 
                       <img class="product_img2" src="assets/dohoakythuat.webp">
                       <div class="application_icon">
                           <img src="assets/pr.jpg">
                           <img src="assets/autocad.jpg">
                           <img src="assets/solidwork.jpg">
                       </div>
                       <div class="product_title">Đồ Họa, Kỹ Thuật</div>
                       <div class="more_infor_product">Được thiết kế cho việc xử lí các công việc đồ họa chuyên dụng</div>
                     </div></a>
                <a href="#"> <div class="product_items2">  
                       <img class="product_img2" src="assets/laptoplaptrinh.webp">
                        <div class="application_icon">
                           <img src="assets/Visualstudiocode.jpg">
                           <img src="assets/react.jpg">
                           <img src="assets/csharp.jpg">
                       </div>
                       <div class="product_title">Lập Trình</div>
                       <div class="more_infor_product">Được thiết kế phù hợp cho việc lập trình,các tác vụ liên quan đến ngành lập trình</div>
                     </div></a>
              
               <a href="#"> <div class="product_items2"> 
                       <img class="product_img2" src="assets/gamelaptop.webp">
                        <div class="application_icon">
                           <img src="assets/lmht.jpg">
                           <img src="assets/pubg.jpg">
                           <img src="assets/blackwukong.jpg">
                       </div>
                       <div class="product_title">Game</div>
                       <div class="more_infor_product">Được thiết kế để chơi các tựa game esport, AAA, những tựa game nặng một cách mượt mà</div>
                     </div></a>
               
                <a href="#"> <div class="product_items2"> 
                       <img class="product_img2" src="assets/sieuphamlaptop.webp">
                        <div class="application_icon">
                           <img src="assets/word.jpg">
                           <img src="assets/Visualstudiocode.jpg">
                           <img src="assets/lmht.jpg">
                       </div>
                       <div class="product_title">Siêu Phẩm</div>
                       <div class="more_infor_product">Là những con laptop thuộc phân khúc cao cấp,cân bằng giữa thiết kế và hiệu năng</div>
                     </div></a>       
            </div>
        </div>
        <!--đây là phần nội dung thứ 4 trong phần content-->
        <div class="part4_content">
               <br><br><h1>Máy Tính Xách Tay</h1>
               <div class="product3">
                   <a href="product_detail.jsp?id=5"><div class="product_item3">
                    <div class="badge_product3">HOT!</div>
                     <img class="product_img" src="assets/acer_sadow_desc_img.png">
                     <div class="product_title">Acer Shadow Knight 6 i7 14650HX RAM 16GB SSD 1TB RTX 4060 16" 2.5K 240Hz</div>
                     <div class="product_price">25.990.000</div>
                     <div class="container_favourite">
                        <div class="amount_of_product">1 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">CPU:  Intel Core i7 14650HX<br>RAM: 16GB DDR5 5600MHz<br>Màn hình:  16", 2.5k+ (2560x1600) IPS, 240Hz<br>Đồ họa: NVIDIA GeForce RTX 4060 8GB GDDR6
                          <div class="product3_shopping">
                             <i class="fa fa-shopping-cart" href="product_detail.jsp?id=5"></i>
                             <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                 </div></a>
                  <a href="product_detail.jsp?id=6"><div class="product_item3">
                    <div class="badge_product3">Sản Phẩm HOT!</div>
                     <img class="product_img" src="assets/idea_padpro_14gt.jpg">
                     <div class="product_title">Lenovo IdeaPad 5 Pro 14 GT 2025 Ryzen AI 9 365 RAM 32GB SSD 1TB 14" 2.8K OLED 120Hz (XiaoXin Pro 14 GT AI ASP10)</div>
                     <div class="product_price">26.190.000</div>
                     <div class="container_favourite">
                        <div class="amount_of_product">1 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình:<br>-CPU: AMD Ryzen AI 9 H 365<br>-RAM: 32GB LPDDR5x 8000 onboard<br>-Màn hình: 14″,2.8K (2880x1800) OLED<br>-Card Đồ họa: AMD Radeon™ 880M
                         <div class="product3_shopping">
                             <i class="fa fa-shopping-cart" href="product_detail.jsp?id=6"></i>
                             <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                 </div></a>
                  <a href="product_detail.jsp?id=7"><div class="product_item3">
                    <div class="badge_product3">Bán Chạy</div>
                     <img class="product_img" src="assets/lenovoxaoxinpro14.png">
                     <div class="product_title">Lenovo IdeaPad Slim 5 2025 Ryzen 7 H 255 RAM 24GB SSD 1TB 2.8K OLED 120Hz (Lenovo XiaoXin Pro 14c AHP10R)</div>
                     <div class="product_price">18.490.000</div>
                     <div class="container_favourite">
                        <div class="amount_of_product">1 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình:<br>CPU:  AMD Ryzen 7 H 255<br>-RAM: 24GB DDR5 4800MHz<br>-Màn hình:  14″,2.8K (2880x1800)OLED<br>-Card Đồ họa: AMD Radeon™ 780M 
                        <div class="product3_shopping">
                             <i class="fa fa-shopping-cart" href="product_detail.jsp?id=7"></i>
                             <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                 </div></a>
                  <a href="product_detail.jsp?id=8"><div class="product_item3">
                    <div class="badge_product3">Bảo Hành 24 tháng lenovo</div>
                     <img class="product_img" src="assets/legiony7000p16iIRX10.jpg">
                     <div class="product_title">Lenovo Legion Y7000P 16IRX10 2025 i9 14900HX RAM 16GB SSD 1TB RTX 5060 16" 2.5K 240Hz</div>
                     <div class="product_price">34.490.000</div>
                    <div class="container_favourite">
                        <div class="amount_of_product">1 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình:<br> CPU: Intel core i9 14900HX<br>-RAM: 16GB DDR5 5600mhz<br>-Màn hình: 16" 2.5K (2560x1600), 240Hz<br>-Card Đồ họa: NVIDIA®GeForce® RTX™ 5060 8GB GDDR7 
                        <div class="product3_shopping">
                             <i class="fa fa-shopping-cart" href="product_detail.jsp?id=8"></i>
                             <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                 </div></a>
                  <a href="product_detail.jsp?id=9"><div class="product_item3">
                    <div class="badge_product3">Sắp Về</div>
                     <img class="product_img" src="assets/xaoxinpro16gt2025.jpg">
                     <div class="product_title">Lenovo IdeaPad 5 Pro 16 GT 2025 Ultra 5 225H RAM 32GB SSD 1TB 16" 2.8K OLED 120Hz (XiaoXin Pro 16 GT AI IAH10)</div>
                     <div class="product_price">23.900.000</div>
                     <div class="container_favourite">
                        <div class="amount_of_product">1 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình:<br> CPU:  Intel Core Ultra 5 225H<br>-RAM: 32GB LPDDR5x 8533 onboard<br>-Màn hình:  16″,2.8K (2880x1800) OLED<br>- Card Đồ họa:  Intel® Arc™ 130T (onboard)
                        <div class="product3_shopping">
                             <i class="fa fa-shopping-cart" href="product_detail.jsp?id=9"></i>
                             <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                 </div></a>
                  <a href="product_detail.jsp?id=10"><div class="product_item3">
                    <div class="badge_product3">Sắp Về</div>
                     <img class="product_img" src="assets/Gigabyte A16.png">
                     <div class="product_title">Gigabyte Gaming A16 GA6H CMHH2VN893SH i5-13420H RAM 16GB SSD 512GB RTX™ 4050 16" FHD+ 165Hz</div>
                     <div class="product_price">22.990.000</div>
                     <div class="container_favourite">
                        <div class="amount_of_product">1 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình:<br> CPU:  Intel Core i5 13420H<br>-RAM: 16GB DDR5 5200MHz<br>-Màn hình: 16″, FHD+ (1920x1200) IPS, 165Hz<br>-Đồ họa: Nvidia Geforce RTX 4050 6GB GDDR6
                         <div class="product3_shopping">
                             <i class="fa fa-shopping-cart" href="product_detail.jsp?id=10"></i>
                             <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                 </div></a>
                 <a href="product_detail.jsp?id=11"><div class="product_item3">
                    <div class="badge_product3">Sắp Về</div>
                     <img class="product_img" src="assets/legiony70002025.jpg">
                     <div class="product_title">Lenovo Legion 5 Y7000 15IRX10 2025 i7 14650HX RAM 16GB SSD 512GB RTX 5060 15.3" 2.5K 180Hz</div>
                     <div class="product_price">30.900.000</div>
                    <div class="container_favourite">
                        <div class="amount_of_product">1 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình:<br> CPU: Intel core i7 14650HX<br>-RAM: 16GB DDR5 5600mhz<br>-Màn hình: 15.3" 2.5K (2560x1600), 180Hz<br>Card Đồ họa: NVIDIA®GeForce® RTX™ 5060 8GB GDDR7
                        <div class="product3_shopping">
                             <i class="fa fa-shopping-cart" href="product_detail.jsp?id=11"></i>
                             <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                 </div></a>
                 <a href="product_detail.jsp?id=12"><div class="product_item3">
                    <div class="badge_product3">Bảo Hành 24 tháng lenovo</div>
                     <img class="product_img" src="assets/legionpro5r9000p16adr10.jpg">
                     <div class="product_title">Lenovo Legion Pro 5 R9000P 16ADR10 2025 Ryzen 9 8945HX RAM 32GB SSD 1TB RTX 5060 16" 2.5K 240Hz</div>
                     <div class="product_price">34.990.000</div>
                     <div class="container_favourite">
                        <div class="amount_of_product">1 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình:<br>-CPU: AMD Ryzen 9 8945HX<br>-RAM: 16GB DDR5 5200mhz<br>-Màn hình: 16 inches (2560x1600), 240Hz, 500nits<br>Card Đồ họa: NVIDIA®GeForce® RTX™ 5060 8GB GDDR7
                          <div class="product3_shopping">
                             <i class="fa fa-shopping-cart" href="product_detail.jsp?id=12"></i>
                             <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                 </div></a>
                 <a href="product_detail.jsp?id=13"><div class="product_item3">
                    <div class="badge_product3">Hết Hàng !</div>
                     <img class="product_img" src="assets/Lenovo_ideapad_slim_3_2025.png">
                     <div class="product_title">Lenovo IdeaPad Slim 3 15IRH10 2025 83K1002PVN i5 13420H RAM 16GB SSD 512GB 15.1" 2.5K OLED 165Hz</div>
                     <div class="product_price">17.890.000</div>
                      <div class="container_favourite">
                        <div class="amount_of_product">1 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình:<br> CPU:  Intel Core i5 13420H<br>-RAM: 16GB DDR5 4800MHz (nâng cấp được)<br>-Màn hình: 15.1", 2.5K(2560x1600) OLED, 500nits<br>-Card Đồ họa: Intel UHD Graphics
                         <div class="product3_shopping">
                             <i class="fa fa-shopping-cart" href="product_detail.jsp?id=13"></i>
                             <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                 </div></a>
                 <a href="product_detail.jsp?id=14"><div class="product_item3">
                    <div class="badge_product3">Bảo Hành 36 tháng lenovo</div>
                     <img class="product_img" src="assets/ThinkBook 14 G7+2025.jpg">
                     <div class="product_title">Thinkbook 14 G7+ 2025 Ultra 5 225H RAM 32GB SSD 1TB 14.5" 3K 120Hz</div>
                     <div class="product_price">21.590.000</div>
                     <div class="container_favourite">
                        <div class="amount_of_product">1 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình<br>-CPU: Intel Core Ultra 5 225H<br>-RAM: 32GB LPDDR5x 8533MHz, onboard<br>-Màn hình: 14.5″ 3K (3072×1920), ~500nits<br>-Đồ họa: Intel® Arc™ 130T GPU (onboard)
                          <div class="product3_shopping">
                             <i class="fa fa-shopping-cart" href="product_detail.jsp?id=14"></i>
                             <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                  </div></a>
                   </div>
               </div>
    <div class="part5_content">
                 <br><br><h1>Apple</h1>
                  <div class="product4">
                   
                      <a href="product_detail.jsp?id=15"><div class="product_item4">
                     <div class="badge_product4">HOT!</div>
                     <img class="product_img" src="assets/macbookrpo14M2webp.webp">
                     <div class="product_title">Macbook Pro 14 M2 Pro 10 Core RAM 16GB SSD 512GB 16 GPU Liquid Retina</div>
                     <div class="product_price">34.700.000</div>
                      <div class="container_favourite">
                        <div class="amount_of_product">2 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình<br>CPU: Apple M2 10 core<br>-RAM: 16GB<br>Màn hình: 14.2″ 3K Liquid Retina XDR (3024x1964)<br>Đồ họa: Apple M2 GPU 16 core
                        <div class="product4_shopping">
                            <i class="fa fa-shopping-cart" href="product_detail.jsp?id=15"></i>
                             <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                      </div></a>
                          <a href="product_detail.jsp?id=16"><div class="product_item4">
                      <div class="badge_product4">Bán chạy</div>
                     <img class="product_img" src="assets/macbookpro16M1pro.webp">
                     <div class="product_title">Macbook Pro 16 M1 Pro RAM 16GB SSD 512GB Liquid Retina 2021</div>
                     <div class="product_price">31.500.000</div>
                      <div class="container_favourite">
                        <div class="amount_of_product">2 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình<br>-CPU: M1 Pro 10 core<br>-RAM: 16GB<br>Màn hình: 16.2" Liquid Retina XDR (3456x2234)<br>Đồ họa: Apple M1 Pro GPU 16 core
                         <div class="product4_shopping">
                            <i class="fa fa-shopping-cart" href="product_detail.jsp?id=16"></i>
                             <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                      </div></a>
                          <a href="product_detail.jsp?id=17"><div class="product_item4">
                      <div class="badge_product4">HOT!</div>
                     <img class="product_img" src="assets/macbook_pro_14_m1_2021.webp">
                     <div class="product_title">Macbook Pro 14 M1 Pro 10-core CPU 16-core GPU RAM 16GB SSD 512GB Retina 2021</div>
                     <div class="product_price">30.200.000</div>
                     <div class="container_favourite">
                        <div class="amount_of_product">2 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình<br>-CPU: M1 Pro<br>-RAM/Ổ: 16GB/1TB<br>-Màn hình: Liquid Retina XDR (3024x1964)<br>-Đồ họa: Apple M1 Pro GPU
                        <div class="product4_shopping">
                             <i class="fa fa-shopping-cart" href="product_detail.jsp?id=17"></i>
                             <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                      </div></a>
                          <a href="product_detail.jsp?id=18"><div class="product_item4">
                      <div class="badge_product4">HOT!</div>
                     <img class="product_img" src="assets/macbook_pro_14_m1_2021.webp">
                     <div class="product_title">Macbook Pro 14 M1 Pro 8-Core CPU 14-Core GPU RAM 16GB SSD 512GB Retina 2021 - Bảo Hành 03 tháng</div>
                     <div class="product_price">27.500.000</div>
                      <div class="container_favourite">
                        <div class="amount_of_product">2 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình<br>-CPU: M1 Pro 8 core<br>-RAM: 16GB<br>Màn hình: Liquid Retina XDR (3024x1964)<br>-Đồ họa: Apple M1 Pro GPU 14 core
                         <div class="product4_shopping">
                               <i class="fa fa-shopping-cart" href="product_detail.jsp?id=17"></i>
                               <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                      </div></a>
                          <a href="product_detail.jsp?id=19"><div class="product_item4">
                     <div class="badge_product4">HOT!</div>
                     <img class="product_img" src="assets/macbook_pro_14_m1_2021.webp">
                     <div class="product_title">Macbook Pro 16 M1 Pro RAM 16GB SSD 512GB Liquid Retina 2021</div>
                     <div class="product_price">31.500.000</div>
                     <div class="container_favourite">
                        <div class="amount_of_product">1 phiên bản</div>
                        <div class="favourite_product">&#9825; Yêu thích</div>
                     </div>
                     <div class="more_infor_product">Chi Tiết Cấu Hình<br>-CPU: M1 Pro 10 core<br>-RAM: 16GB<br>-Màn hình: 16.2" Liquid Retina XDR (3456x2234)<br>-Đồ họa: Apple M1 Pro GPU 16 core
                         <div class="product4_shopping">
                                <i class="fa fa-shopping-cart" href="product_detail.jsp?id=17"></i>
                                 <button class="button_comparation">So Sánh</button>
                        </div>
                    </div>
                      </div></a>
                  </div>
        </div><br><br>
        <div class="promise_to_the_customer">
            <br><br>
            <div class="main_idea">
                <h1>Bạn Xứng Đáng Với Những Điều Tốt Nhất</h1>
                <h3>D_computer Factory có điều gì?</h3>
                <div class="container_promise_items">
                <div class="promise-items">
                     <i class="fa-solid fa-award" style="font-size: 60px;color:#13a1ed;"></i>
                     <h3>Chất Lượng Cao&Giá Thành Tốt Nhất</h3>
                     <p>Đem đến những chiếc latop nhập khẩu cao cấp với chất lượng dịch vụ không ngừng được nâng cao</p>
                </div>
                <div class="promise-items">
                     <i class="fa-solid fa-handshake" style="font-size: 60px;color:#13a1ed;"></i>
                     <h3>Chất Lượng Cao&Giá Thành Tốt Nhất</h3>
                     <p>Đem đến những chiếc latop nhập khẩu cao cấp với chất lượng dịch vụ không ngừng được nâng cao</p>
                </div>
                <div class="promise-items">
                     <i class="fa-solid fa-hand-holding-heart" style="font-size: 60px;color:#13a1ed;"></i>
                     <h3>Chất Lượng Cao&Giá Thành Tốt Nhất</h3>
                     <p>Đem đến những chiếc latop nhập khẩu cao cấp với chất lượng dịch vụ không ngừng được nâng cao</p>
                </div>
                <div class="desc_promise">
                     <h1>9000+</h1>
                     <p>Khách hàng tin tưởng</p>
                </div>
                 <div class="desc_promise">
                     <h1>15 năm+</h1>
                     <p>Trên thị trường từ năm 2008</p>
                </div>
                 <div class="desc_promise">
                     <h1>80+</h1>
                     <p>đối tác</p>
                </div>
                </div>
            </div>
        </div>
        <br><br><br>
        <h1 class="title_video_trungtran">Video D_computer</h1>
        <br>
        <div class="container_video_truntran">
                    <div class="video_trungtran">
                        <iframe
                        class="video_after_promise"
                        src="https://www.youtube.com/embed/Gc0XVYBrYAw?autoplay=1&loop=1&playlist=Gc0XVYBrYAw&mute=1" allowfullscreen
                            ></iframe>    
                    </div>
                       <div class="video_trungtran2">
                        <iframe
                        class="video_after_promise2"
                        src="https://www.youtube.com/embed/Gc0XVYBrYAw?autoplay=1&loop=1&playlist=Gc0XVYBrYAw&mute=1" allowfullscreen
                            ></iframe>    
                    </div>
                       <div class="video_trungtran3">
                        <iframe
                        class="video_after_promise3"
                        src="https://www.youtube.com/embed/Gc0XVYBrYAw?autoplay=1&loop=1&playlist=Gc0XVYBrYAw&mute=1" allowfullscreen
                            ></iframe>    
                    </div>
        </div><br><br><br>
                          <!--phần thông tin địa chỉ, thời gian hoạt động của cửa hàng
                            the part of information about the location , the time-working of the store-->
            <div class="container_desc_of_store">
                      <div class="desc_of_store_title">
                         <h1>Hệ Thống Showroom</h1>
                         <p>Thời Gian Mở Cửa:8h20-20h(T2-CN)<p>
                      </div>
               <div class="desc_of_store">
                    <div class="location_and_time_working">
                            <h3>01 THÁI HÀ</h3>
                                <p>Số 3 Ngõ 117 Thái Hà, Đống Đa, Hà Nội (có chỗ gửi ô tô thuận tiện)
                                <br>Bán hàng: 093 669 3388
                                <br>Kỹ thuật: 0911 992 995
                                <br>Zalo OA: zalo.manhdung.vn
                                <br>Lắng nghe góp ý: 0969.819.818</p>
                            <h3> 02 Phòng bán hàng Online</h3>
                                <p>Phục vụ đơn hàng online trên toàn quốc
                                <br>Bán hàng: 093 669 3388
                                <br>Kỹ thuật: 0911 992 995
                                <br>Zalo OA: zalo.manhdung.vn</p> 
                </div> 
                       <!--phần ảnh ở cuối web-->
                        <div class="img_of_store">
                        <div class="Duongde_reviewimage">
                        <img  alt="ảnh"  src="assets/banner_shop.png"></div>
                        </div>
                       <!--phần ảnh ở cuối web-->     
               </div>   
          </div>
     </div>
  </div>
  <br><br>
  <footer>
    <div class="footer_container">
     <div class="logo_footer">
         
    <p>Theo Dõi Chúng Tôi</p><br><br>
    <img src="assets/footera_notice_img.svg">
     </div>
          <div class="service_footer_1">
             <nav>
                <ul>
                    <li><a>HỖ TRỢ KHÁCH HÀNG &#9776;</a></li>
                    <li><a>Hỏi Đáp</a></li>
                    <li><a>Thông Tin Thanh Toán</a></li>
                    <li><a>Góp ý Khiếu Nại</a></li>
                    <li><a>Tuyển Dụng</a></li>
                    <li><a>Vận Chuyển</a></li>
                </ul>
             </nav>
         </div>
         <div class="service_footer_1">
             <nav>
                <ul>
                    <li><a>CHÍNH SÁCH  &#9776;</a></li>
                    <li><a>Chính sách bảo mật thông tin</a></li>
                    <li><a>Chính sách bảo trì, bảo hành</a></li>
                    <li><a>Chính sách thanh toán</a></li>
                    <li><a>Chính sách vận chuyển và giao nhận</a></li>
                    <li><a>Chính sách đổi trả và hoàn tiền</a></li>
                    <li><a>Chính sách kiểm hàng</a></li>
                    <li><a>Chính sách xử lí khiếu nại</a></li>
                </ul>
             </nav>
         </div>
         <div class="service_footer_1">
             <nav>
                <ul><li><a>DANH MỤC SẢN PHẨM &#9776;</a></li>
                    <li><a>Laptop MSI</a></li>
                    <li><a>Microsoft</a></li>
                    <li><a>Razer</a></li>
                    <li><a>Latop Asus</a></li>
                    <li><a>Macbook</a></li>
                </ul>
             </nav>
         </div>
         <div class="service_footer_1">
             <nav>
                <ul>
                    <li><a></a></li>
                    <li><a>Laptop Acer</a></li>
                    <li><a>Laptop Lenovo</a></li>
                    <li><a>Laptop Thinkpad</a></li>
                    <li><a>Laptop HP</a></li>
                    <li><a>Laptop Dell</a></li>
                </ul>
             </nav>
         </div>
</div>
      <br><br><br><br><br><br><br>
      <div class="desc_store_footer">
                      <p>Công ty TNHH Công Nghệ Số D-computer </p>
      <p>Địa chỉ đăng kí giấy phép: 2C Bạch Đằng, P. Chương Dương, Q. Hoàn Kiếm, TP. Hà Nội</p>
                  <p>MST 0109900432 do Sở KH và ĐT TP Hà Nội cấp ngày 28/01/2022</p>
<p>Địa chỉ Showroom Kinh Doanh Mua Hàng Tại: Số 3 Ngõ 117 Thái Hà, P. Trung Liệt, Q. Đống Đa, TP. Hà Nội</p>
                               <p>Hotline: 0328775956 </p>
                         <p>Mail:nguyendung28022005@gmail.com</p>
           </pre>
           </div>
  </footer>
</body>
</html>
