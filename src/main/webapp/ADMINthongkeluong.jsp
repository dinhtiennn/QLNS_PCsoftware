<%@page import="bean.ThongSoKiThuatBean"%>
<%@page import="adminbo.adminNhanVienBo"%>
<%@page import="bean.ThongKeLuongBean"%>
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
		<table class="table">
			<thead>
		        <tr>
		            <th>Mã Nhân Viên</th>
		            <th>Tên Nhân Viên</th>
		            <th>Tháng-Năm Làm Việc</th>
		            <th>Số Ca Làm</th>
		            <th>Số Ca Nghỉ</th>
		            <th>Lương</th> 
		        </tr>
   			 </thead>
   			 <tbody>
   			 	<%ArrayList<ThongKeLuongBean> ds = (ArrayList<ThongKeLuongBean>)request.getAttribute("ThongKeLuong");
   			 	adminNhanVienBo adnvbo = new adminNhanVienBo();
	   			
		   			int n = ds.size();
		   			for(int i=0; i<n; i++) {
		   				ThongKeLuongBean tklb = ds.get(i);%>
   			 	<tr> 
			 		<td><%=tklb.getMaNV()%></td>
		           	<td><%=adnvbo.getnhanvientheoma(tklb.getMaNV()).getTenNV() %></td>     
		           	<td><%=tklb.getThangNam() %></td>      
		           	<td><%=tklb.getSoCaLam() %></td> 
		           	<td><%=tklb.getSoCaNghi() %></td> 
		           	<td><%=tklb.getLuong() %></td>
   			 	</tr>
   			 		<%} %>
   			 	
   			 </tbody>

		</table>
	</div>
</body>
</html>