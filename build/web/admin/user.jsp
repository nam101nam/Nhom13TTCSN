<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>

    <body class="sb-nav-fixed">

        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.jsp">Laptop Shop</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                    class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">

                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">

            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">FEATURES</div>
                            <a class="nav-link" href="../admin/index.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <a class="nav-link" href="../admin/user.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                User
                            </a>
                            <a class="nav-link" href="../admin/order.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>
                                Order
                            </a>
                            <a class="nav-link" href="../admin/product.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-box"></i></div>
                                Product
                            </a>



                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Manage user</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="../admin/index.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item active">User</li>
                        </ol>
                        <div>
                            <div class="d-flex justify-content-between">
                                <h2>User table</h2>
                                <button class="btn btn-success">Tạo mới</button>
                            </div>

                            <div class="table-responsive small">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">User id</th>
                                            <th scope="col">Tên đăng nhập</th>
                                            <th scope="col">Mật khẩu</th>
                                            <th scope="col">Họ và tên</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Số điện thoại</th>
                                            <th scope="col">Chức vụ</th>
                                            <th scope="col">Hành động</th>
                                            <!-- <th>
                                            <button class="btn btn-primary">Xem chi tiet</button>
                                        </th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>U001</td>
                                            <td>admin01</td>
                                            <td>admin123</td>
                                            <td>Nguyễn Văn Admin</td>
                                            <td>admin01@example.com</td>
                                            <td>0935123456</td>
                                            <td>Admin</td>
                                            <td>
                                                <button class="btn btn-warning btn-sm">Chỉnh sửa</button>
                                                <button class="btn btn-danger btn-sm">Xóa</button>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>U002</td>
                                            <td>user_anh</td>
                                            <td>user2025</td>
                                            <td>Trần Minh Anh</td>
                                            <td>minhanh@example.com</td>
                                            <td>0907234567</td>
                                            <td>User</td>
                                            <td>
                                                <button class="btn btn-warning btn-sm">Chỉnh sửa</button>
                                                <button class="btn btn-danger btn-sm">Xóa</button>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>U003</td>
                                            <td>phamquang</td>
                                            <td>quangpass</td>
                                            <td>Phạm Quốc Quang</td>
                                            <td>quangpq@example.com</td>
                                            <td>0978654321</td>
                                            <td>User</td>
                                            <td>
                                                <button class="btn btn-warning btn-sm">Chỉnh sửa</button>
                                                <button class="btn btn-danger btn-sm">Xóa</button>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>U004</td>
                                            <td>admin02</td>
                                            <td>root2025</td>
                                            <td>Lê Thị Quản Trị</td>
                                            <td>admin02@example.com</td>
                                            <td>0982345567</td>
                                            <td>Admin</td>
                                            <td>
                                                <button class="btn btn-warning btn-sm">Chỉnh sửa</button>
                                                <button class="btn btn-danger btn-sm">Xóa</button>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>U005</td>
                                            <td>ngoc_user</td>
                                            <td>ngoc1234</td>
                                            <td>Đỗ Ngọc Lan</td>
                                            <td>ngoclan@example.com</td>
                                            <td>0912346789</td>
                                            <td>User</td>
                                            <td>
                                                <button class="btn btn-warning btn-sm">Chỉnh sửa</button>
                                                <button class="btn btn-danger btn-sm">Xóa</button>
                                            </td>
                                        </tr>
                                    </tbody>


                                </table>
                            </div>
                        </div>
                    </div>
                    </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
            crossorigin="anonymous"></script>
        <script src="../js/chart-area-demo.js"></script>
        <script src="../js/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
            crossorigin="anonymous"></script>
        <script src="../js/datatables-simple-demo.js"></script>
    </body>

    </html>