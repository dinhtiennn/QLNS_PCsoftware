<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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
			String msgSuccess = (request.getAttribute("msgSuccess")!=null)?request.getAttribute("msgSuccess").toString():"";
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
			 // Định dạng ngày
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	        // Chuyển đổi thành đối tượng LocalDate
	        LocalDate date = LocalDate.parse(ngayVaolam.toString(), formatter);

	        // Định dạng lại thành "dd/MM/yyyy"
	        String formattedDate = date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
	%>
	<div class="row">
		<div class="col-2  mt-5">
			<%
			if(nhanvien.getMaCV().equals("CV001")){
				%><jsp:include page="adminSlidebar.jsp"></jsp:include><%
			}else if(nhanvien.getMaCV().equals("CV002")){
				%><jsp:include page="QUANLYslidebar.jsp"></jsp:include><%
			}else if(nhanvien.getMaCV().equals("CV003")){
				%><jsp:include page="Slidebar.jsp"></jsp:include><%
			}
			%>
		</div>
		<div class="col-8 mt-4">
				<div class="mb-3 row">
					    <div class="col-sm-10">
					      <img alt="" src="<%=anh%>">
					    </div>
			    </div>
			    <div class="mb-3 row">
					    <label for="hovaten" class="col-sm-2 col-form-label">Họ và tên:</label>
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
					      <input type="text" readonly class="form-control-plaintext" id="ngayvaolam" value="<%=formattedDate%>" readonly>
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
			    <div class="mb-3 row">
					    <label for="trangthaicongviec" class="col-sm-2 col-form-label">Mật khẩu:</label>
					    <div class="col-sm-10">
					      	<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalDoiMk">
							  Đổi mật khẩu
							</button>
							<!-- Modal -->
							<div class="modal fade" id="exampleModalDoiMk" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							    	<form action="nhanvien?action=changerpass" method="post">
							      <div class="modal-header">
							        <h1 class="modal-title fs-5" id="exampleModalLabel">Đổi mật khẩu</h1>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        <div class="mb-3 row">
										    <label for="password" class="col-sm-4 col-form-label">Mật khẩu cũ:</label>
										    <div class="col-sm-8 ">
										      <input type="password" class="form-control" id="password" name="matkhaucu" required="required">
										    </div>
								    </div>   
								    <div class="mb-3 row">
										    <label for="newpassword" class="col-sm-4 col-form-label">Mật khẩu mới:</label>
										    <div class="col-sm-8">
										      <input type="password" class="form-control" id="newpassword" name="matkhaumoi" required="required">
										    </div>
								    </div>   
								    <div class="mb-3 row">
										    <label for="renewpassword" class="col-sm-4 col-form-label">Nhập lại mật khẩu:</label>
										    <div class="col-sm-8">
										      <input type="password" class="form-control" id="renewpassword" name="matkhaumoi2" required="required">
										    </div>
								    </div>   
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
							        <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
							      </div>
							      </form>
							    </div>
							  </div>
							</div>					      	
					    </div>
			    </div>
				<div class=" mt-4">
				        <a href="index" class="btn btn-secondary">Trang chủ</a>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
						  Chỉnh sửa thông tin cá nhân
						</button>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			       <form action="nhanvien?action=changerinf" method="post">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">Chỉnh sửa thông tin cá nhân</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			      	<div class="mb-3 row">
					    <div class="col-sm-10">
					      <img alt="" src="<%=anh%>">
					    </div>
			    </div>
			    <div class="mb-3 row">
					    <label for="hovaten" class="col-sm-4 col-form-label">Họ và tên:</label>
					    <div class="col-sm-8">
					      <input type="text" class="form-control-plaintext" id="hovaten" value="<%=name%>" name="name" readonly>
					    </div>
			    </div>
			    <div class="mb-3 row">
					    <label for="email" class="col-sm-4 col-form-label">Email:</label>
					    <div class="col-sm-8">
					      <input type="email" class="form-control" id="email" value="<%=email%>" name="email">
					    </div>
			    </div>		    
			    <div class="mb-3 row">
					    <label for="sodienthoai" class="col-sm-4 col-form-label">Số điện thoại:</label>
					    <div class="col-sm-8">
					      <input type="tel" class="form-control" id="sodienthoai" value="<%=soDienThoai%>" name="sdt">
					    </div>
			    </div> 
			    <div class="mb-3 row">
					    <label for="sotaikhoan" class="col-sm-4 col-form-label">Số tài khoản:</label>
					    <div class="col-sm-8">
					      <input type="tel" class="form-control" id="sotaikhoan" value="<%=soTaiKhoan%>" name="stk">
					    </div>
			    </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
			        <button type="submit" class="btn btn-primary">lưu</button>
			      </div>
			       </form>
			    </div>
			  </div>
		</div>
		<!-- Modal Success-->
	<div class="modal fade" id="staticBackdropSuccess" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      	<div class="modal-body">
	        	<div class="alert alert-success" role="alert">
	        		<span id="msgsuccess"></span>
				</div>			
			</div>
	      	<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				<a href="index">		      		
	      			<button type="button" class="btn btn-success">Trang chủ</button>
		      	</a>
				
	      	</div>
	    </div>
	  </div>
	</div>
</body>
</html>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	  // Lấy giá trị của các thuộc tính từ request.getAttribute
	  var msgSuccess = "<%=msgSuccess%>";
	  // Kiểm tra nếu một trong hai giá trị 
	 if(msgSuccess.length > 0){
		// Lấy tham chiếu đến modal
		    var modalLogin = document.getElementById("staticBackdropSuccess");

		    // Khởi tạo modal bằng Bootstrap JavaScript
		    var myModal = new bootstrap.Modal(modalLogin, {
		      backdrop: 'static',
		      keyboard: false
		    });

		    // Hiển thị modal
		    myModal.show();
		    document.getElementById("msgsuccess").innerHTML = msgSuccess;
	  }
	});
</script>