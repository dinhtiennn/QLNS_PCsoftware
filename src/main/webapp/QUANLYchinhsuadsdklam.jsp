
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
<title>Danh Sách Làm Việc</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
		<jsp:include page="header.jsp"></jsp:include>
		<%
		
			DangKyLamBo dklambo = new DangKyLamBo();
			NhanVienBo nvbo = new NhanVienBo();
			NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien"); 
			String dateString = (request.getAttribute("date")!=null?request.getAttribute("date").toString():"");
			String loaicaString = (request.getAttribute("loaica")!=null?request.getAttribute("loaica").toString():"");
			ArrayList<DangKyLamBean> dsdkl = dklambo.GetAllNVLamCungCa(Date.valueOf(dateString), loaicaString);
			String loaica = "";
			if(loaicaString.equals("LC001")){
				loaica = "Ca sáng";
			}else if(loaicaString.equals("LC002")){
				loaica = "Ca chiều";
			}else if(loaicaString.equals("LC003")){
				loaica = "Ca tối";
			}
			        // Định dạng ngày
			        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

			        // Chuyển đổi thành đối tượng LocalDate
			        LocalDate date = LocalDate.parse(dateString, formatter);

			        // Định dạng lại thành "dd/MM/yyyy"
			        String formattedDate = date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
		%>
		
		<div style="margin-top: 65px;" class="row">
			<div class="col-2  mt-5" style="margin-top: 8rem !important;">
				<jsp:include page="QUANLYslidebar.jsp"></jsp:include>
			</div>
			<div class="col-6  mt-5">
				<br>
				<br>
					Ngày: <%=formattedDate%> 
				<br>
				 	Loại ca: <%=loaica%>
				<table class="table">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Mã nhân viên</th>
				      <th scope="col">Tên nhân viên</th>
				      <th scope="col">Chức danh</th>
				      <th scope="col">Đơn vị</th>
				    </tr>
				  </thead>
				  <tbody>
				  <%int i = 1;
				  for(DangKyLamBean item : dsdkl){%>						
				    <tr>
				      <th scope="row"><%=i%></th>
				      <td><%=item.getMaNV()%></td>
				      <td><%=nvbo.getnhanvientheoma(item.getMaNV()).getTenNV()%></td>
				      <td><%=nvbo.getnhanvientheoma(item.getMaNV()).getChucDanh()%></td>
				      <td><%=nvbo.getnhanvientheoma(item.getMaNV()).getdVCT()%></td>
				      <td>
				      	<a href="quanly?action=chinhsuadsdangki&date=<%=date%>&lc=<%=loaicaString%>&manv=<%=item.getMaNV()%>&xoa=xoa">
							<button type="button" class="btn btn-warning">Xóa</button>
						</a>
				      </td>
				    </tr>
				  <%i++;} %>
				  </tbody>
				</table>
			</div>
			<div class="col-4  mt-5 px-5">
				
				 <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        Thêm nhân viên
    </button>
    
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Nhân viên</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="employeeList">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Mã nhân viên</th>
                                    <th scope="col">Tên nhân viên</th>
                                    <th scope="col">Chức danh</th>
                                    <th scope="col">Đơn vị</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody id="employeeTableBody">
                                <% ArrayList<NhanVienBean> dsnv = nvbo.getnhanvien();
                                
                                   for (NhanVienBean nv : dsnv) { 
                                	    boolean isFound = false;
                                	    
                                	    // Quét qua danh sách đăng ký làm
                                	    for (DangKyLamBean item : dsdkl) {
                                	        if (nv.getMaNV().equals(item.getMaNV())) {
                                	            isFound = true;
                                	            break; // Thoát khỏi vòng lặp trong khi đã tìm thấy sự trùng khớp
                                	        }
                                	    }
                                	    if (!isFound) { %>
                                	       <tr>
		                                       <td><%= nv.getMaNV() %></td>
		                                       <td><%= nv.getTenNV() %></td>
		                                       <td><%= nv.getChucDanh() %></td>
		                                       <td><%= nv.getdVCT() %></td>
		                                       <td><a href="quanly?action=chinhsuadsdangki&date=<%=date%>&lc=<%=loaicaString%>&manv=<%=nv.getMaNV()%>&them=them">
													<button type="button" class="btn btn-success mt-1">Thêm</button>
												</a></td>
		                                   </tr>
                                	    <% }
                                	} %>
                                   
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
			</div>
		</div>
</body>
</html>