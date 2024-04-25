<%@page import="java.sql.Date"%>
<%@page import="bean.NhanVienBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tài khoản của tôi </title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="aset/css/style.css">
	<!-- <link rel="stylesheet" href="aset/script/js.js"> -->
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	<%
			NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");	
			String anh = nhanvien.getAnh();
			String name = nhanvien.getTenNV();
			String maCV = nhanvien.getMaCV();
			String ngaySinh = nhanvien.getNgaySinh().toString();
			boolean gioiTinh = nhanvien.getGioiTinh();
			String email = nhanvien.getEmail();
			String soDienThoai = nhanvien.getsDT();
			String dVCT = nhanvien.getdVCT();
			String chucDanh = nhanvien.getChucDanh();
			boolean trangThaiCongViec = nhanvien.getTrangThaiCongViec();
			Date ngayVaolam = nhanvien.getNgayVaoLam();
			Date ngayKetThuc = nhanvien.getNgayKetThuc();
			String soTaiKhoan = nhanvien.getSoTaiKhoan();
			String username = nhanvien.getTenDangNhap();
			
			String chucVu = "";
			if(maCV.equals("CV001")){
				chucVu = "Admin";
			}else if(maCV.equals("CV002")){
				chucVu = "Quản lý";
			}else if(maCV.equals("CV003")){
				chucVu = "Nhân viên";
			}
	%>
	
	<div class="row">
		<div class="col-2  mt-5">
			<jsp:include page="Slidebar.jsp"></jsp:include>
		</div>
		<div class="col-8 mt-4">
				<div class="mb-3 row">
					    <div class="col-sm-10">
					      <img alt="" src="<%=anh%>">
					    </div>
			    </div>
			    <div class="mb-3 row">
					    <label for="hovaten" class="col-sm-2 col-form-label"><span class="required">*</span>Họ và tên:</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control-plaintext" id="hovaten" value="<%=name%>" name="name" readonly>
					    </div>
			    </div>
			    <div class="mb-3 row">
					    <label for="macv" class="col-sm-2 col-form-label">Chức vụ:</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control-plaintext" id="macv" value="<%=chucVu%>" name="macv" readonly>
					    </div>
			    </div>
			    <div class="mb-3 row">
					    <label for="gioitinh" class="col-sm-2 col-form-label">Giới tính:</label>
					    <div class="col-sm-10">
					        <input type="text" class="form-control-plaintext" id="gioitinh" value="<%=gioiTinh==true?"Nam":"Nữ"%>" readonly>
					    </div>
			    </div>
			    <div class="mb-3 row">
					    <label for="ngaysinh" class="col-sm-2 col-form-label">Ngày sinh:</label>
					    <div class="col-sm-10">
					      <input type="date" class="form-control-plaintext" id="ngaysinh" value="<%=ngaySinh%>" readonly>
					    </div>
			    </div>
			    <div class="mb-3 row">
					    <label for="email" class="col-sm-2 col-form-label"><span class="required">*</span>Email:</label>
					    <div class="col-sm-10">
					      <input type="email" class="form-control-plaintext" id="email" value="<%=email%>" name="email" readonly>
					    </div>
			    </div>		    
			    <div class="mb-3 row">
					    <label for="sodienthoai" class="col-sm-2 col-form-label"><span class="required">*</span>Số điện thoại:</label>
					    <div class="col-sm-10">
					      <input type="number" class="form-control-plaintext" id="sodienthoai" value="<%=soDienThoai%>" name="phonenumber" readonly>
					    </div>
			    </div> 
			    <div class="mb-3 row">
					    <label for="donvicongtac" class="col-sm-2 col-form-label"><span class="required">*</span>Đơn vị công tác:</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control-plaintext" id="donvicongtac" value="<%=dVCT%>" name="dvct" readonly>
					    </div>
			    </div>
			    <div class="mb-3 row">
					    <label for="chucdanh" class="col-sm-2 col-form-label"><span class="required">*</span>Chức danh:</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control-plaintext" id="chucdanh" value="<%=chucDanh%>" name="chucdanh" readonly>
					    </div>
			    </div>
			    <div class="mb-3 row">
					    <label for="usename" class="col-sm-2 col-form-label">Tên đăng nhập:</label>
					    <div class="col-sm-10">
					      <input type="text" readonly class="form-control-plaintext" id="usename-register" value="<%=username%>" readonly>
					    </div>
			    </div>   
			    <div class="mb-3 row">
					    <label for="ngayvaolam" class="col-sm-2 col-form-label"><span class="required">*</span>Ngày vào làm:</label>
					    <div class="col-sm-10">
					      <input type="text" readonly class="form-control-plaintext" id="ngayvaolam" value="<%=ngayVaolam%>" readonly>
					    </div>
			    </div>
			    <div class="mb-3 row">
					    <label for="sotaikhoan" class="col-sm-2 col-form-label">Số tài khoản:</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control-plaintext" id="sotaikhoan" value="<%=soTaiKhoan%>" readonly>
					    </div>
			    </div>
			    <div class="mb-3 row">
					    <label for="trangthaicongviec" class="col-sm-2 col-form-label">Trạng thái công việc:</label>
					    <div class="col-sm-10">
					      <input type="text" readonly class="form-control-plaintext" value="<%=trangThaiCongViec==true?"Đang hoạt động":"Ngưng hoạt động"%>" readonly>
					    </div>
			    </div>
				<div class=" mt-4">
				        <a href="index" class="btn btn-secondary">Trang chủ</a>
				        <button type="button" id="submit" class="btn btn-primary " name="action" value="changeinformationuser">Thay đổi</button>
				</div>
			</div>
		</div>
</body>
</html>