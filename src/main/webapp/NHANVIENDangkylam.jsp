<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
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
	<%String msgSuccess = (request.getAttribute("msgSuccess")!=null)?request.getAttribute("msgSuccess").toString():"";%>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="row">
		<div class="col-2  mt-5">
			<jsp:include page="Slidebar.jsp"></jsp:include>
		</div>
		<div class="col-10 mt-4">
	    	<%
	    	LocalDate currentDate = LocalDate.now();
			if(currentDate.getDayOfWeek().toString().equalsIgnoreCase("Thursday") || currentDate.getDayOfWeek().toString().equalsIgnoreCase("Friday") ||currentDate.getDayOfWeek().toString().equalsIgnoreCase("Saturday")){%>
				<form action="nhanvien?action=workregistration" method="post">
				<div class="col-10 mt-4">
					<h2 class="text-center mb-3">Đăng ký làm việc cho tuần sau</h2>
			   		<div class="container-fluid">
			        <table class="table table-bordered">
			            <thead>
			                <tr>
			                	<%     
			                	currentDate = LocalDate.now().plusDays(7);
			        	        // Tính toán ngày bắt đầu và kết thúc của tuần
			        	        LocalDate startOfWeek = currentDate.with(DayOfWeek.MONDAY);
			        	        LocalDate endOfWeek = currentDate.with(DayOfWeek.SATURDAY);
			        	        DateTimeFormatter dayFormatter = DateTimeFormatter.ofPattern("EEEE", new Locale("vi", "VN"));
			        	        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			        	        
			                	// In ra các ngày từ thứ 2 đến thứ 7 của tuần
			                	while (!startOfWeek.isAfter(endOfWeek)) {
			                        String dayOfWeek = startOfWeek.format(dayFormatter);
			                        String date = startOfWeek.format(dateFormatter);
			                        %>
			       	        		<th style="width:14%" class="text-center table-primary">
				                        <%=dayOfWeek%><br />
				                        <%=date%>
				                    </th>
			        	        	<%
			                        startOfWeek = startOfWeek.plusDays(1);
			                    }
			                	%>
			                </tr>
			            </thead>
			            <tbody>
			                    <tr>
			                    	<%    
			                    	startOfWeek = currentDate.with(DayOfWeek.MONDAY);
				                	// In ra các ngày từ thứ 2 đến thứ 7 của tuần
			                    	try {
					                	while (!startOfWeek.isAfter(endOfWeek)) {
					                        String date = startOfWeek.toString();%>
							       	        		<th style="width:14%" class="text-center">
								                        <div class="form-check">
														  <input class="form-check-input" type="checkbox" value="<%=startOfWeek%>" name="casang">
														  <label class="form-check-label" for="flexCheckDefault">
														    Sáng
														  </label>
														</div>
								                    </th>
					            					
					            				
					        	        	<%startOfWeek = startOfWeek.plusDays(1);
					                    }
			            			} catch (Exception e) {
			            				e.printStackTrace();
			            			}
				                	%>
			                    </tr>
			                   <tr>
			                    	<%    
			                    	startOfWeek = currentDate.with(DayOfWeek.MONDAY);
				                	// In ra các ngày từ thứ 2 đến thứ 7 của tuần
			                    	try {
					                	while (!startOfWeek.isAfter(endOfWeek)) {
					                        String date = startOfWeek.toString();%>
							       	        		<th style="width:14%" class="text-center">
								                        <div class="form-check">
														  <input class="form-check-input" type="checkbox" value="<%=startOfWeek%>" name="cachieu">
														  <label class="form-check-label" for="flexCheckDefault">
														    Chiều
														  </label>
														</div>
								                    </th>
					            					
					            				
					        	        	<%startOfWeek = startOfWeek.plusDays(1);
					                    }
			            			} catch (Exception e) {
			            				e.printStackTrace();
			            			}
				                	%>
			                    </tr>
			                    <tr>
			                    	<%    
			                    	startOfWeek = currentDate.with(DayOfWeek.MONDAY);
				                	// In ra các ngày từ thứ 2 đến thứ 7 của tuần
			                    	try {
					                	while (!startOfWeek.isAfter(endOfWeek)) {
					                        String date = startOfWeek.toString();%>
							       	        		<th style="width:14%" class="text-center">
								                        <div class="form-check">
														  <input class="form-check-input" type="checkbox" value="<%=startOfWeek%>" name="catoi">
														  <label class="form-check-label" for="flexCheckDefault">
														    Tối
														  </label>
														</div>
								                    </th>
					            					
					            				
					        	        	<%startOfWeek = startOfWeek.plusDays(1);
					                    }
			            			} catch (Exception e) {
			            				e.printStackTrace();
			            			}
				                	%>
			                    </tr>
			            </tbody>
			        </table>
					</div>
				</div>
				<button type="submit" class="btn btn-success">Đăng ký</button>
			</form>
			<%}else{%>
				<span class="text-center">Chưa tới thời gian đăng ký!</span>
				<br>
				<a href="index">		      		
	      			<button type="button" class="btn btn-success">Trang chủ</button>
		      	</a>
			<%}
    		%>
			
		</div>
	</div>
	
	
	<!-- Modal Success-->
	<div class="modal fade" id="staticBackdropSuccess" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      	<div class="modal-body">
	        	<div class="alert alert-success" role="alert">
	        		<span id="msgsuccess"></span>
				</div>			
			</div>
	      	<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				<a href="index">		      		
	      			<button type="button" class="btn btn-success">Trang chủ</button>
		      	</a>
				
	      	</div>
	    </div>
	  </div>
	</div>
	
</body>
</html>
<script >
	
	document.addEventListener("DOMContentLoaded", function() {
		  // Lấy giá trị của các thuộc tính từ request.getAttribute
		  var msgSuccess = "<%=msgSuccess%>";
		  // Kiểm tra nếu một trong hai giá trị 
		 if(msgSuccess.length > 0){
			// Lấy tham chiếu đến modal
			    var modalLogin = document.getElementById("staticBackdropSuccess");

			    // Khởi tạo modal bằng Bootstrap JavaScript
			    var myModal = new bootstrap.Modal(modalLogin, {
			      backdrop: 'static',
			      keyboard: false
			    });

			    // Hiển thị modal
			    myModal.show();
			    document.getElementById("msgsuccess").innerHTML = msgSuccess;
		  }
		});
</script>