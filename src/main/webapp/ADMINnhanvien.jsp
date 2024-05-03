<%@page import="bo.NhanVienBo"%>
<%@page import="bean.NhanVienBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.ThongSoKiThuatBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Phương Chi Software</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<style type="text/css">

</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<form class="d-flex justify-content-center" role="search" action="adminNhanVienController">
	      <input style="width: 50%;margin-top: 20px;height: 40px;" class="form-control me-2" type="search" name="txttk" placeholder="Search by name or ID" aria-label="Search">
	      <button style="height: 40px; margin: 20px 0;" class="btn btn-outline-success" type="submit">Search</button>
    </form>
   <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ThemNhanSu">Thêm mới nhân sự</button>
	<div class="d-flex">
		<div class="col-2  mt-5">
			<jsp:include page="adminSlidebar.jsp"></jsp:include>
		</div>
	    <table id="myTable" class="table table-hover" style="font-size: 11px;">
			<thead>
		        <tr>
		            <th>Mã Nhân Viên</th>
		            <th style="width: 120px;">Tên Nhân Viên</th>
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
		            <th>Ảnh</th> 
		            <th>Ngày Vào Làm</th> 
		            <th>Ngày Kết Thúc</th> 
		            <th>Số Tài Khoản</th> 
		           
		        </tr>
		    </thead>
		    <tbody>
	    <%
			ArrayList<NhanVienBean> ds = (ArrayList<NhanVienBean>)request.getAttribute("DanhSachNhanVien"); 
			if(ds.size()==0){%>
				<td>Không Tìm Thấy</td>
			<%}%>
			<%if(ds.size() != 0){%>
		    
				
				<%NhanVienBo nvbo = new NhanVienBo();
				int n = ds.size();
				for(int i=0; i<n; i++) {
					NhanVienBean nvb = ds.get(i);
					String maNV = nvb.getMaNV();%>
			        <tr onclick="moModal(this)">
			            <td id="maNV_<%=i%>"><%=nvb.getMaNV()%></td>
			            <td id="tenNV_<%=i%>"><%=nvbo.getnhanvientheoma(nvb.getMaNV()).getTenNV() %></td>
			            <td id="maCV_<%=i%>"><%=nvb.getMaCV() %></td>
			            <td id="ngaySinh_<%=i%>"><%=nvb.getNgaySinh() %></td>
			            <td id="gioiTinh_<%=i%>"><%=nvb.getGioiTinh() %></td>
			            <td id="email_<%=i%>"><%=nvb.getEmail() %></td>
			            <td id="sdt_<%=i%>"><%=nvb.getsDT() %></td>
			            <td id="dvct_<%=i%>"><%=nvb.getdVCT() %></td>
			            <td id="chucDanh_<%=i%>"><%=nvb.getChucDanh() %></td>
			            <td id="tenDangNhap_<%=i%>"><%=nvb.getTenDangNhap() %></td>
			            <td id="matKhau_<%=i%>"><%=nvb.getMatKhau() %></td>
			            <td id="trangThaiCongViec_<%=i%>"><%=nvb.getTrangThaiCongViec() %></td>
			            <td id="anh_<%=i%>"><%=nvb.getAnh() %></td>
			            <td id="ngayvaolam_<%=i%>"><%=nvb.getNgayVaoLam() %></td>
			            <td id="ngayketthuc_<%=i%>"><%=nvb.getNgayKetThuc()%></td>
			            <td id="stknhanvien_<%=i%>"><%=nvb.getSoTaiKhoan()%></td>
			        </tr>
				<%}		
			}%>
			</tbody>
		</table>
	</div>

<!-- Modal -->
	<div class="modal" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" role="dialog">
	    <div style="background-image: url('src/main/webapp/prf.svg');  background-size: cover;" class="modal-dialog modal-dialog-centered">
	    	<form action="adminChinhSuaThongTinNhanVien" method="post" onsubmit="return showAlert()">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="exampleModalLabel">Thông tin nhân viên</h5>
		                <button onclick="dongModal()" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body">
		                <div id="modalBody">
		                
		                </div>
		            </div>
		            <div class="modal-footer">
		                <button onclick="dongModal()" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
		                <button type="submit">Xác Nhận</button>
		            </div>
		        </div>
	    	</form>
	    </div>
	</div>
<!--modal 2  -->
<div class="modal fade" id="ThemNhanSu" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Nhập thông tin nhân sự</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<label for="tennv">Tên NV:</label>
		    <input type="text" id="tennv" name="tennv"> <br>
		    <label for="ngaysinh">Ngày Sinh:</label>
		    <input type="date" id="selectedDate" name="selectedDate" required> <br>
		    <label for="manv">Giới tính:</label>
		    <input type="radio" name="gender" value="male"> Nam
		    <input type="radio" name="gender" value="female"> Nữ <br>
		    <label for="tennv">Email:</label>
		    <input type="email" id="email" name="email"><br>
		    <label for="manv">Số điện thoại:</label>
		    <input type="text" id="sdt" name="sdt"><br>
		    <label for="tennv">Tên đăng nhập:</label>
		    <input type="text" id="tendn" name="tendn"><br>
		    <label for="manv">Mật khẩu:</label>
		    <input type="text" id="mk" name="mk"><br>
		    <label for="tennv">Ảnh:</label>
		    <input type="file" name="image" accept="image/*"><br>
		    <label for="manv">Số tài khoản:</label>
		    <input type="text" id="stk" name="stk">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Xác nhận</button>
      </div>
    </div>
  </div>
