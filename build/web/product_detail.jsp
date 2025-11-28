<%-- 
    Document   : product-detail.jsp
    Created on : Oct 12, 2025, 8:42:51 AM
    Author     : Welcome to Windows10
    GHI CHÚ: file này để chuyển ảnh động từ database đấy các con vợ
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.Productdao" %>
<%@ page import="model.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/css.css">
    <link rel="stylesheet" href="css/product.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- dùng thư viện font awesome để lấy icon-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Chi Tiết Sản Phẩm</title>
 
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
                     <li>
                        <form action="search" method="get" style="display: flex;position: relative;">
                            <input class="input" type="text" name="query" placeholder="Tìm kiếm laptop và phụ kiện">
                            <button type="submit" class="search-button">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                     </li> 
                    <li><a href="dangnhap.jsp">đăng nhập</a></li>
                    <li><a href="dangki.jsp">Đăng kí</a></li>
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
                        <li><a href="datlich.html">Đặt Lịch hẹn để được hỗ trợ tốt hơn</a></li>
                        <li><a href="#">LEGION 2025 LINE-UP</a></li>
                        <li><a href="#">LENOVO IDEAPAD 2024-2025</a></li>
                    </ul>
                </nav>
            </div>
        </div> 
    </div>
    <div class="desc_of_product_page">
        <%
            int id = Integer.parseInt(request.getParameter("id")); // Lấy id từ URL
            Productdao dao = new Productdao();
            Product p = dao.getProductById(id);
            if (p != null) {
                
                // Định dạng giá tiền
                NumberFormat formatter = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
                String formattedPrice = formatter.format(p.getProduct_price());
        %>
        
        <div class="desc_img_product">
          <h3><%= p.getProduct_title() %></h3>
            <% if (p.getImages() != null && !p.getImages().isEmpty()) { %>
                <img id="desc_img_0" src="<%= p.getImages().get(0) %>" alt="Main Image">
                <div class="list_desc_img_product">
                    <% for (int i = 1; i < p.getImages().size(); i++) { %>
                        <img id="desc_img_<%= i %>" src="<%= p.getImages().get(i) %>" alt="Image <%= i %>">
                    <% } %>
                </div>
            <% } else { %>
                <p>Không có hình ảnh cho sản phẩm này.</p>
            <% } %>
             
            <div class="list_social_media">
                <ul class="icon-list">
                    <li><a href="#"><i class="fa-brands fa-youtube"></i><br>Video Review</a></li>
                    <li><a href="#"><i class="fa-regular fa-image"></i><br>Thư Viện ảnh</a></li>
                    <li><a href="#"><i class="fa-solid fa-camera"></i><br>ảnh khách hàng</a></li>
                    <li><a href="#"><i class="fa-solid fa-heart"></i><br>Yêu thích</a></li>
                </ul>
            </div>
            <div class="share_group">
                <ul class="share_group_Fb_Yt">
                    <li><a href="#"><img src="assets/FaceBook.jpg">Tham gia group khách hàng</a></li>
                    <li><a href="#"><img src="assets/YouTube.jpg">Subscribe kênh D-computer</a></li>
                </ul>
            </div>
            <div class="video_mota">
                <p style="text-align: center;font-size: 30px;color:#2d5cf7;">video chi tiết đánh giá sản phẩm</p>
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/461A_5xd68w?si=l91l2CyEH8HRnbAY"
                        title="YouTube video player"
                        frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen>
                </iframe>
            </div>
        </div>
        <div class="right_sale">
            <h2>Ưu đãi sẽ kết thúc trong</h2>
            <div id="counttime" class="counttime"></div>
            <h1><%= formattedPrice %> VND</h1>
            <h2>Lựa chọn cấu hình khác</h2>
            <div class="option_configuration">
                <a href="#">
                    <p>Acer Shadow Knight 6 i9 14650HX RAM 16GB SSD 1TB RTX 5060 16" 2.5K 240Hz <div class="product_price"><%= formattedPrice %> VND</div></p>
                    <p class="guarantee_promise"><%= p.getConditionn() %> bảo hành <%= p.getWarranty() %></p>
                    <div class="amount_of_product"><%= p.getAmount_of_product() %> phiên bản</div>
                </a>
            </div>
            <br><br>
            <div class="promotion_subsidy">
                <div class="promotion">
                    <span class="label-uu-dai">ƯU ĐÃI</span>
                    <p>Gói 15 ngày bao test</p>
                    <p>Balo chống sốc mạnh dũng</p>
                    <p>Gói cài đặt window và phần mềm trọn đời</p>
                </div>
                <div class="subsidy">
                    <span class="label-tro-gia">TRỢ GIÁ 5%</span>
                    <p>Khi mua phụ kiện theo máy</p>
                    <p>Khi mua ram và nâng cấp ram</p>
                    <p>Khi sử dụng dịch vụ sửa chữa bảo hành</p>
                </div>
            </div>
            <div class="container_buy_now">
                <a class="buy_now" href="payment_product.jsp?product_id=<%= p.getId() %>">
                    Mua Ngay<br>
                    <span>(Giao tận nơi hoặc nhận tại cửa hàng)</span>
                </a>
                <div class="payment_method">
                    <a class="tragop" href="#">
                        Trả góp nhanh<br>
                        <span>(Không thẩm định giấy tờ)</span>
                    </a>
                    <a class="tragopquathe" href="#">
                        Trả Góp qua thẻ<br>
                        <span>(Visa,Master Card,JCB,Amex)</span>
                    </a>
                </div>
            </div>
              <form action="AddToCartServlet" method="post" id="addToCartForm" style="margin-top: 15px;">
            
               
                <input type="hidden" name="productID" value="<%= p.getId() %>">
                <input type="hidden" name="product_title" value="<%= p.getProduct_title() %>">
               <input type="hidden" name="price" value="<%= (long) p.getProduct_price() %>">
            
                
                <div style="display: flex; align-items: center; margin-bottom: 10px; justify-content: space-between;">
                    <label for="quantity" style="font-weight: bold;">Số lượng:</label>
                    <input type="number" id="quantity" name="quantity" value="1" min="1" style="width: 60px; padding: 5px; border: 1px solid #ccc; text-align: center;">
                </div>
            
                
                <button type="submit" class="add-to-cart-standalone-btn" 
                        style="width: 100%; padding: 10px; font-size: 16px; background-color: #f7941d; color: white; border: none; cursor: pointer; border-radius: 5px;">
                    <i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
                </button>
            </form>
             
            <div class="send_cmt">
                <input type="text" placeholder="Để lại số điện thoại để được tư vấn">
                <button type="submit">Gửi</button>
            </div>
            <div class="accessory_option">
                <fieldset>
                    <legend>Chọn phụ kiện đính kèm của bạn</legend>
                    <div class="checkbox-item">
                        <input type="checkbox" id="earphone" name="ear_phone" value="selected">
                        <label for="earphone">
                            <img src="assets/earphone.jpg" alt="Tai nghe không dây" class="accessory-image">
                            <span class="accessory-text">Tai Nghe không dây<span>+499K</span></span>
                        </label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="keyboard" name="key_board" value="selected">
                        <label for="keyboard">
                            <img src="assets/keyboard.jpg" alt="Bàn phím cơ" class="accessory-image">
                            <span class="accessory-text">Bàn Phím Cơ Chất Lượng<span>+899K</span></span>
                        </label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="mouse" name="mouse_blu" value="selected">
                        <label for="mouse">
                            <img src="assets/mouse.jpg" alt="Chuột không dây" class="accessory-image">
                            <span class="accessory-text">Chuột không dây<span>+199K</span></span>
                        </label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="RAM" name="ram_laptop" value="selected">
                        <label for="RAM">
                            <img src="assets/ram.jpg" alt="RAM chất lượng cao" class="accessory-image">
                            <span class="accessory-text">RAM chất lượng cao<span>+699K</span></span>
                        </label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="monitor" name="monitor_pc" value="selected">
                        <label for="monitor">
                            <img src="assets/monitor.jpg" alt="Màn hình rời" class="accessory-image">
                            <span class="accessory-text">Màn hình rời tần số quét cao<span>+1999K</span></span>
                        </label>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <div class="configuration_rating">
        <div class="detail_configuration">
            <span>Thông số kĩ thuật</span>
            <table>
                <tr><td>CPU(Bộ xử lí)</td><td><%= p.getCpu() %></td></tr>
                <tr><td>RAM(Bộ nhớ trong)</td><td><%= p.getRam() %></td></tr>
                <tr><td>Storage(ổ cứng)</td><td><%= p.getStorage() %></td></tr>
                <tr><td>Card đồ họa</td><td><%= p.getGpu() %></td></tr>
                <tr><td>Màn hình</td><td><%= p.getScreen() %></td></tr>
                <tr><td>Pin</td><td><%= p.getBattery() %></td></tr>
                <tr><td>Âm thanh</td><td><%= p.getAudio() %></td></tr>
                <tr><td>Cổng kết nối vật lý</td><td><%= p.getPorts() %></td></tr>
                <tr><td>Kết nối không dây</td><td><%= p.getWireless() %></td></tr>
                <tr><td>Trọng lượng</td><td><%= p.getWeight() %></td></tr>
                <tr><td>Màu sắc</td><td><%= p.getColor() %></td></tr>
                <tr><td>Tình trạng sản phẩm</td><td><%= p.getConditionn() %></td></tr>
                <tr><td>Bảo Hành</td><td><%= p.getWarranty() %></td></tr>
            </table>
        </div>
        <div class="rating_of_professional">
            <span>đánh giá từ chuyên gia</span>
            <h1><%= p.getProduct_title().contains("2025") ? "2025" : "" %></h1>
            <div class="container">
                <table>
                    <tr>
                        <th>Thông số</th>
                        <th>Acer Shadow Knight <%= p.getProduct_title().contains("2025") ? "2025" : "" %></th>
                        <th>Acer Nitro V 16 AI (AMD) 2025</th>
                        <th>Lenovo LOQ 15 Gen10 2025</th>
                    </tr>
                    <tr><td><b>CPU</b></td><td><%= p.getCpu() %></td><td>AMD Ryzen 7 AI 350 (50 TOPS NPU)</td><td>Intel Core i7-14700HX (20 nhân, tương đương thế hệ 14)</td></tr>
                    <tr><td><b>GPU</b></td><td><%= p.getGpu() %> (<%= p.getScreen() %>)</td><td>NVIDIA GeForce RTX 5070 Laptop GPU</td><td>NVIDIA GeForce RTX 4060 8GB (15.6\" FHD 144Hz)</td></tr>
                    <tr><td><b>RAM</b></td><td><%= p.getRam() %></td><td>Up to 32GB DDR5 (tùy config)</td><td>16GB DDR5 5600MT/s (single stick, hỗ trợ nâng cấp)</td></tr>
                    <tr><td><b>Storage</b></td><td><%= p.getStorage() %></td><td>Up to 1TB PCIe SSD (hỗ trợ mở rộng)</td><td>512GB/1TB PCIe SSD (hỗ trợ nâng cấp)</td></tr>
                    <tr><td><b>Màn hình</b></td><td><%= p.getScreen() %></td><td>16\" WQXGA (2560x1600), 180Hz, 400 nits, 100% sRGB</td><td>15.6\" FHD (1920x1080), 144Hz</td></tr>
                    <tr><td><b>Pin</b></td><td><%= p.getBattery() %></td><td>~70Wh (tùy config)</td><td>60Wh</td></tr>
                    <tr><td><b>Trọng lượng</b></td><td><%= p.getWeight() %></td><td>~2.1kg</td><td>~2.4kg</td></tr>
                    <tr><td><b>Giá ước tính (USD)</b></td><td>~1,200-1,400</td><td>~1,100-1,300</td><td>~1,000-1,200</td></tr>
                </table>
                <div class="review-container">
                    <h2>Đánh Giá <%= p.getProduct_title() %></h2>
                    <p><b>Điểm mạnh:</b> Hiệu năng mạnh, màn hình chất lượng, RAM và storage dễ nâng cấp.</p>
                    <p><b>Điểm yếu:</b> Trọng lượng khá lớn, pin không quá nổi bật khi chơi game nặng.</p>
                </div>
            </div>
            <p>Hiệu năng ⭐⭐⭐⭐⭐</p>
            <p>Màn hình⭐⭐⭐⭐</p>
            <p>Cân nặng⭐⭐⭐</p>
            <p>Hiệu năng/ giá thành⭐⭐⭐⭐</p>
        </div>
    </div>
    <!-- phần đánh giá của khách hàng -->
    <div class="review-section">
        <h3>Đánh giá của khách hàng</h3>
        <div class="review-summary">
            <div class="average-rating">
                <span class="score">0.0</span>
                <span class="stars">★★★★★</span>
                <p>(0 đánh giá)</p>
            </div>
        </div>
        <div class="review-form">
            <input type="text" id="name" placeholder="Tên của bạn">
            <select>
                <option value="5">⭐⭐⭐⭐⭐</option>
                <option value="4">⭐⭐⭐⭐</option>
                <option value="3">⭐⭐⭐</option>
                <option value="2">⭐⭐</option>
                <option value="1">⭐</option>
            </select>
            <textarea id="comment" placeholder="Viết bình luận..."></textarea>
            <button onclick="addReview()">Gửi đánh giá</button>
        </div>
        <div class="reviews-list"></div>
    </div>
    <br><br><br>
    <div class="container_desc_of_store">
        <div class="desc_of_store_title">
            <h1>Hệ Thống Showroom</h1>
            <p>Thời Gian Mở Cửa: 8h20-20h (T2-CN)</p>
        </div>
        <div class="desc_of_store">
            <div class="location_and_time_working">
                <h3>01 THÁI HÀ</h3>
                <p>Số 3 Ngõ 117 Thái Hà, Đống Đa, Hà Nội (có chỗ gửi ô tô thuận tiện)<br>
                   Bán hàng: 093 669 3388<br>
                   Kỹ thuật: 0911 992 995<br>
                   Zalo OA: zalo.nguyenmanhdung.vn<br>
                   Lắng nghe góp ý: 0969.819.818</p>
                <h3>02 Phòng bán hàng Online</h3>
                <p>Phục vụ đơn hàng online trên toàn quốc<br>
                   Bán hàng: 093 669 3388<br>
                   Kỹ thuật: 0911 992 995<br>
                   Zalo OA: zalo.nguyenmanhdung.vn</p>
            </div>
            <div class="img_of_store">
                <div class="Duongde_reviewimage">
                    <img alt="ảnh" src="assets/banner_shop.png">
                </div>
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
                    <li><a>CHÍNH SÁCH &#9776;</a></li>
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
        <p>Công ty TNHH Công Nghệ Số D-computer</p>
        <p>Địa chỉ đăng kí giấy phép: 2C Bạch Đằng, P. Chương Dương, Q. Hoàn Kiếm, TP. Hà Nội</p>
        <p>MST 0109900432 do Sở KH và ĐT TP Hà Nội cấp ngày 28/01/2022</p>
        <p>Địa chỉ Showroom Kinh Doanh Mua Hàng Tại: Số 3 Ngõ 117 Thái Hà, P. Trung Liệt, Q. Đống Đa, TP. Hà Nội</p>
        <p>Hotline: 0328775956</p>
        <p>Mail: nguyendung28022005@gmail.com</p>
    </div>
</footer>
   <script src="js/product.js"></script>
</body>
</html>
<%
    } else {
        out.println("Sản phẩm không tồn tại!");
    }
%>