<%@page import="bean.DangKyNghiBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
		<div class="col-2  mt-5">
			<jsp:include page="adminSlidebar.jsp"></jsp:include>
		</div>
		<table>
			<thead>
		        <tr>
		            <th>Mã Nhân Viên</th>
		            <th>Loại Ca Làm</th>
		            <th>Ngày Đăng Ký</th>
		            <th>Duyệt</th>
		            <th>Người Duyệt</th>
		        </tr>
   			 </thead>
   			 <tbody>
   			 	<%ArrayList<DangKyNghiBean> ds = (ArrayList<DangKyNghiBean>)request.getAttribute("BangDangKyNghi");
		   			int n = ds.size();
		   			for(int i=0; i<n; i++) {
		   			DangKyNghiBean dkb = ds.get(i);%>
   			 	<tr>
			           <td><%=dkb.getMaNV() %></td>      
			           <td><%=dkb.getMaLoaiCa() %></td>      
			           <td><%=dkb.getNgayDK() %></td>      
			           <td><%=dkb.getDuyet() %></td>
			           <%if(dkb.getNguoiDuyet()==null) { %>  
			           		<td>Đang chờ duyệt</td>
			           <%} else {%>    
			           		<td><%=dkb.getNguoiDuyet() %></td>      
			           <%} %>
        	   </tr>
   			 <%}%>
   			 </tbody>

		</table>
</body>
</html>