<%@page import="bean.LoaiCaBean"%>
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
	<div class="d-flex">
		<div class="col-2  mt-5">
			<jsp:include page="adminSlidebar.jsp"></jsp:include>
		</div>
		<table class="table" >
			<thead>
				<tr>
					<th>Mã Loại Ca</th>
					<th>Tên Loại Ca</th>
				</tr>
			</thead>
			<tbody>
				<%
					ArrayList<LoaiCaBean> ds = (ArrayList<LoaiCaBean>)request.getAttribute("BangLoaiCa");
				int n = ds.size();
				for(int i =0; i<n;i++){
					LoaiCaBean lcb = ds.get(i);%>
					<tr>
						<td><%=lcb.getMaLoaiCa() %></td>
						<td><%=lcb.getTenLoaiCa() %></td>
					</tr>	
				<%}%>
			</tbody>
			
			
		
		
		
		</table>
		
		
	</div>
</body>
</html>