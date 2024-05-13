<%@page import="bean.thongkecalambean"%>
<%@page import="java.time.LocalDate"%>
<%@page import="bean.DangKyLamBean"%>
<%@page import="java.util.ArrayList"%>
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
.dkl-content {
    box-shadow: var(--bs-box-shadow) !important;
    width: 65%;
    height: 40%;
    padding: 24px;
    margin: 100px 0 20px 0;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="d-flex justify-content-center">
		<div >
			<jsp:include page="adminSlidebar.jsp"></jsp:include>
		</div>
		<div class="dkl-content">
			<div style="text-align: center;">
				<h1>Danh Sách Nhân Viên Đăng Ký Làm</h1>
			</div>
			<form action="adminDangKyLamController" method="get">
		        <label for="month">Chọn Tháng:</label>
		        <select name="month" id="month">
		            <option value="1">Tháng 1</option>
		            <option value="2">Tháng 2</option>
		            <option value="3">Tháng 3</option>
		            <option value="4">Tháng 4</option>
		            <option value="5">Tháng 5</option>
		            <option value="6">Tháng 6</option>
		            <option value="7">Tháng 7</option>
		            <option value="8">Tháng 8</option>
		            <option value="9">Tháng 9</option>
		            <option value="10">Tháng 10</option>
		            <option value="11">Tháng 11</option>
		            <option value="12">Tháng 12</option>
		        </select>
				<label for="year">Chọn Năm:</label>
			        <select name="year" id="year">
			            <% 
			                long currentYear = java.time.LocalDate.now().getYear();
			                for (long i = currentYear; i >= currentYear - 10; i--) {
			            %>
			            <option value="<%= i %>"><%= i %></option>
			            <% } %>
			        </select>
		        <input type="submit" value="Search">
		    </form>
		    <%ArrayList<DangKyLamBean> ChiTiet = (ArrayList<DangKyLamBean>) request.getAttribute("ChiTiet"); %>
		    <%if(ChiTiet == null){ %>
			<table class="table" >
					<thead>
						<tr>
							<th>Mã Nhân viên</th>
							<th>Số ca làm trong tháng</th>
							<th>Chi tiết ca làm</th>
						</tr>
					</thead>
					<tbody>
					<% ArrayList<thongkecalambean> ds = (ArrayList<thongkecalambean>)request.getAttribute("BangDangKyLam");
					int n = ds.size();
					for(int i =0; i<n;i++){
						thongkecalambean tkb = ds.get(i);%>
						<tr>
							<td><%=tkb.getMaNV()%></td>
							<td><%=tkb.getSocalam()%></td>
							<td><a href="adminDangKyLamController?manv=<%=tkb.getMaNV()%>">Xem Chi Tiết</a></td>
						</tr>	
					<%}%>
					</tbody>
			</table>
			<%}%>
			<%if(ChiTiet != null){ %>
			<table class="table" >
					<thead>
						<tr>
							<th>Mã Nhân viên</th>
							<th>Mã Loại ca</th>
							<th>Ngày Đăng ký</th>
						</tr>
					</thead>
					<tbody>
					<% 
					int n = ChiTiet.size();
					for(int i =0; i<n;i++){
						DangKyLamBean tkb = ChiTiet.get(i);%>
						<tr>
							<td><%=tkb.getMaNV()%></td>
							<td><%=tkb.getMaLoaica()%></td>
							<td><%=tkb.getNgayDK()%></td>
						</tr>	
					<%}%>
					</tbody>
			</table>
			<%}%>
		</div>
	</div>
</body>
</html>