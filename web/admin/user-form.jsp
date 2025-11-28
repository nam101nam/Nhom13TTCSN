<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>User Form - Admin</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/admin/index.jsp">Laptop Shop</a>
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
                    <h1 class="mt-4">
                        <c:if test="${user != null}">Edit User</c:if>
                        <c:if test="${user == null}">Add New User</c:if>
                    </h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index.jsp">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/users?action=list">User</a></li>
                        <li class="breadcrumb-item active">
                            <c:if test="${user != null}">Edit</c:if>
                            <c:if test="${user == null}">Add</c:if>
                        </li>
                    </ol>

                    <div class="card">
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/admin/users?action=<c:if test="${user != null}">update</c:if><c:if test="${user == null}">insert</c:if>" method="post">

                                <c:if test="${user != null}">
                                    <input type="hidden" name="id" value="<c:out value='${user.ID}' />" />
                                </c:if>

                                <div class="mb-3">
                                    <label for="fullName" class="form-label">Full Name</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName" value="<c:out value='${user.fullName}' />" required>
                                </div>

                                <div class="mb-3">
                                    <label for="userName" class="form-label">Username</label>
                                    <input type="text" class="form-control" id="userName" name="userName" value="<c:out value='${user.userName}' />" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" value="<c:out value='${user.email}' />" required>
                                </div>
                                
                                <c:if test="${user == null}">
                                    <div class="mb-3">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" required>
                                    </div>
                                </c:if>
                                
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input type="text" class="form-control" id="phone" name="phone" value="<c:out value='${user.phone}' />">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="roleId" class="form-label">Role</label>
                                    <select class="form-select" id="roleId" name="roleId">
                                        <option value="1" ${user.roleId == 1 ? 'selected' : ''}>Admin</option>
                                        <option value="2" ${user.roleId == 2 ? 'selected' : ''}>User</option>
                                    </select>
                                </div>

                                <button type="submit" class="btn btn-primary">
                                    <c:if test="${user != null}">Update User</c:if>
                                    <c:if test="${user == null}">Save User</c:if>
                                </button>
                                <a href="${pageContext.request.contextPath}/admin/users?action=list" class="btn btn-secondary">Cancel</a>
                            </form>
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
