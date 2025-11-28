<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.Productdao" %>
<%@ page import="model.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Thanh Toán</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #f4f4f4;
      animation: fadeInDown 0.5s ease-in-out;
    }
    @keyframes fadeInDown {
      from { opacity: 0; transform: translateY(-50px); }
      to { opacity: 1; transform: translateY(0px); }
    }
    .container {
      max-width: 800px;
      margin: 0 auto;
      background: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .product-info {
      text-align: center;
      border-bottom: 2px solid #ddd;
      padding-bottom: 20px;
    }
    .product-info h2 {
      color: #e63946;
      margin: 0;
    }
    .product-info p {
      margin: 5px 0;
    }
    .order-details, .customer-info, .payment-options {
      margin: 20px 0;
    }
    .order-details h3, .customer-info h3, .payment-options h3 {
      color: #2a9d8f;
      border-bottom: 1px solid #ddd;
      padding-bottom: 5px;
    }
    .order-details p {
      margin: 10px 0;
    }
    .customer-info input, .customer-info select {
      width: 100%;
      padding: 10px;
      margin: 5px 0;
      border: 1px solid #ddd;
      border-radius: 4px;
    }
    .payment-options label {
      display: block;
      margin: 10px 0;
    }
    .payment-options input[type="radio"] {
      margin-right: 10px;
    }
    .discount {
      color: #e76f51;
      font-weight: bold;
    }
    .terms {
      font-size: 0.9em;
      color: #666;
      margin: 10px 0;
    }
    button {
      background-color: #0077b6;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      width: 100%;
      font-size: 1em;
    }
    button:hover {
      background-color: #023e8a;
    }
  </style>
</head>
<body>
  <div class="container">
    <%
      int id = Integer.parseInt(request.getParameter("product_id"));
      Productdao dao = new Productdao();
      Product p = dao.getProductById(id);
      if (p != null) {
        NumberFormat formatter = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
        String formattedPrice = formatter.format(p.getProduct_price());
    %>
    <div class="product-info">
      <h2><%= formattedPrice %> VNĐ</h2>
      <p><%= p.getProduct_title() %></p>
      <p>Số lượng: <input type="number" id="quantity" min="1" value="1" style="width: 60px; text-align: center;"></p>
    </div>
    <div class="order-details">
      <h3>Chi Tiết Đơn Hàng</h3>
      <p>Tổng tiền: <span id="totalPrice"><%= formattedPrice %> VNĐ</span></p>
      <p>Phí giao hàng: Miễn phí</p>
      <p>Ưu đãi: <span class="discount">Giảm 5% khi thanh toán ngay</span></p>
    </div>
    <div class="customer-info">
      <h3>Thông Tin Khách Hàng</h3>
      <input type="text" placeholder="Họ và tên" id="fullName">
      <input type="text" placeholder="Số điện thoại" id="phone">
      <input type="text" placeholder="Địa chỉ giao hàng" id="address">
      <select id="province">
        <option value="">Chọn tỉnh/thành phố</option>
        <option value="hanoi">Hà Nội</option>
        <option value="hcm">TP. Hồ Chí Minh</option>
        <option value="danang">Đà Nẵng</option>
      </select>
    </div>
    <div class="payment-options">
      <h3>Phương Thức Thanh Toán</h3>
      <label><input type="radio" name="payment" value="now" checked> Thanh toán ngay (Ngân hàng, Ví điện tử)</label>
      <label><input type="radio" name="payment" value="installment"> Trả góp (Visa, MasterCard, JCB, Amex)</label>
      <p class="terms">* Đơn hàng sẽ được giao trong 2-5 ngày làm việc. Vui lòng kiểm tra thông tin trước khi thanh toán.</p>
    </div>
    <button onclick="submitOrder()">Xác Nhận và Gửi Đơn Hàng</button>
    <%
      } else {
        out.println("Sản phẩm không tồn tại!");
      }
    %>
  </div>
  
<script>
  // Lấy giá cơ bản từ JSP
  const basePrice = <%= p != null ? p.getProduct_price() : 0 %>;

  function totalPrice() {
    var quantity = parseInt(document.getElementById("quantity").value) || 1;  
    var tongtien = basePrice * quantity;

    console.log("Quantity:", quantity);
    console.log("LocalStorage earphone:", localStorage.getItem("earphone"));

    if (localStorage.getItem("earphone") === "true") tongtien += 499000 * quantity;
    if (localStorage.getItem("keyboard") === "true") tongtien += 899000 * quantity;
    if (localStorage.getItem("mouse") === "true") tongtien += 199000 * quantity;
    if (localStorage.getItem("ram") === "true") tongtien += 699000 * quantity;
    if (localStorage.getItem("monitor") === "true") tongtien += 1999000 * quantity;

    console.log("Tổng tiền cuối:", tongtien.toLocaleString() + " VNĐ");

    document.getElementById("totalPrice").innerHTML = tongtien.toLocaleString() + " VNĐ";
  }

  function submitOrder() {
    const fullName = document.getElementById('fullName').value;
    const phone = document.getElementById('phone').value;
    const address = document.getElementById('address').value;
    const province = document.getElementById('province').value;
    const paymentMethod = document.querySelector('input[name="payment"]:checked').value;
    const quantityInput = document.getElementById('quantity');  
    const quantity = parseInt(quantityInput.value) || 1;

    var total = basePrice * quantity;
    if (localStorage.getItem("earphone") === "true") total += 499000 * quantity;
    if (localStorage.getItem("keyboard") === "true") total += 899000 * quantity;
    if (localStorage.getItem("mouse") === "true") total += 199000 * quantity;
    if (localStorage.getItem("ram") === "true") total += 699000 * quantity;
    if (localStorage.getItem("monitor") === "true") total += 1999000 * quantity;

    if (!fullName || !phone || !address || !province) {
      alert('Vui lòng điền đầy đủ thông tin!');
    } else {
      const confirmation = confirm(`Xác nhận đơn hàng?\n- Họ tên: ${fullName}\n- SĐT: ${phone}\n- Địa chỉ: ${address}, ${province}\n- Phương thức: ${paymentMethod}\n- Số lượng: ${quantity}\n- Tổng tiền: ${total.toLocaleString()} VNĐ`);
      if (confirmation) {
        alert('Đơn hàng của bạn đã được gửi thành công! Chúng tôi sẽ liên hệ sớm nhất.');
      }
    }
  }

  window.addEventListener('load', function() {
    totalPrice();  
    document.getElementById("quantity").addEventListener("input", totalPrice);
  });
</script>
</body>
</html>