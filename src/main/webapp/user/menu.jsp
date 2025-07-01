<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Menu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- Thêm Font Awesome cho các icon -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            color: #343a40;
        }

        .navbar {
            background: #4682b4;
            padding: 10px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand, .navbar-nav .nav-link {
            color: #ecf0f1;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .navbar-brand:hover, .navbar-nav .nav-link:hover {
            color: #00b4d8;
        }

        .container {
            max-width: 1200px;
            margin-top: 30px;
            flex: 1;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            background: #fff;
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .card-body {
            padding: 15px;
        }

        .card-title {
            font-size: 1.25rem;
            margin-bottom: 10px;
        }

        .card-text {
            font-size: 1rem;
            color: #495057;
        }

        .form-control {
            border: 2px solid #ced4da;
            border-radius: 8px;
        }

        .form-control:focus {
            border-color: #007bff;
            outline: none;
        }

        .btn {
            background: #007bff;
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 8px 15px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-primary:hover {
            background: #0056b3;
        }

        .btn-primary:active {
            background: #004085;
        }

        .btn-outline-danger {
            color: #dc3545;
            border-color: #dc3545;
            background: rgba(220, 53, 69, 0.1);
        }

        .btn-outline-danger:hover {
            color: #fff;
            background: #dc3545;
            border-color: #dc3545;
        }

        @media (max-width: 768px) {
            .container {
                max-width: 100%;
                margin-top: 20px;
                padding: 0 15px;
            }
            .card {
                margin-bottom: 15px;
            }
            .card-img-top {
                height: 150px;
            }
            .card-title {
                font-size: 1.1rem;
            }
            .btn {
                padding: 6px 12px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<br>
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/user/dashboard">Bánh Xèo</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/user/menu">Xem Menu</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/order-history">Lịch Sử Mua Hàng</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/cart">Giỏ Hàng</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">Đăng Xuất</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <h2 class="mb-4 text-primary">Menu</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="menu" items="${menus}">
            <div class="col">
                <div class="card h-100">
                    <c:choose>
                        <c:when test="${not empty menu.imageUrl}">
                            <img src="${pageContext.request.contextPath}/${menu.imageUrl}" class="card-img-top" alt="${menu.name}"
                                 onerror="this.src='${pageContext.request.contextPath}/images/default.jpg'; this.onerror=null;">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/images/default.jpg" class="card-img-top" alt="Hình ảnh mặc định">
                        </c:otherwise>
                    </c:choose>
                    <div class="card-body">
                        <h5 class="card-title">${menu.name}</h5>
                        <p class="card-text">${menu.price} VNĐ</p>
                        <input type="number" class="form-control mb-2" id="quantity_${menu.menuId}" min="1" value="1">
                        <button class="btn btn-primary add-to-cart" data-menu-id="${menu.menuId}">Thêm vào giỏ</button>
                        <button class="btn btn-outline-danger like-btn" data-menu-id="${menu.menuId}"><i class="bi bi-heart"></i> (${menu.likes})</button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <a href="${pageContext.request.contextPath}/user/cart" class="btn btn-success mt-3">Xem Giỏ Hàng</a>
</div>
</br>
<jsp:include page="/WEB-INF/jsp/footer.jsp" /> <!-- Import footer.jsp -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.querySelectorAll('.add-to-cart').forEach(button => {
        button.addEventListener('click', () => {
            const menuId = button.getAttribute('data-menu-id');
            const quantity = document.getElementById('quantity_' + menuId).value;
            fetch('${pageContext.request.contextPath}/user/cart', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'menuId=' + menuId + '&quantity=' + quantity
            }).then(response => response.text()).then(data => alert(data));
        });
    });

    document.querySelectorAll('.like-btn').forEach(button => {
        button.addEventListener('click', () => {
            const menuId = button.getAttribute('data-menu-id');
            fetch('${pageContext.request.contextPath}/user/like-menu?menuId=' + menuId)
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        button.textContent = `❤️ (${data.likes})`;
                    } else {
                        alert(data.message);
                    }
                });
        });
    });
</script>
</body>
</html>