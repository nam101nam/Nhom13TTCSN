<%-- 
    Document   : datlich
    Created on : Oct 10, 2025, 3:19:02 PM
    Author     : Welcome to Windows10
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Lịch Hẹn - D_Computer</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .header-bg {
            background-color: #034b94;
            position: relative;
            overflow: hidden;
        }
        .header-content {
            animation: slideIn 1s ease-in-out;
        }
        @keyframes slideIn {
            0% { opacity: 0; transform: translateX(-20px); }
            100% { opacity: 1; transform: translateX(0); }
        }
        .logo-img {
            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));
        }
        footer {
            background-color: #034b94;
            padding: 40px 0;
        }
        footer p {
            background-color: #034b94;
            color: #fff;
            margin: 0;
        }
        .footer_container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: flex-start; 
            gap: 60px;
            background-color: #034b94;
            padding: 0 1rem; 
            flex-wrap: wrap; 
            justify-content: space-around; 
        }
        .service_footer_1 {
            background-color: #034b94;
            flex-basis: 200px; 
        }
        .service_footer_1 ul {
            padding: 0;
            margin: 0;
            list-style: none;
            background-color: #034b94;
        }
        .service_footer_1 ul li {
            background-color: #034b94;
        }
        .service_footer_1 ul li a {
            text-decoration: none;
            font-size: 14px;
            color: #fff;
            background-color: #034b94;
            padding: 8px 0px; 
            display: block; 
        }
        .service_footer_1 ul li:first-child a {
            font-weight: bold;
            font-size: 16px;
            padding-bottom: 15px;
        }
        .service_footer_1 ul li a:hover {
            letter-spacing: 0.5px;
            transition: 0.3s;
            color: #fcd34d; 
            cursor: pointer;
        }
        .logo_footer {
            background-color: #034b94;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            flex-basis: 150px;
        }
        .desc_store_footer {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px 1rem;
            background-color: #034b94;
            text-align: center;
        }
        .desc_store_footer p {
            color: #ccc;
            font-size: 14px;
            line-height: 1.5;
            background-color: #034b94;
        }
        @media (max-width: 768px) {
            .footer_container {
                flex-direction: column;
                align-items: center;
                gap: 20px;
            }
            .service_footer_1 {
                text-align: center;
            }
            .service_footer_1 ul li a {
                padding: 5px 0;
            }
        }

    </style>
