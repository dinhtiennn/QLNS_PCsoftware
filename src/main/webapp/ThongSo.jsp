<%@page import="bean.ThongSoKiThuatBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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