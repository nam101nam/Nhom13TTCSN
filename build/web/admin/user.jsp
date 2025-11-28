<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>User Management - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/admin/index.jsp">Laptop Shop</a>
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"></form>
        
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">FEATURES</div>
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/index.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Dashboard
                        </a>
                        <a class="nav-link active" href="${pageContext.request.contextPath}/admin/users?action=list">
                            <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                            User
                        </a>
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/order.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>
                            Order
                        </a>
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/product.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-box"></i></div>
                            Product
                        </a>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    Admin
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Manage Users</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index.jsp">Dashboard</a></li>
                        <li class="breadcrumb-item active">User</li>
                    </ol>
                    <div>
                        <div class="d-flex justify-content-between mb-3">
                            <h2>User List</h2>
                            <a href="${pageContext.request.contextPath}/admin/users?action=new" class="btn btn-success">Add New User</a>
                        </div>
                        <c:if test="${not empty sessionScope.errorMessage}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                ${sessionScope.errorMessage}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="errorMessage" scope="session" />
                        </c:if>
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Full Name</th>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Role</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" items="${listUser}">
                                        <tr>
                                            <td><c:out value="${user.ID}" /></td>
                                            <td><c:out value="${user.fullName}" /></td>
                                            <td><c:out value="${user.userName}" /></td>
                                            <td><c:out value="${user.email}" /></td>
                                            <td><c:out value="${user.phone}" /></td>
                                            <td>
                                                <c:if test="${user.roleId == 1}">Admin</c:if>
                                                <c:if test="${user.roleId != 1}">User</c:if>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/admin/users?action=edit&id=<c:out value='${user.ID}' />" class="btn btn-warning btn-sm">Edit</a>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <c:if test="${user.roleId != 1}">
                                                    <a href="${pageContext.request.contextPath}/admin/users?action=delete&id=<c:out value='${user.ID}' />" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                                                </c:if>
                                                <c:if test="${user.roleId == 1}">
                                                    <button class="btn btn-danger btn-sm" disabled>Delete</button>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2023</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>