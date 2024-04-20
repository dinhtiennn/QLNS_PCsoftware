<%@page import="bean.ThongSoKiThuatBean"%>
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
<div class="row">
	<div class="col-2  mt-5">
		<jsp:include page="Slidebar.jsp"></jsp:include>
	</div>
	<h1>Bảng Thông số kỹ thuật</h1>
 	<% ThongSoKiThuatBean tsbean = (ThongSoKiThuatBean)request.getAttribute("BangThongSo"); %>
 	Hệ Số Lương :  <%=tsbean.getHSL()%>  <br>
 	Hệ số lương tăng ca : <%=tsbean.getHSLOT()%><br>
 	Hệ Số lương phạt : <%=tsbean.getHSLPhat()%><br>
 	Số ca làm tối thiểu 1 tháng : <%=tsbean.getSoCaLamMin()%><br>
 	Số nhân viên tối đa 1 ca : <%=tsbean.getSoNVMotCaMax()%><br>
 	Số nhân viên tối thiểu 1 ca : <%=tsbean.getSoNVMotCaMin()%><br>
</body>
</html>