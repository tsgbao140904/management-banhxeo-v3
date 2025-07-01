<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Người Dùng - Bánh Xèo Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            color: #343a40;
        }

        .sidebar {
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            background: #4682b4;
            padding-top: 20px;
            box-shadow: 2px 0 10px rgba(70, 130, 180, 0.2);
        }

        .sidebar a {
            color: #ecf0f1;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .sidebar a:hover, .sidebar a.active {
            background-color: #34495e;
            color: #ffffff;
        }

        .sidebar .text-center h4 {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
            flex: 1;
        }

        .form-control, .form-select {
            border: 2px solid #ced4da;
            border-radius: 8px;
        }

        .form-control:focus, .form-select:focus {
            border-color: #007bff;
            outline: none;
        }

        .table {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.1);
        }

        .table th {
            background: #4682b4;
            color: #fff;
            text-align: center;
            padding: 10px;
            font-weight: 600;
        }

        .table td {
            vertical-align: middle;
            text-align: center;
            padding: 10px;
            border-top: 1px solid #dee2e6;
        }

        .alert {
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 1px solid #dee2e6;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.1);
        }

        .alert-success {
            background: #28a745;
            color: #fff;
        }

        .alert-danger {
            background: #dc3545;
            color: #fff;
        }

        .close-btn {
            font-size: 1.3rem;
            color: #fff;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .close-btn:hover {
            color: #007bff;
        }

        .btn {
            padding: 8px 15px;
            font-weight: 600;
            border-radius: 8px;
        }

        .btn-primary {
            background: #007bff;
            color: #fff;
        }

        .btn-primary:hover {
            background: #0056b3;
        }

        .btn-warning {
            background: #ffc107;
            color: #fff;
        }

        .btn-warning:hover {
            background: #e0a800;
        }

        .btn-danger {
            background: #dc3545;
            color: #fff;
        }

        .btn-danger:hover {
            background: #c82333;
        }

        .pagination {
            justify-content: center;
        }

        .page-item .page-link {
            color: #007bff;
            background: #fff;
            border: 1px solid #dee2e6;
        }

        .page-item.active .page-link {
            background: #007bff;
            color: #fff;
            border-color: #007bff;
        }

        .page-item .page-link:hover {
            background: #e9ecef;
            color: #0056b3;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }
            .content {
                margin-left: 200px;
                padding: 15px;
            }
            .table th, .table td {
                font-size: 0.9rem;
                padding: 8px;
            }
            .btn {
                padding: 6px 12px;
                font-size: 0.9rem;
            }
        }

        .dropdown button {
            background: #4682b4;
            border: none;
            color: #ffffff;
            padding: 8px 15px;
            transition: background-color 0.3s ease;
        }

        .dropdown button:hover {
            background: #5a9bd4;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <div class="text-center mb-4"><h4 class="text-white">Bánh Xèo Admin</h4></div>
    <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-tachometer-alt me-2"></i> Dashboard</a>
    <a class="nav-link" href="${pageContext.request.contextPath}/admin/order-management"><i class="fas fa-shopping-cart me-2"></i> Quản Lý Đơn Hàng</a>
    <a class="nav-link" href="${pageContext.request.contextPath}/admin/menu-management"><i class="fas fa-utensils me-2"></i> Quản Lý Menu</a>
    <a class="nav-link" href="${pageContext.request.contextPath}/admin/report"><i class="fas fa-chart-line me-2"></i> Báo Cáo</a>
    <a class="nav-link active" href="${pageContext.request.contextPath}/admin/user-management"><i class="fas fa-users me-2"></i> Quản Lý Người Dùng</a>
    <a class="nav-link" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt me-2"></i> Đăng Xuất</a>
</div>

<div class="content">
    <div class="mb-4 d-flex justify-content-between align-items-center">
        <h3 class="text-primary">Quản Lý Người Dùng</h3>
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fas fa-user me-2"></i> Admin
            </button>
            <ul class="dropdown-menu" aria-labelledby="userDropdown">
                <li><a class="dropdown-item" href="#">Hồ sơ</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
            </ul>
        </div>
    </div>

    <c:if test="${not empty sessionScope.message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${sessionScope.message}
            <span class="close-btn" onclick="this.parentElement.style.display='none';">×</span>
        </div>
        <c:remove var="message" scope="session"/>
    </c:if>
    <c:if test="${not empty sessionScope.error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${sessionScope.error}
            <span class="close-btn" onclick="this.parentElement.style.display='none';">×</span>
        </div>
        <c:remove var="error" scope="session"/>
    </c:if>

    <form action="${pageContext.request.contextPath}/admin/user-management" method="post" class="mb-4">
        <input type="hidden" name="action" value="add">
        <div class="row g-3">
            <div class="col-md-3"><input type="text" class="form-control" name="username" placeholder="Tên đăng nhập" required></div>
            <div class="col-md-2"><input type="password" class="form-control" name="password" placeholder="Mật khẩu" required></div>
            <div class="col-md-3"><input type="email" class="form-control" name="email" placeholder="Email" required></div>
            <div class="col-md-2">
                <select name="role" class="form-select" required>
                    <option value="USER">User</option>
                    <option value="ADMIN">Admin</option>
                </select>
            </div>
            <div class="col-md-2"><button type="submit" class="btn btn-primary w-100">Thêm người dùng</button></div>
        </div>
    </form>

    <table class="table table-striped table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Tên Đăng Nhập</th>
            <th>Email</th>
            <th>Vai Trò</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.userId}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>${user.role}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/user-management?action=edit&userId=${user.userId}" class="btn btn-warning btn-sm">Sửa</a>
                    <a href="${pageContext.request.contextPath}/admin/user-management?action=delete&userId=${user.userId}" class="btn btn-danger btn-sm delete-user" data-user-id="${user.userId}" data-username="${user.username}">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <c:if test="${currentPage > 1}">
                <li class="page-item"><a class="page-link" href="?page=${currentPage - 1}">Trước</a></li>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" var="i">
                <li class="page-item ${currentPage == i ? 'active' : ''}"><a class="page-link" href="?page=${i}">${i}</a></li>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <li class="page-item"><a class="page-link" href="?page=${currentPage + 1}">Sau</a></li>
            </c:if>
        </ul>
    </nav>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.querySelectorAll('.delete-user').forEach(button => {
        button.addEventListener('click', (e) => {
            e.preventDefault();
            const userId = button.getAttribute('data-user-id');
            const username = button.getAttribute('data-username');
            if (confirm(`Bạn có chắc muốn xóa người dùng "${username}"?`)) {
                window.location.href = button.getAttribute('href');
            }
        });
    });

    setTimeout(() => {
        const alerts = document.querySelectorAll('.alert');
        alerts.forEach(alert => {
            alert.style.transition = 'opacity 0.5s';
            alert.style.opacity = '0';
            setTimeout(() => alert.style.display = 'none', 500);
        });
    }, 3000);
</script>
</body>
</html>