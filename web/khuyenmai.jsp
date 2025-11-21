<%-- 
Document: newjsp
Created on : Oct 10, 2025, 2:25:37 PM
Author: Welcome to Windows10
Mục đích: Trang khuyến mãi sử dụng JSP, JSTL (giả định) và Tailwind CSS.
--%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Khuyến Mãi Đỉnh Cao | D_Computer</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* Sử dụng Inter font cho đồng nhất */
        body {
            font-family: 'Inter', sans-serif;
        }

        /* Hiệu ứng card */
        .card-hover {
            transition: transform 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94), box-shadow 0.3s ease;
        }
        .card-hover:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(255, 165, 0, 0.3); /* Ánh sáng màu vàng cam */
        }

        /* Header Background và Animation */
        .header-bg {
            /* Thay đổi gradient cho hiện đại hơn */
            background: linear-gradient(135deg, #001f5c, #005fbc); 
            position: relative;
            overflow: hidden;
            border-bottom-left-radius: 50px;
            border-bottom-right-radius: 50px;
        }
        .header-overlay {
            background: rgba(0, 0, 0, 0.2);
            padding: 4rem 0 6rem; /* Tăng padding dưới */
        }
        .header-content {
            animation: fadeIn 1.2s ease-in-out;
        }
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        /* Thanh điều hướng */
        .nav-bar {
            background-color: #001f5c; 
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
        }

        /* Tăng tính responsive cho ảnh */
        .promo-img {
            max-width: 100%;
            height: 12rem; /* Chiều cao cố định */
            object-fit: cover;
            border-radius: 0.5rem;
        }

        /* Footer */
        .footer-bg {
            background-color: #034b94;
        }
    </style>
    
<%  
    // ******* LẤY THÔNG TIN USER TỪ SESSION *******
    // Đã import model.User ở trên
    Object userObj = session.getAttribute("currentUser"); 
    model.User user = null; 
    
    if (userObj != null) {
        user = (model.User) userObj;
    }

    // Giả sử class User có phương thức getFullName() hoặc getUsername()
    String userName = (user != null) ? user.getUserName() : null;
%>
</head>
<body class="bg-gray-50 text-gray-800">
    
    <!-- Thanh điều hướng (NavBar) -->
    <nav class="nav-bar sticky top-0 z-50">
        <div class="container mx-auto px-4 py-3 flex flex-wrap justify-between items-center">
            <div class="text-2xl font-extrabold text-yellow-400">D_Computer</div>
            <div class="flex flex-wrap items-center space-x-2 md:space-x-6 text-sm md:text-base mt-2 md:mt-0">
                <a href="index.jsp" class="text-white hover:text-yellow-300 transition duration-200 py-1 px-2 rounded-md">Trang Chủ</a>
                <a href="goithieu.jsp" class="text-white hover:text-yellow-300 transition duration-200 py-1 px-2 rounded-md">Giới Thiệu</a>
                <a href="khuyenmai.jsp" class="text-yellow-400 font-semibold bg-blue-700 py-1 px-3 rounded-lg shadow-md">Khuyến Mãi</a>
                <a href="diachi.jsp" class="text-white hover:text-yellow-300 transition duration-200 py-1 px-2 rounded-md">Địa Chỉ</a>
                
                <% if (user == null) { %>
                    <a href="dangnhap.jsp" class="text-white hover:text-yellow-300 transition duration-200 py-1 px-2 rounded-md">Đăng Nhập</a>
                    <a href="dangki.jsp" class="text-white hover:text-yellow-300 transition duration-200 py-1 px-2 rounded-md">Đăng Kí</a>
                <% } else { %>
                    <span class="text-white py-1 px-3 rounded-lg bg-blue-500 font-medium">Xin chào, <%= userName != null ? userName : "Khách hàng" %></span>
                    <a href="LogoutServlet" class="bg-red-500 text-white hover:bg-red-600 transition duration-200 py-1 px-3 rounded-lg shadow-md">Đăng xuất</a>
                <% } %>
            </div>
        </div>
    </nav>


    <header class="header-bg text-white">
        <div class="header-overlay">
            <div class="container mx-auto text-center px-4 header-content">
                <h1 class="text-5xl md:text-7xl font-extrabold tracking-tight drop-shadow-lg">Khuyến Mãi Đỉnh Cao</h1>
                <h1 class="text-5xl md:text-7xl font-extrabold tracking-tight text-yellow-300">D_Computer</h1>
                <p class="mt-4 text-xl md:text-2xl opacity-90 max-w-3xl mx-auto font-light">Nơi mang đến những sản phẩm công nghệ chất lượng với giá **ưu đãi bất ngờ**!</p>
                <p class="mt-2 text-lg font-medium opacity-80 italic">Slogan: "Công nghệ hiện đại, giá cả phải chăng"</p>
                <a href="#promotions" class="mt-8 inline-block bg-yellow-400 text-gray-900 px-10 py-4 rounded-full font-bold text-lg hover:bg-yellow-300 transition-colors shadow-2xl transform hover:scale-105 active:scale-95">Khám Phá Ưu Đãi Ngay! &gt;&gt;</a>
            </div>
        </div>
    </header>


    <section id="promotions" class="container mx-auto py-16 px-4">
        <h2 class="text-4xl font-extrabold text-center text-blue-900 mb-12 relative">
            <span class="inline-block pb-2 border-b-4 border-yellow-500">🔥 Ưu Đãi Đặc Biệt Hiện Có 🔥</span>
        </h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-10">

            <!-- Ưu đãi 1: Giảm Giá 30% Laptop -->
            <div class="bg-white rounded-xl shadow-2xl p-6 card-hover border-t-8 border-red-500 flex flex-col justify-between">
                <div>
                    <img src="https://placehold.co/600x400/1e40af/ffffff?text=LAPTOP+DEAL" alt="Khuyến mãi Laptop" class="promo-img w-full rounded-lg mb-4">
                    <h2 class="text-2xl font-bold mt-3 text-red-600">Giảm SỐC 30% Toàn Bộ Laptop</h2>
                    <p class="text-gray-600 mt-2 text-sm">Áp dụng cho tất cả laptop từ **10/10/2025** đến **20/10/2025**. Từ gaming hiệu năng cao đến văn phòng mỏng nhẹ, tất cả đều được giảm giá khủng!</p>
                </div>
                <div>
                    <span class="mt-4 inline-block bg-red-100 text-red-700 px-4 py-1 text-xs font-bold rounded-full animate-pulse">Hết hạn: 20/10/2025</span>
                    <a href="#" class="mt-4 inline-block bg-red-600 text-white px-5 py-2 rounded-full font-medium hover:bg-red-700 transition duration-300 w-full text-center shadow-lg">Mua Ngay &gt;</a>
                </div>
            </div>

            <!-- Ưu đãi 2: Mua 1 Tặng 1 Phụ kiện -->
            <div class="bg-white rounded-xl shadow-2xl p-6 card-hover border-t-8 border-green-500 flex flex-col justify-between">
                <div>
                    <img src="https://placehold.co/600x400/059669/ffffff?text=ACCESSORY+BOGO" alt="Khuyến mãi Phụ kiện" class="promo-img w-full rounded-lg mb-4">
                    <h2 class="text-2xl font-bold mt-3 text-green-700">Mua 1 Tặng 1 Phụ Kiện Cao Cấp</h2>
                    <p class="text-gray-600 mt-2 text-sm">Mua một chuột hoặc bàn phím bất kỳ, nhận ngay một phụ kiện tương tự **miễn phí** (Giá trị thấp hơn). Ưu đãi áp dụng cho các mặt hàng công nghệ chọn lọc.</p>
                </div>
                <div>
                    <span class="mt-4 inline-block bg-green-100 text-green-700 px-4 py-1 text-xs font-bold rounded-full">Hết hạn: 15/10/2025</span>
                    <a href="#" class="mt-4 inline-block bg-green-600 text-white px-5 py-2 rounded-full font-medium hover:bg-green-700 transition duration-300 w-full text-center shadow-lg">Xem Chi Tiết &gt;</a>
                </div>
            </div>

            <!-- Ưu đãi 3: Giảm 50% Cho Đơn Hàng Lớn -->
            <div class="bg-white rounded-xl shadow-2xl p-6 card-hover border-t-8 border-yellow-500 flex flex-col justify-between">
                <div>
                    <img src="https://placehold.co/600x400/f59e0b/000000?text=BIG+ORDER+50%25" alt="Khuyến mãi Đơn hàng" class="promo-img w-full rounded-lg mb-4">
                    <h2 class="text-2xl font-bold mt-3 text-yellow-700">Giảm 50% Cho Đơn Hàng Lớn</h2>
                    <p class="text-gray-600 mt-2 text-sm">Áp dụng cho các đơn hàng từ **10.000.000 VNĐ** trở lên. **Chỉ trong 3 ngày vàng** (10/10/2025 - 12/10/2025). Cơ hội để sắm PC gaming hoặc thiết bị cao cấp.</p>
                </div>
                <div>
                    <span class="mt-4 inline-block bg-yellow-100 text-yellow-700 px-4 py-1 text-xs font-bold rounded-full">Hết hạn: HÔM NAY (12/10/2025)</span>
                    <a href="#" class="mt-4 inline-block bg-yellow-600 text-white px-5 py-2 rounded-full font-medium hover:bg-yellow-700 transition duration-300 w-full text-center shadow-lg">Đặt Hàng Ngay &gt;</a>
                </div>
            </div>
        </div>
    </section>


    <footer class="footer-bg text-white py-12 mt-16">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-2 md:grid-cols-5 gap-10">
                <!-- Cột 1: Logo & Theo dõi -->
                <div class="col-span-2 md:col-span-1">
                    <p class="text-xl font-bold mb-4 text-yellow-400">D_Computer</p>
                    <p class="text-sm">Kết nối với chúng tôi để không bỏ lỡ những ưu đãi mới nhất!</p>
                    
                    <!-- Sửa lại đường dẫn ảnh cho đúng với thư mục assets -->
                    <!-- Dùng placeholder vì không có file svg này -->
                    <img src="https://placehold.co/100x40/003366/ffffff?text=Verified" alt="Footer Notice" class="mt-4 w-24 h-auto rounded-md opacity-80">
                    
                    <!-- Thêm các icon mạng xã hội (Tailwind utilities) -->
                    <div class="flex space-x-3 mt-6">
                        <a href="#" class="w-8 h-8 flex items-center justify-center bg-blue-700 rounded-full hover:bg-blue-800 transition duration-300 shadow-md">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-white" fill="currentColor" viewBox="0 0 24 24"><path d="M9 8h-3v4h3v12h5v-12h3.642l.358-4h-4v-1.667c0-.955.192-1.333 1.115-1.333h2.885v-5h-3.808c-3.596 0-5.192 1.583-5.192 4.615v3.385z"/></svg>
                        </a>
                        <a href="#" class="w-8 h-8 flex items-center justify-center bg-pink-600 rounded-full hover:bg-pink-700 transition duration-300 shadow-md">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-white" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2.163c3.204 0 3.584.013 4.85.071 1.17.055 1.805.249 2.227.464.426.225.785.499 1.151.865.366.366.64.725.865 1.15.215.422.408 1.057.464 2.227.058 1.265.071 1.645.071 4.85s-.013 3.585-.071 4.85c-.056 1.17-.25 1.805-.465 2.227-.225.426-.499.785-.865 1.15-.366.366-.725.64-1.15.865-.422.215-1.057.408-2.227.464-1.267.058-1.646.071-4.85.071s-3.585-.013-4.85-.071c-1.17-.056-1.805-.25-2.227-.465-.426-.225-.499-.785-1.15-.865-.366-.366-.725-.64-.865-1.15-.215-.422-.409-1.057-.465-2.227-.058-1.265-.071-1.645-.071-4.85s.013-3.585.071-4.85c.056-1.17.25-1.805.465-2.227.225-.426.499-.785.865-1.15.366-.366.725-.64 1.15-.865.422-.215 1.057-.409 2.227-.465 1.267-.058 1.645-.071 4.85-.071z"/> </svg>
                        </a>
                        <!-- Thêm Zalo/YouTube hoặc các kênh khác nếu cần -->
                    </div>
                </div>

                <!-- Cột 2: HỖ TRỢ KHÁCH HÀNG -->
                <div class="service_footer_1">
                    <p class="text-lg font-bold mb-4 text-yellow-300">HỖ TRỢ KHÁCH HÀNG</p>
                    <ul class="list-none p-0 text-sm space-y-3">
                        <li><a href="#" class="hover:text-yellow-400 transition-colors">Hỏi Đáp FAQ</a></li>
                        <li><a href="#" class="hover:text-yellow-400 transition-colors">Thông Tin Thanh Toán</a></li>
                        <li><a href="#" class="hover:text-yellow-400 transition-colors">Góp ý Khiếu Nại</a></li>
                        <li><a href="#" class="hover:text-yellow-400 transition-colors">Tuyển Dụng Nhân Sự</a></li>
                        <li><a href="#" class="hover:text-yellow-400 transition-colors">Chính sách Vận Chuyển</a></li>
                    </ul>
                </div>

                <!-- Cột 3: CHÍNH SÁCH -->
                <div class="service_footer_1">
                    <p class="text-lg font-bold mb-4 text-yellow-300">CHÍNH SÁCH</p>
                    <ul class="list-none p-0 text-sm space-y-3">
                        <li><a href="#" class="hover:text-yellow-400 transition-colors">Chính sách bảo mật thông tin</a></li>
                        <li><a href="#" class="hover:text-yellow-400 transition-colors">Chính sách bảo trì, bảo hành</a></li>
                        <li><a href="#" class="hover:text-yellow-400 transition-colors">Chính sách thanh toán</a></li>
                        <li><a href="#" class="hover:text-yellow-400 transition-colors">Chính sách đổi trả và hoàn tiền</a></li>
                        <li><a href="#" class="hover:text-yellow-400 transition-colors">Chính sách xử lí khiếu nại</a></li>
                    </ul>
                </div>

                <!-- Cột 4: DANH MỤC SẢN PHẨM (2 Cột nhỏ trên Mobile) -->
                <div class="col-span-2 md:col-span-2 grid grid-cols-2 gap-4">
                    <div>
                        <p class="text-lg font-bold mb-4 text-yellow-300">SẢN PHẨM HOT</p>
                        <ul class="list-none p-0 text-sm space-y-3">
                            <li><a href="#" class="hover:text-yellow-400 transition-colors">Laptop Gaming MSI</a></li>
                            <li><a href="#" class="hover:text-yellow-400 transition-colors">Macbook</a></li>
                            <li><a href="#" class="hover:text-yellow-400 transition-colors">Laptop Asus ROG</a></li>
                            <li><a href="#" class="hover:text-yellow-400 transition-colors">Laptop Acer Predator</a></li>
                            <li><a href="#" class="hover:text-yellow-400 transition-colors">Laptop Thinkpad</a></li>
                        </ul>
                    </div>
                    <div>
                        <p class="text-lg font-bold mb-4 text-yellow-300">THƯƠNG HIỆU KHÁC</p>
                        <ul class="list-none p-0 text-sm space-y-3">
                            <li><a href="#" class="hover:text-yellow-400 transition-colors">Microsoft Surface</a></li>
                            <li><a href="#" class="hover:text-yellow-400 transition-colors">Razer</a></li>
                            <li><a href="#" class="hover:text-yellow-400 transition-colors">Laptop Dell XPS</a></li>
                            <li><a href="#" class="hover:text-yellow-400 transition-colors">Laptop HP</a></li>
                            <li><a href="#" class="hover:text-yellow-400 transition-colors">Laptop Lenovo</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Thông tin công ty (Footer Bottom) -->
        <div class="container mx-auto px-4 mt-12 pt-6 border-t border-blue-800 text-center">
            <p class="text-sm">© 2025 Công ty TNHH Công Nghệ Số D-computer. All Rights Reserved.</p>
            <p class="text-sm mt-1">Địa chỉ đăng kí giấy phép: 2C Bạch Đằng, P. Chương Dương, Q. Hoàn Kiếm, TP. Hà Nội</p>
            <p class="text-sm mt-1">MST 0109900432 do Sở KH và ĐT TP Hà Nội cấp ngày 28/01/2022</p>
            <p class="text-sm mt-1 font-semibold text-yellow-300">Địa chỉ Showroom Kinh Doanh Mua Hàng Tại: Số 3 Ngõ 117 Thái Hà, P. Trung Liệt, Q. Đống Đa, TP. Hà Nội</p>
            <p class="text-sm mt-1">Hotline: <span class="font-bold">0328775956</span> | Mail: <a href="mailto:nguyendung28022005@gmail.com" class="underline hover:text-yellow-400">nguyendung28022005@gmail.com</a></p>
        </div>
    </footer>
</body>
</html>
