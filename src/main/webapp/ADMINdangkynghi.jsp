<%@page import="bean.NhanVienBean"%>
<%@page import="bean.VDangKyNghiBean"%>
<%@page import="adminbo.adminNhanVienBo"%>
<%@page import="bean.DangKyNghiBean"%>
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
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="d-flex">
		<div class="col-2  mt-5">
			<jsp:include page="adminSlidebar.jsp"></jsp:include>
		</div>
		<form action="adminDuyetDangKyNghiController" method="get">
			<table class="table">
				<thead>
			        <tr>
			        	<th></th>
			            <th>Mã Nhân Viên</th>
			            <th>Tên Nhân Viên</th>
			            <th>Loại Ca Làm</th>
			            <th>Ngày Đăng Ký</th>
			            <th>Duyệt</th>
			            <th>Người Duyệt</th>
			            <th>Lý Do</th> 
			        </tr>
	   			 </thead>
	   			 <tbody>
	   			 	<%ArrayList<VDangKyNghiBean> ds = (ArrayList<VDangKyNghiBean>)request.getAttribute("BangDangKyNghi");
	   			 		NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");
			   			int n = ds.size();
			   			for(int i=0; i<n; i++) {
			   			VDangKyNghiBean dkb = ds.get(i);%>
	   			 	<tr>
	   			 		   <td><input type="checkbox" name="check" value="<%=dkb.getMaDkNghi() %>"></td>
				           <td><%=dkb.getMaNV() %></td>  
				           <td><%=dkb.getTenNV() %></td>     
				           <td><%=dkb.getMaLoaiCa() %></td>      
				           <td><%=dkb.getNgayDK() %></td>  
				           
			           <%if(dkb.getDuyet() == 0) {%>
				           <td>Chờ duyệt</td>
				           <td style="color: #c6cd1e;"> </td>
			           <%} else {%>
				           <td>Đã duyệt</td>
				           <td><input type="text" value="<%=dkb.getNguoiDuyet() %>"></td> 
			           <%} %>
				           <td><%=dkb.getLyDo() %></td>
	        	   </tr>
	   			 <%}%>
	   			 </tbody>
	
			</table>
			<button class="btn btn-sua" type="submit" name="btn-duyet" value="<%=nhanvien.getTenNV() %>">Duyệt</button>
		</form>	
	</div>
</body>


</html>