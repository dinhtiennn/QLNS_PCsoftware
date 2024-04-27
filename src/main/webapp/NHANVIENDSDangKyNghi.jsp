
<%@page import="bean.DangKyNghiBean"%>
<%@page import="bo.DangKyNghibo"%>
<%@page import="bo.NhanVienBo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="bo.DangKyLamBo"%>
<%@page import="bean.DangKyLamBean"%>
<%@page import="bean.NhanVienBean"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<jsp:include page="header.jsp"></jsp:include>
		<%
			DangKyNghibo dknbo = new DangKyNghibo();
			NhanVienBo nvbo = new NhanVienBo();
			NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien"); 
			ArrayList<DangKyNghiBean> dsdk = ((ArrayList<DangKyNghiBean>)request.getAttribute("dsdknghi")!=null)?(ArrayList<DangKyNghiBean>)request.getAttribute("dsdknghi"):new ArrayList<DangKyNghiBean>();
			String messageString = (request.getParameter("msg")!=null)?request.getParameter("msg"):"";
	        // Định dạng ngày
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				
	        String thang = (request.getAttribute("thang")!=null)?request.getAttribute("thang").toString():"";
	       	String nam = (request.getAttribute("nam")!=null)?request.getAttribute("nam").toString():"";
	        String msg = (request.getAttribute("msg")!=null)?request.getAttribute("msg").toString():"";
		%>
		<div class="row">
				<div class="col-2  mt-5">
					<jsp:include page="Slidebar.jsp"></jsp:include>
				</div>
				<div class="col mt-5">
					<div class="row container">
						<form action="nhanvien?action=showarrdkn" method="post">
						 	<div class="row">
								    <div class="col-sm-4">
								      <select class="form-control" id="month" name="thang">
								      	<option >Tháng</option>
								        <option value="1" <%= (thang.equals("1") ? "selected=\"selected\"" : "") %>>Tháng 1</option>
								        <option value="2" <%= (thang.equals("2") ? "selected=\"selected\"" : "") %>>Tháng 2</option>
								        <option value="3" <%= (thang.equals("3") ? "selected=\"selected\"" : "") %>>Tháng 3</option>
								        <option value="4" <%= (thang.equals("4") ? "selected=\"selected\"" : "") %>>Tháng 4</option>
								        <option value="5" <%= (thang.equals("5") ? "selected=\"selected\"" : "") %>>Tháng 5</option>
								        <option value="6" <%= (thang.equals("6") ? "selected=\"selected\"" : "") %>>Tháng 6</option>
								        <option value="7" <%= (thang.equals("7") ? "selected=\"selected\"" : "") %>>Tháng 7</option>
								        <option value="8" <%= (thang.equals("8") ? "selected=\"selected\"" : "") %>>Tháng 8</option>
								        <option value="9" <%= (thang.equals("9") ? "selected=\"selected\"" : "") %>>Tháng 9</option>
								        <option value="10" <%= (thang.equals("10") ? "selected=\"selected\"" : "") %>>Tháng 10</option>
								        <option value="11" <%= (thang.equals("11") ? "selected=\"selected\"" : "") %>>Tháng 11</option>
								        <option value="12" <%= (thang.equals("12") ? "selected=\"selected\"" : "") %>>Tháng 12</option>
								      </select>
								    </div>
								    <div class="col-sm-4">
								       <select class="form-control" id="year" name="nam">
											  <% 
											    int startYear = nhanvien.getNgayVaoLam().getYear()+1900; // Chuyển đổi biến nam sang kiểu int
											    int currentYear = java.time.LocalDate.now().getYear(); // Lấy năm hiện tại
											    for (int year = startYear; year <= currentYear; year++) { %>
											      <option value="<%= year %>" <%= ((nam).equals(year+"") ? "selected=\"selected\"" : "") %>><%= year %></option>
											  <% } %>
										</select>
								    </div>
								  	<div class="col-sm-4">
								      <button type="submit" class="btn btn-primary" >Tìm kiếm</button>
								    </div>
							 </div>
						</form>
					</div>
					<div class="row">
						<div class="col-6  mt-5">
									<%if(dsdk.size()==0){%>
										<%=msg%>
									<%}else{%>
										<table class="table">
											  <thead>
											    <tr>
											      <th scope="col">#</th>
											      <th scope="col">Ngày</th>
											      <th scope="col">Ca</th>
											      <th scope="col">Duyệt</th>
											      <th scope="col">Người duyệt</th>
											      <th scope="col">Lý do</th>
											    </tr>
											  </thead>
											  <tbody>
											  <%int i = 1;
											  for(DangKyNghiBean item : dsdk){
													// Chuyển đổi thành đối tượng LocalDate
											        LocalDate date = LocalDate.parse(item.getNgayDK().toString(), formatter);
							
											        // Định dạng lại thành "dd/MM/yyyy"
											        String formattedDate = date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
											        
											        String loaica = "";
													if(item.getMaLoaiCa().equals("LC001")){
														loaica = "Ca sáng";
													}else if(item.getMaLoaiCa().equals("LC002")){
														loaica = "Ca chiều";
													}else if(item.getMaLoaiCa().equals("LC003")){
														loaica = "Ca tối";
													}
													
													String duyet = "";
													if(item.getDuyet()==1){
														duyet = "Đã duyệt";
													}else if(item.getDuyet()==2){
														duyet = "Từ chối";
													}else if(item.getDuyet()==0){
														duyet = "Chưa duyệt";
													}
											  %>						
											    <tr>
											      <th scope="row"><%=i%></th>
											      <td><%=formattedDate%></td>
											      <td><%=loaica%></td>
											      <td><%=duyet%></td>
											      <td><%=(item.getNguoiDuyet()!=null)?item.getNguoiDuyet():""%></td>
											      <td><%=item.getLyDo()%></td>
											    </tr>
											  <%i++;} %>
											  </tbody>
											</table>
										<%
									}
							%>
							
						</div>
				</div>
				</div>
		</div>
</body>
</html>



