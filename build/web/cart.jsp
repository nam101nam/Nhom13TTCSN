<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Cart" %>
<%@ page import="model.CartItem" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng của bạn</title>
    <style>
        /* Reset & cơ bản */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
            padding: 40px 20px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }
        .header {
            background: linear-gradient(135deg, #2c73e6, #1a5bb8);
            color: white;
            padding: 25px 30px;
            text-align: center;
        }
        .header h2 {
            font-size: 28px;
            font-weight: 600;
        }
        .content {
            padding: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            background-color: #fff;
        }
        th {
            background-color: #2c73e6;
            color: white;
            padding: 15px;
            text-align: center;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 0.5px;
        }
        td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }
        tr:nth-child(even) {
            background-color: #f9fbff;
        }
        tr:hover {
            background-color: #eef4ff;
            transition: background-color 0.3s;
        }
        .price {
            font-weight: 600;
            color: #2c73e6;
        }
        tfoot td {
            font-size: 18px;
            font-weight: 700;
            color: #2c73e6;
        }
        .btn-delete {
            background-color: #ff4444;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        .btn-delete:hover {
            background-color: #cc0000;
        }
        .actions {
            margin-top: 30px;
            text-align: center;
        }
        .actions a {
            display: inline-block;
            padding: 12px 25px;
            margin: 0 10px;
            background-color: #2c73e6;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s;
        }
        .actions a:hover {
            background-color: #1a5bb8;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(44, 115, 230, 0.3);
        }
        .empty-cart {
            text-align: center;
            padding: 60px 20px;
            color: #666;
            font-size: 18px;
        }
        .empty-cart a {
            color: #2c73e6;
            text-decoration: none;
            font-weight: 600;
        }
        .empty-cart a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>🛒 Giỏ hàng của bạn</h2>
        </div>
        
        <div class="content">
            <%
                NumberFormat formatter = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
                Cart cart = (Cart) session.getAttribute("cart");
               
                if (cart == null || cart.getItems().isEmpty()) {
            %>
                <div class="empty-cart">
                    <p>Giỏ hàng của bạn đang trống.</p>
                    <p><a href="index.jsp">← Tiếp tục mua sắm</a></p>
                </div>
            <%
                } else {
                    Map<Integer, CartItem> items = cart.getItems();
            %>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (CartItem item : items.values()) {
                                double subtotal = item.getPrice() * item.getQuantity();
                                String formattedPrice = formatter.format(item.getPrice());
                                String formattedSubtotal = formatter.format(subtotal);
                        %>
                            <tr>
                                <td><%= item.getProductId() %></td>
                                <td><%= item.getProductName() %></td>
                                <td class="price"><%= formattedPrice %> VND</td>
                                <td><%= item.getQuantity() %></td>
                                <td class="price"><%= formattedSubtotal %> VND</td>
                                <td>
                                    <form action="RemoveFromCartServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="productIdToRemove" value="<%= item.getProductId() %>">
                                        <button type="submit" class="btn-delete">Xóa</button>
                                    </form>
                                </td>
                            </tr>
                        <%
                            }
                        %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4" style="text-align: right;"><strong>Tổng cộng:</strong></td>
                            <td colspan="2"><strong><%= formatter.format(cart.getTotalPrice()) %> VND</strong></td>
                        </tr>
                    </tfoot>
                </table>

                <div class="actions">
                    <a href="index.jsp">← Tiếp tục mua sắm</a>
                    <a href="payment_product.jsp">Tiến hành thanh toán ➔</a>
                </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>