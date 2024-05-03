<%@page import="bean.NhanVienBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<style>
	/* The Modal (background) */
	.modal {
	  display: none;
	  position: fixed;
	  z-index: 1;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  overflow: auto;
	  background-color: rgba(0,0,0,0.4);
	}
	
	/* Modal Content/Box */
	.modal-content {
	  background-color: #fefefe;
	  margin: 15% auto;
	  padding: 20px;
	  border: 1px solid #888;
	  width: 80%;
	}
	
	/* Close Button */
	.close {
	  color: #aaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: black;
	  text-decoration: none;
	  cursor: pointer;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="row">
		<div class="col-2 mt-5">
			<jsp:include page="QUANLYslidebar.jsp"></jsp:include>
		</div>
		<div class="col-10 mt-4">
			<h2>ALOOOOOOOOOOOOOOOOOOOOOO</h2>
				<button type="button" class="btn btn-warning" id="openModalBtn">Thêm mới nhân viên</button>
			<table  class="table" style="font-size: 11px;">
			<thead>
		        <tr>
		            <th>Mã Nhân Viên</th>
		            <th style="width: 180px;">Tên Nhân Viên</th>
		            <th>Mã Chức Vụ</th>
		            <th>Ngày Sinh</th>
		            <th>Giới Tính</th>
		            <th>Email</th>
		            <th>Số Điện Thoại</th>
		            <th>Đơn Vị Công Tác</th>
		            <th>Chức Danh</th>
		            <th>Tài Khoản</th>
		            <th>Mật Khẩu</th>
		            <th>Trạng Thái Công Việc</th> 
		        </tr>
		    </thead>
		    <tbody>
			<%
			ArrayList<NhanVienBean> ds = (ArrayList<NhanVienBean>)request.getAttribute("ds_nv"); 
			int n = ds.size();
			for(int i=0; i<n; i++) {
				NhanVienBean nvb = ds.get(i);%>
		        <tr>
		            <td><%=nvb.getMaNV()%></td>
		            <td><%=nvb.getTenNV() %></td>
		            <td><%=nvb.getMaCV() %></td>
		            <td><%=nvb.getNgaySinh() %></td>
		            <td><%=nvb.getGioiTinh() %></td>
		            <td><%=nvb.getEmail() %></td>
		            <td><%=nvb.getsDT() %></td>
		            <td><%=nvb.getdVCT() %></td>
		            <td><%=nvb.getChucDanh() %></td>
		            <td><%=nvb.getTenDangNhap() %></td>
		            <td><%=nvb.getMatKhau() %></td>
		            <%
		            String trangthaicongviec = "";
		            if(nvb.getTrangThaiCongViec()==true){
		            	trangthaicongviec = "Đang làm việc";
		            }
		            else
		            	trangthaicongviec = "Đang nghỉ việc";
		            %>
		        	<td><%=trangthaicongviec%>
		            <%if(nvb.getTrangThaiCongViec()==true){%>
		            	<a href="quanly?action=danhsachnhanvien&ttcv=0&manv=<%=nvb.getMaNV()%>">
							<button type="button" class="btn btn-warning">Dừng làm việc</button>
				  		</a>
		            <%}if(nvb.getTrangThaiCongViec()!= true){%>
		            	<a href="quanly?action=danhsachnhanvien&ttcv=1&manv=<%=nvb.getMaNV()%>">
							<button type="button" class="btn btn-warning">Tiếp tục làm</button>
				  		</a>
		            <%}%>
		            </td>
		        </tr>
			<%}%>
			</tbody>
		</table>
		</div>
	</div>
	<!-- The Modal -->
	<div id="myModal" class="modal">
	
		  <!-- Modal content -->
		  <form action="quanly?action=themnhanvien" method="post">
		  <div class="modal-content">
		    <span class="close">&times;</span>
		    <label for="tennv">Tên NV:</label>
		    <input type="text" id="tennv" name="tennv">
		    <label for="ngaysinh">Ngày Sinh:</label>
		    <input type="text" id="ngaysinh" name="ngaysinh">
		    <label for="manv">Giới tính:</label>
		    <input type="text" id="gioitinh" name="gioitinh">
		    <label for="tennv">Email:</label>
		    <input type="text" id="email" name="email">
		    <label for="manv">Số điện thoại:</label>
		    <input type="text" id="sdt" name="sdt">
		    <label for="tennv">Tên đăng nhập:</label>
		    <input type="text" id="tendn" name="tendn">
		    <label for="manv">Mật khẩu:</label>
		    <input type="text" id="mk" name="mk">
		    <label for="tennv">Ảnh:</label>
		    <input type="text" id="anh" name="anh">
		    <label for="manv">Số tài khoản:</label>
		    <input type="text" id="stk" name="stk">
		    <button id="submitBtn">Thêm nhân viên</button>
		  </div>
		  </form>
		<div id="successMessage" style="display: none;">Thêm nhân viên thành công!</div>
	</div>
</body>
<script type="text/javascript">
	//Get the modal
	var modal = document.getElementById("myModal");
	
	// Get the button that opens the modal
	var btn = document.getElementById("openModalBtn");
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	// When the user clicks the button, open the modal 
	btn.onclick = function() {
	  modal.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	
	// Handle form submission
	var submitBtn = document.getElementById("submitBtn");
	submitBtn.onclick = function() {
	  var manv = document.getElementById("manv").value;
	  var tennv = document.getElementById("tennv").value;
	
	  // Tạo một đối tượng FormData chứa dữ liệu của form
	  var formData = new FormData();
	  formData.append('manv', manv);
	  formData.append('tennv', tennv);
	
	  // Tạo một yêu cầu mới
	  var xhr = new XMLHttpRequest();
	  
	  // Thiết lập phương thức và URL cho yêu cầu
	  xhr.open("POST", "quanly?action=themnhanvien", true);
	  
	  // Gửi yêu cầu với dữ liệu form
	  xhr.send(formData);
	
	  // Xử lý phản hồi từ Servlet nếu cần
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState == XMLHttpRequest.DONE) {
	      if (xhr.status == 200) {
	        console.log("Dữ liệu đã được gửi thành công!");
	     // Đóng modal sau khi gửi dữ liệu thành công
	        modal.style.display = "none";
	     // Hiển thị thông báo thành công
	        document.getElementById("successMessage").style.display = "block";
	      } else {
	        console.error("Đã xảy ra lỗi khi gửi dữ liệu.");
	      }
	    }
	  };
	}
</script>
</html>