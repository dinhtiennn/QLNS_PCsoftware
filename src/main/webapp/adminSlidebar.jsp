<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


.slideFull {
	position: relative;
    width: 20%; /* Chiều rộng ban đầu của thẻ div */
    background-color: #f0f0f0;
    overflow: hidden;
    transition: width 0.5s; /* Animation chuyển động */
}

.slideFull.active {
    width: 100%; /* Khi kích hoạt, thẻ div sẽ mở rộng */
  }
  
.nav {
    list-style: none;
    padding: 0;
    margin: 0;
}

.nav li {
    display: none;
}

.icons {
    display: flex;
    flex-direction: column; /* Hiển thị các icon trên cùng một hàng dọc */
    align-items: flex-start; /* Căn các icon sang trái */
    padding: 0 10px;
}

.icons i {
    font-size: 24px;
    margin-bottom: 8px;
}

.slideFull.active .icons {
    display: none; /* Ẩn các icon khi ở full size */
}

.slideFull.active .nav li {
    display: block; /* Hiển thị danh sách li khi ở full size */
}
</style>
</head>
<body>
	<div class="d-flex">
        <div class="justify-content-start slideFull" id="menuContent">
        	<a href="index">
				<img style="width: 100px" alt="" src="assets/imgs/Logomenu.png">
			</a>
            <div class="icons">
                <a href="ThongSoController"><i class="fas fa-cogs"></i></a>
                <a href="adminNhanVienController"><i class="fas fa-user"></i></a>
                <a href="adminDangKyNghiController"><i class="fas fa-calendar-alt"></i></a>
                <a href="adminLoaiCaController"><i class="fas fa-clock"></i></a>
                <a href="adminThongKeLuongController"><i class="fas fa-chart-bar"></i></a>
                <a href="adminDangKyLamController"><i class="fas fa-calendar-check"></i></a>
                <a href="#"><i class="fas fa-plus"></i></a>
                <a href="#"><i class="fas fa-plus"></i></a>
                <a href="#"><i class="fas fa-plus"></i></a>
            </div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="ThongSoController">Thông số kĩ thuật</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminNhanVienController">Thông tin nhân viên</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminDangKyNghiController">Bảng Đăng Ký Nghỉ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminLoaiCaController">Phân Loại Ca Làm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminThongKeLuongController">Bảng Thống Kê Lương</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminDangKyLamController">Bảng Đăng Ký Lịch Làm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Thêm Chức Năng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Thêm Chức Năng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Thêm Chức Năng</a>
                </li>
            </ul>
        </div>
        <div class="menu-icon" onclick="toggleSize()">
            <i class="fas fa-bars"></i>
        </div>
    </div>
</body>

<script type="text/javascript">
function toggleSize() {
    const container = document.querySelector('.slideFull');
    container.classList.toggle('active');
}

</script>
</html>