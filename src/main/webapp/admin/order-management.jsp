<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Đơn Hàng - Bánh Xèo Management</title>
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

        .details-table {
            margin-top: 10px;
            font-size: 0.9em;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 6px rgba(0, 123, 255, 0.1);
        }

        .details-table td {
            padding: 5px;
            border: none;
        }

        .form-select {
            border: 2px solid #ced4da;
            border-radius: 8px;
        }

        .form-select:focus {
            border-color: #007bff;
            outline: none;
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

        .btn-danger {
            background: #dc3545;
            color: #fff;
        }

        .btn-danger:hover {
            background: #c82333;
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
        }
    </style>
</head>
<body>
<div class="sidebar">
    <div class="text-center mb-4"><h4 class="text-white">Bánh Xèo Admin</h4></div>
    <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-tachometer-alt me-2"></i> Dashboard</a>
    <a class="nav-link active" href="${pageContext.request.contextPath}/admin/order-management"><i class="fas fa-shopping-cart me-2"></i> Quản Lý Đơn Hàng</a>
    <a class="nav-link" href="${pageContext.request.contextPath}/admin/menu-management"><i class="fas fa-utensils me-2"></i> Quản Lý Menu</a>
    <a class="nav-link" href="${pageContext.request.contextPath}/admin/report"><i class="fas fa-chart-line me-2"></i> Báo Cáo</a>
    <a class="nav-link" href="${pageContext.request.contextPath}/admin/user-management"><i class="fas fa-users me-2"></i> Quản Lý Người Dùng</a>
    <a class="nav-link" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt me-2"></i> Đăng Xuất</a>
</div>

<div class="content">
    <div class="mb-4 d-flex justify-content-between align-items-center">
        <h3 class="text-primary">Quản Lý Đơn Hàng</h3>
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

    <table class="table table-striped table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID Đơn Hàng</th>
            <th>Chi Tiết Món</th>
            <th>Tổng Đơn</th>
            <th>Trạng Thái</th>
            <th>Ghi Chú</th>
            <th>Ngày Đặt</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.orderId}</td>
                <td>
                    <table class="table details-table">
                        <c:forEach var="detail" items="${order.orderDetails}">
                            <tr>
                                <td>${detail.menu.name}</td>
                                <td>${detail.quantity} x ${detail.price} VNĐ = ${detail.quantity * detail.price} VNĐ</td>
                            </tr>
                        </c:forEach>
                    </table>
                </td>
                <td>${order.totalAmount} VNĐ</td>
                <td>
                    <form action="${pageContext.request.contextPath}/admin/order-management" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="updateStatus">
                        <input type="hidden" name="orderId" value="${order.orderId}">
                        <select name="status" class="form-select form-select-sm" onchange="this.form.submit()">
                            <option value="CHOXACNHAN" ${order.status == 'CHOXACNHAN' ? 'selected' : ''}>Chờ xác nhận</option>
                            <option value="XACNHAN" ${order.status == 'XACNHAN' ? 'selected' : ''}>Xác nhận</option>
                            <option value="TUCHOI" ${order.status == 'TUCHOI' ? 'selected' : ''}>Từ chối</option>
                        </select>
                    </form>
                </td>
                <td>${order.note}</td>
                <td>${order.orderDate}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/order-management?action=delete&orderId=${order.orderId}" class="btn btn-danger btn-sm delete-order" data-order-id="${order.orderId}">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.querySelectorAll('.delete-order').forEach(button => {
        button.addEventListener('click', (e) => {
            e.preventDefault();
            const orderId = button.getAttribute('data-order-id');
            if (confirm(`Bạn có chắc muốn xóa đơn hàng ID ${orderId}?`)) {
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