</div>
	

</body>


<script type="text/javascript">
	//Lấy modal
	var modal = document.getElementById("myModal");
	
	// Lấy nút để mở modal
	var btnOpenModal = document.querySelector("tr");
	
	// Lấy phần tử <span> đóng modal
	var spanCloseModal = document.getElementsByClassName("close")[0];
	

	
	// Khi người dùng click vào <span> (x), đóng modal
	function dongModal() {
	    modal.style.display = "none";
	}
	
	// Khi người dùng click bất kỳ nơi nào ngoài modal, đóng modal
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	function moModal(row) {
		modal.style.display = "block";
        // Lấy các giá trị từ các ô trong hàng được nhấp vào
        var maNV = row.querySelector("[id^='maNV_']").textContent;
        var tenNV = row.querySelector("[id^='tenNV_']").textContent;
        var maCV = row.querySelector("[id^='maCV_']").textContent;
        var ngaySinh = row.querySelector("[id^='ngaySinh_']").textContent;
        var gioiTinh = row.querySelector("[id^='gioiTinh_']").textContent;
        var email = row.querySelector("[id^='email_']").textContent;
        var sdt = row.querySelector("[id^='sdt_']").textContent;
        var dvct = row.querySelector("[id^='dvct_']").textContent;
        var chucDanh = row.querySelector("[id^='chucDanh_']").textContent;
        var tenDangNhap = row.querySelector("[id^='tenDangNhap_']").textContent;
        var matKhau = row.querySelector("[id^='matKhau_']").textContent;
        var trangThaiCongViec = row.querySelector("[id^='trangThaiCongViec_']").textContent;
        var anh = row.querySelector("[id^='anh_']").textContent;
        var ngayvaolam = row.querySelector("[id^='ngayvaolam_']").textContent;
        var ngayketthuc = row.querySelector("[id^='ngayketthuc_']").textContent;
        var stknhanvien = row.querySelector("[id^='stknhanvien_']").textContent;
	
     	// Hiển thị các giá trị trong modal
        var modalBody = document.getElementById("modalBody");
        // Xóa nội dung cũ của modalBody
        modalBody.innerHTML = "";

        // Tạo và thêm các phần tử <p> vào modalBody
        var rows = [
            { label: "Mã Nhân Viên", value: maNV },
            { label: "Tên Nhân Viên", value: tenNV },
            { label: "Mã Chức Vụ", value: maCV },
            { label: "Ngày Sinh", value: ngaySinh },
            { label: "Giới Tính", value: gioiTinh },
            { label: "Email", value: email },
            { label: "Số Điện Thoại", value: sdt },
            { label: "Đơn Vị Công Tác", value: dvct },
            { label: "Chức Danh", value: chucDanh },
            { label: "Tên Đăng Nhập", value: tenDangNhap },
            { label: "Mật Khẩu", value: matKhau },
            { label: "Trạng Thái Công Việc", value: trangThaiCongViec },
            { label: "Ảnh", value: anh },
            { label: "Ngày Vào Làm", value: ngayvaolam },
            { label: "Ngày Kết Thúc", value: ngayketthuc },
            { label: "Số Tài Khoản", value: stknhanvien }
        ];
 		
        rows.forEach(rowData => {
            var labelElement = document.createElement("p");

            labelElement.textContent = rowData.label + ": ";

            if (rowData.label === "Ảnh") {
            	var valueElement = document.createElement("div"); // Sử dụng div để chứa hình ảnh
                var imgElement = document.createElement("img");
                imgElement.src = rowData.value;
                valueElement.appendChild(imgElement);
            }if (rowData.label === "Trạng Thái Công Việc") {
            	var valueElement = document.createElement("select");

                // Tạo tùy chọn đầu tiên
                var optionTrue = document.createElement("option");
                optionTrue.value = "true";
                optionTrue.text = "True";
                valueElement.appendChild(optionTrue);

                // Tạo tùy chọn thứ hai
                var optionFalse = document.createElement("option");
                optionFalse.value = "false";
                optionFalse.text = "False";
                valueElement.appendChild(optionFalse);
            } 
            else {
            	var valueElement = document.createElement("input");
                valueElement.value = rowData.value;
                valueElement.setAttribute("name", rowData.label.toLowerCase()); // Thêm thuộc tính name
            }
            
         	// Thêm class cho các phần tử
            labelElement.classList.add("label");
            valueElement.classList.add("input-value");

            modalBody.appendChild(labelElement);
            modalBody.appendChild(valueElement);
        });

	}
	
	function showAlert() {
	    var confirmation = confirm("Bạn muốn thay đổi thông tin?");
	    if (confirmation) {
	        alert("Thông tin đã được thay đổi!");
	        return true; 
	    } else {
	    	window.location.href = "adminNhanVienController";
	    	return false; 
	    }
	}
		
</script>
</html>