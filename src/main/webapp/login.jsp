<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Đăng nhập</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
	integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
	crossorigin="anonymous"></script>
<style>
.red {
	color: red;
}
</style>
<!-- Custom styles for this template -->
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
String username = (request.getAttribute("tendangnhap")!=null)?request.getAttribute("tendangnhap").toString():"";
String baoloilogin = (request.getAttribute("baoloilogin")!=null)?request.getAttribute("baoloilogin").toString():"";
%>
</head>
<body>
	<div class="container mt-5">
		<h1 class="d-flex justify-content-center">Cổng thông tin nhân sự</h1>
		<main class="form-signin w-100 m-auto">
			<form class="text-center" action="login" method="POST">
				<input type="hidden" name="hanhDong" value="dang-nhap"/>
			
				<img class="mb-4" src="<%=url %>/img/logo/logo.png"
					alt="" width="72">
				<h1 class="h3 mb-3 fw-normal">ĐĂNG NHẬP</h1>
				<span class="required" id="msg-err-login"><%=baoloilogin%></span>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="tenDangNhap" value="<%=username%>"
						placeholder="Tên đăng nhập" name="tendangnhap"> <label for="tenDangNhap">Tên đăng nhập</label>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="matKhau" 
            			placeholder="Mật khẩu" name="matkhau"> <label for="matKhau">Mật khẩu</label>
				</div>
				 <button class="w-100 btn btn-lg btn-primary" id="submit" disabled type="submit">Đăng nhập</button>
				<!-- <a href="dangky.jsp">Đăng ký tài khoản mới</a> -->
				<p class="mt-5 mb-3 text-muted">&copy; 2017–2025</p>
			</form>
		</main>
	</div>
</body>
</html>
 <script>
        function checkmatkhau() {
            var matkhau = document.getElementById("matKhau").value; // Lấy giá trị của trường mật khẩu
            if (matkhau.length > 0) {
                document.getElementById("submit").removeAttribute("disabled");
            } else {
                document.getElementById("submit").setAttribute("disabled", "disabled"); // Thêm thuộc tính disabled
            }
        }

        // Gắn sự kiện để gọi hàm checkmatkhau() mỗi khi có sự thay đổi trong trường mật khẩu
        document.getElementById("matKhau").addEventListener("input", checkmatkhau);
    </script>