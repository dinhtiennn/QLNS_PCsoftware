<%@page import="bean.NhanVienBean"%>
<%@page import="bo.NhanVienBo"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
<%@page import="bean.DangKyLamBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Lịch Trình Tháng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
		
        th {
            background-color: #f2f2f2;
        }
        h2{
        	text-align: center;
        	padding: 48px 0px 16px 0px;
    		font-size: larger;
        }
    </style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="row">
		<div class="col-2 mt-5" style="margin-top: 8rem !important;">
			<jsp:include page="QUANLYslidebar.jsp"></jsp:include>
		</div>
		<div class="col-10" style="margin-top: 7rem !important;">
			<div style="text-align: center;">
				<h1>Lịch trình tháng</h1>
			</div>
			<form action="quanly?action=showMonthlySchedule" method="post" onsubmit="return validateDate()">
		        <label for="selectedDate">Tìm kiếm từ ngày :</label>
		        <input type="date" id="selectedDate" name="ngayBatDau" required>
		        <label for="selectedDate">đến ngày :</label>
		        <input type="date" id="selectedDate2" name="ngayKetThuc">
		        <label for="chonca">và ca :</label>
		        <select id="calam" name="calam">
		        	<option>Chọn Ca</option>
					<option value="LC001">Sáng</option>
					<option value="LC002">Chiều</option>
					<option value="LC003">Tối</option>
				</select>
		        <input type="submit" value="Tìm Kiếm" class="btn btn-primary">
		    </form>
			    <%
				ArrayList<DangKyLamBean> ds = ((ArrayList<DangKyLamBean>)request.getAttribute("ds_dkn")!=null)?(ArrayList<DangKyLamBean>)request.getAttribute("ds_dkn"):new ArrayList<DangKyLamBean>();
				NhanVienBo nvbo = new NhanVienBo();
				int i = 1;
				NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");
				%>
			<table class="table">
				<thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Mã nhân viên</th>
				      <th scope="col">Tên nhân viên</th>
				      <th scope="col">Mã loại ca</th>
				      <th scope="col">Ngày đăng ký</th>
				    </tr>
				</thead>
				<tbody>
				<%for(DangKyLamBean item : ds){%>
					<tr>
				      <th scope="row"><%=i%></th>
				      <td><%=item.getMaNV()%></td>
				      <td><%=nvbo.getnhanvientheoma(item.getMaNV()).getTenNV()%></td>
				      <%
				      String tenloaica = "";
				      if(item.getMaLoaica().equals("LC001")){
				    	  tenloaica = "Ca sáng";
				      }else if(item.getMaLoaica().equals("LC002")){
				    	  tenloaica = "Ca chiều";
				      }else if(item.getMaLoaica().equals("LC003")){
				    	  tenloaica = "Ca tối";
				      }
				      %>
				      <td><%=tenloaica%></td>
				      <td><%=item.getNgayDK()%></td>	
				    </tr>
				  <%i++;}%>
				</tbody>
			</table>
		</div>
	</div>
	<script>
        // Hàm này được sử dụng để kiểm tra định dạng của ngày tháng
        function validateDate() {
            var selectedDate = document.getElementById("selectedDate").value;
            // Kiểm tra xem selectedDate có đúng định dạng ngày tháng YYYY-MM-DD không
            var regex = /^\d{4}-\d{2}-\d{2}$/;
            if (!regex.test(selectedDate)) {
                alert("Vui lòng chọn ngày tháng hợp lệ (YYYY-MM-DD)!");
                return false;
            }
            return true;
        }
	</script>
</body>
</html>