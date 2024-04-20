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
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<style type="text/css">
input {
	border : none;
	text-align: center;
}
input:focus-visible {
	outline : none;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="d-flex align-items-center">
		<div class="col-2  mt-5">
			<jsp:include page="Slidebar.jsp"></jsp:include>
		</div>
		<div style="margin-left: 260px;">
			<h1>ALOOOOOOOOOOOOOOOOO</h1>
			<%
		ArrayList<DangKyLamBean> ds = (ArrayList<DangKyLamBean>)request.getAttribute("bdk");
		// Lấy ngày hiện tại
		LocalDate currentDate = LocalDate.now();
		
		// Lấy ngày đầu tiên của tháng
		LocalDate firstDayOfMonth = LocalDate.of(currentDate.getYear(), currentDate.getMonth(), 1);
		
		// Lấy ngày cuối cùng của tháng
		LocalDate lastDayOfMonth = firstDayOfMonth.withDayOfMonth(firstDayOfMonth.lengthOfMonth());
		
		// Tìm ngày thứ hai của tuần đầu tiên
		LocalDate firstDayOfWeek = firstDayOfMonth;
		while (firstDayOfWeek.getDayOfWeek() != DayOfWeek.MONDAY) {
		    firstDayOfWeek = firstDayOfWeek.minusDays(1);
		}
		
		// Tạo và hiển thị bảng thời khóa biểu cho mỗi tuần
		while (firstDayOfWeek.isBefore(lastDayOfMonth) || firstDayOfWeek.isEqual(lastDayOfMonth)) {
		    LocalDate lastDayOfWeek = firstDayOfWeek.plusDays(6).isAfter(lastDayOfMonth) ? lastDayOfMonth : firstDayOfWeek.plusDays(6);
		
		    // Tạo bảng thời khóa biểu cho một tuần
		    %><h2>Lịch làm từ <%=firstDayOfWeek.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))%> đến <%=lastDayOfWeek.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))%></h2>
		    <table class="table table-bordered">
		    <tr>
		    <th style="width:14%" class="text-center table-primary">Thứ hai<br/> <%=firstDayOfWeek.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %> </th>
		    <th style="width:14%" class="text-center table-primary">Thứ ba<br/> <%=firstDayOfWeek.plusDays(1).format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))%> </th>
		    <th style="width:14%" class="text-center table-primary">Thứ tư<br/> <%=firstDayOfWeek.plusDays(2).format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %></th>
		    <th style="width:14%" class="text-center table-primary">Thứ năm<br/> <%=firstDayOfWeek.plusDays(3).format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %></th>
		    <th style="width:14%" class="text-center table-primary">Thứ sáu<br/> <%=firstDayOfWeek.plusDays(4).format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %> </th>
		    <th style="width:14%" class="text-center table-primary">Thứ bảy<br/> <%=firstDayOfWeek.plusDays(5).format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %>  </th>
		    <th style="width:14%" class="text-center table-primary">Chủ nhật (Nghỉ)<br/> <%=firstDayOfWeek.plusDays(6).format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %> </th>
		    </tr>
		    <tr>
		    <%
		    for (int i = 0; i < 7; i++) {
		    	int n = 0;
		        if (firstDayOfWeek.plusDays(i).isBefore(firstDayOfMonth) || firstDayOfWeek.plusDays(i).isAfter(lastDayOfMonth)) {
		            %><td>&nbsp;</td><%
		        } else {
		        	for(DangKyLamBean item : ds){
		        		if(item.getNgayDK().toString().equals(firstDayOfWeek.plusDays(i).toString()) && item.getMaLoaica().equals("LC1")){
		        			%><td style="width:14%" class="text-center">Sáng<%=(item.getMaLoaica().equals("LDK3"))?"(V)":"" %></td><%
		        			n =1;
		        		}
		        	}
		        	if(n==0){        		
		        		%><td>&nbsp;</td><%
		        	}
		        }
		    }
		    %></tr>
		    <tr><%
		    for (int i = 0; i < 7; i++) {
		    	int n = 0;
		        if (firstDayOfWeek.plusDays(i).isBefore(firstDayOfMonth) || firstDayOfWeek.plusDays(i).isAfter(lastDayOfMonth)) {
		        	%><td>&nbsp;</td><%
		        } else {
		        	for(DangKyLamBean item : ds){
		        		if(item.getNgayDK().toString().equals(firstDayOfWeek.plusDays(i).toString()) && item.getNgayDK().equals("LC2")){
		        			%><td style="width:14%" class="text-center">Chiều<%=(item.getMaLoaica().equals("LDK3"))?"(V)":"" %></td><%
		        			n =1;
		        		}
		        	}
		        	if(n==0){        		
		        		%><td>&nbsp;</td><%
		        	}
		        }
		    }
		    %></tr>
		    <tr><%
		    for (int i = 0; i < 7; i++) {
		    	int n = 0;
		        if (firstDayOfWeek.plusDays(i).isBefore(firstDayOfMonth) || firstDayOfWeek.plusDays(i).isAfter(lastDayOfMonth)) {
		        	%><td>&nbsp;</td><%
		        } else {
		        	for(DangKyLamBean item : ds){
		        		if(item.getNgayDK().toString().equals(firstDayOfWeek.plusDays(i).toString()) && item.getMaLoaica().equals("LC3")){
		        			%><td style="width:14%" class="text-center">Tối<%=(item.getMaLoaica().equals("LDK3"))?"(V)":"" %></td><%
		        			n =1;
		        		}
		        	}
		        	if(n==0){        		
		        		%><td>&nbsp;</td><%
		        	}
		        }
		    }%>
		    </tr>
		   </table>
			<%
		    // Chuyển sang tuần tiếp theo
		    firstDayOfWeek = firstDayOfWeek.plusDays(7);
		}
		%>
		</div>
	</div>
</body>
</html>