</head>
<body class="bg-gray-100 font-sans min-h-screen flex flex-col">
    <!-- Custom Alert/Modal UI -->
    <div id="custom-alert" class="fixed inset-0 bg-gray-600 bg-opacity-75 flex items-center justify-center z-50 hidden transition-opacity duration-300">
        <div id="alert-content" class="bg-white rounded-lg border-l-4 p-4 shadow-xl max-w-sm w-full mx-4" role="alert">
            <div class="flex items-center">
                <div id="alert-icon"></div>
                <p id="alert-message" class="text-sm font-medium text-gray-800"></p>
                <button onclick="document.getElementById('custom-alert').classList.add('hidden')" class="ml-auto focus:outline-none p-1 rounded-full hover:bg-gray-200">
                    <svg class="w-5 h-5 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                </button>
            </div>
        </div>
    </div>

    <header class="header-bg text-white py-8 shadow-lg">
        <div class="container mx-auto flex flex-col md:flex-row items-center justify-between px-4 header-content">
            <div class="flex items-center space-x-4 mb-4 md:mb-0">
                <div>
                    <h1 class="text-3xl font-bold tracking-tight">D_Computer - Đặt Lịch Hẹn</h1>
                    <p class="text-base opacity-90">Hỗ trợ công nghệ chuyên nghiệp từ Mạnh Dũng</p>
                </div>
            </div>
            <div class="text-center md:text-right">
                <p class="text-sm font-medium">Hotline: <a href="tel:0328775956" class="underline hover:text-yellow-300">0328775956</a></p>
                <p class="text-sm">Email: <a href="mailto:nguyendung28022005@gmail.com" class="underline hover:text-yellow-300">nguyendung28022005@gmail.com</a></p>
            </div>
        </div>
    </header>

    <main class="flex-grow">
        <section id="appointment-form" class="container mx-auto py-12 px-4">
            <div class="bg-white rounded-xl shadow-2xl p-6 md:p-10 max-w-3xl mx-auto border border-gray-200">
                <h2 class="text-3xl font-extrabold text-gray-800 text-center mb-2">Form Đặt Lịch Hẹn</h2>
                <p class="text-gray-600 mb-8 text-center">Vui lòng điền thông tin để chúng tôi có thể hỗ trợ bạn tốt nhất.</p>
                <form id="appointmentForm" onsubmit="event.preventDefault(); submitAppointment();">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="mb-4">
                            <label for="name" class="block text-gray-700 font-semibold mb-1">Họ và Tên <span class="text-red-500">*</span></label>
                            <input type="text" id="name" name="name" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-4 focus:ring-blue-200 transition duration-150" placeholder="Nhập họ và tên" required>
                        </div>
                        <div class="mb-4">
                            <label for="email" class="block text-gray-700 font-semibold mb-1">Email <span class="text-red-500">*</span></label>
                            <input type="email" id="email" name="email" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-4 focus:ring-blue-200 transition duration-150" placeholder="Nhập email" required>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="mb-4">
                            <label for="phone" class="block text-gray-700 font-semibold mb-1">Số Điện Thoại <span class="text-red-500">*</span></label>
                            <input type="tel" id="phone" name="phone" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-4 focus:ring-blue-200 transition duration-150" placeholder="032xxxx956" required>
                        </div>
                        <div class="mb-4">
                            <label for="date" class="block text-gray-700 font-semibold mb-1">Ngày Hẹn <span class="text-red-500">*</span></label>
                            <input type="date" id="date" name="date" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-4 focus:ring-blue-200 transition duration-150" required>
                        </div>
                        <div class="mb-4">
                            <label for="time" class="block text-gray-700 font-semibold mb-1">Giờ Hẹn <span class="text-red-500">*</span></label>
                            <input type="time" id="time" name="time" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-4 focus:ring-blue-200 transition duration-150" required>
                        </div>
                    </div>

                    <div class="mb-6">
                        <label for="reason" class="block text-gray-700 font-semibold mb-1">Lý Do Hẹn</label>
                        <textarea id="reason" name="reason" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-4 focus:ring-blue-200 transition duration-150" rows="4" placeholder="Mô tả chi tiết vấn đề bạn đang gặp phải hoặc dịch vụ cần hỗ trợ (ví dụ: sửa lỗi màn hình laptop, tư vấn lắp đặt PC gaming, cài đặt hệ điều hành,...)"></textarea>
                    </div>

                    <button type="submit" class="w-full bg-blue-600 text-white px-5 py-3 rounded-xl font-bold text-lg hover:bg-blue-700 transition-all transform hover:scale-[1.01] shadow-lg shadow-blue-300/50">
                        Xác Nhận Đặt Lịch
                    </button>
                </form>
            </div>
        </section>
    </main>

    <footer class="mt-auto">
        <div class="footer_container">
            <div class="logo_footer">
                <p class="font-bold text-white mb-3 text-lg">Theo Dõi Chúng Tôi</p>
                <img src="https://placehold.co/120x60/ffffff/034b94?text=FOLLOW+US" onerror="this.onerror=null; this.src='https://placehold.co/120x60/ffffff/034b94?text=D_Computer';" alt="Logo" class="rounded">
            </div>
            
            <div class="service_footer_1">
                <ul>
                    <li><a class="font-bold cursor-default">HỖ TRỢ KHÁCH HÀNG &#9776;</a></li>
                    <li><a>Hỏi đáp</a></li>
                    <li><a>Thông tin thanh toán</a></li>
                    <li><a>Góp ý khiếu nại</a></li>
                    <li><a>Tuyển dụng</a></li>
                    <li><a>Vận chuyển</a></li>
                </ul>
            </div>
            
            <div class="service_footer_1">
                <ul>
                    <li><a class="font-bold cursor-default">CHÍNH SÁCH &#9776;</a></li>
                    <li><a>Chính sách bảo mật thông tin</a></li>
                    <li><a>Chính sách bảo trì, bảo hành</a></li>
                    <li><a>Chính sách thanh toán</a></li>
                    <li><a>Chính sách vận chuyển và giao nhận</a></li>
                    <li><a>Chính sách đổi trả và hoàn tiền</a></li>
                    <li><a>Chính sách kiểm hàng</a></li>
                    <li><a>Chính sách xử lý khiếu nại</a></li>
                </ul>
            </div>
            
            <div class="service_footer_1">
                <ul>
                    <li><a class="font-bold cursor-default">DANH MỤC SẢN PHẨM &#9776;</a></li>
                    <li><a>Laptop MSI</a></li>
                    <li><a>Microsoft</a></li>
                    <li><a>Razer</a></li>
                    <li><a>Laptop Asus</a></li>
                    <li><a>Macbook</a></li>
                    <li><a>Laptop Acer</a></li>
                    <li><a>Laptop Lenovo</a></li>
                    <li><a>Laptop Thinkpad</a></li>
                    <li><a>Laptop HP</a></li>
                    <li><a>Laptop Dell</a></li>
                </ul>
            </div>
        </div>
        
        <div class="desc_store_footer">
            <hr class="border-t border-blue-400 opacity-30 mb-4 mx-auto max-w-lg">
            <p>Công ty TNHH Công Nghệ Số D_Computer</p>
            <p>Địa chỉ đăng ký giấy phép: 2C Bạch Đằng, P. Chương Dương, Q. Hoàn Kiếm, TP. Hà Nội</p>
            <p>MST 0109900432 do Sở KH và ĐT TP Hà Nội cấp ngày 28/01/2022</p>
            <p>Địa chỉ Showroom Kinh Doanh: Số 3 Ngõ 117 Thái Hà, P. Trung Liệt, Q. Đống Đa, TP. Hà Nội</p>
            <p>Hotline: 0328775956</p>
            <p>Email: nguyendung28022005@gmail.com</p>
        </div>
    </footer>

    <script>
        function showAlert(message, isError = false) {
            const alertBox = document.getElementById('custom-alert');
            const alertMessage = document.getElementById('alert-message');
            const alertContent = document.getElementById('alert-content');
            const alertIcon = document.getElementById('alert-icon');
            alertMessage.innerText = message;
            if (isError) {
                alertContent.classList.remove('bg-green-100', 'border-green-400');
                alertContent.classList.add('bg-red-100', 'border-red-400', 'border-red-600');
                alertIcon.innerHTML = `
                    <svg class="w-6 h-6 mr-3 text-red-700" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z"></path>
                    </svg>
                `;
            } else {
                alertContent.classList.remove('bg-red-100', 'border-red-400');
                alertContent.classList.add('bg-green-100', 'border-green-400', 'border-green-600');
                alertIcon.innerHTML = `
                    <svg class="w-6 h-6 mr-3 text-green-700" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"></path>
                    </svg>
                `;
            }
            
            alertBox.classList.remove('hidden');
            setTimeout(() => alertBox.classList.add('hidden'), 3000);
        }

        function submitAppointment() {
            const name = document.getElementById('name').value;
            const email = document.getElementById('email').value;
            const phone = document.getElementById('phone').value;
            const date = document.getElementById('date').value;
            const time = document.getElementById('time').value;
            const reason = document.getElementById('reason').value;
            if (name && email && phone && date && time) {
                document.getElementById('appointmentForm').reset();
                showAlert('Đặt lịch thành công! Chúng tôi sẽ liên hệ bạn sớm.', false);
            } else {
                showAlert('Vui lòng điền đầy đủ thông tin bắt buộc!', true);
            }
        }
    </script>
</body>
</html>
