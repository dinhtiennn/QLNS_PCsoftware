<%@page import="java.time.LocalDate"%>
<%@page import="bean.DangKyLamBean"%>
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
<style type="text/css">
.dkl-content {
    box-shadow: var(--bs-box-shadow) !important;
    width: 65%;
    height: 40%;
    padding: 24px;
    margin: 100px 0 20px 0;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="d-flex justify-content-center">
		<div >
			<jsp:include page="adminSlidebar.jsp"></jsp:include>
		</div>
		<div class="dkl-content">
			<div style="text-align: center;">
				<h1>Danh Sách Nhân Viên Đăng Ký Làm</h1>
			</div>
			<form action="adminDangKyLamController" method="post" onsubmit="return validateDate()">
		        <label for="selectedDate">Tìm kiếm từ ngày :</label>
		        <input type="date" id="selectedDate" name="selectedDate" required>
		        <label for="selectedDate2">đến ngày :</label>
		        <input type="date" id="selectedDate2" name="selectedDate2" required>
		        <input type="submit" value="Search">
		    </form>
			<table class="table" >
					<thead>
						<tr>
							<th>Mã Đăng Ký </th>
							<th>Mã Nhân viên</th>
							<th>Mã Loại Ca</th>
							<th>Ngày Đăng Ký</th>
						</tr>
					</thead>
					<tbody>
					<% ArrayList<DangKyLamBean> ds = (ArrayList<DangKyLamBean>)request.getAttribute("BangDangKyLam");
					int n = ds.size();
					for(int i =0; i<n;i++){
						DangKyLamBean dkb = ds.get(i);%>
						<tr>
							<td><%=dkb.getMaDkLam()%></td>
							<td><%=dkb.getMaNV()%></td>
							<td><%=dkb.getMaLoaica()%></td>
							<td><%=dkb.getNgayDK()%></td>
						</tr>	
					<%}%>
					</tbody>
			</table>
		</div>
	</div>
<script>
        // Hàm này được sử dụng để kiểm tra định dạng của ngày tháng
        function validateDate() {
            var selectedDate = document.getElementById("selectedDate").value;
            var selectedDate2 = document.getElementById("selectedDate2").value;
            // Kiểm tra xem selectedDate có đúng định dạng ngày tháng YYYY-MM-DD không
            var regex = /^\d{4}-\d{2}-\d{2}$/;
            if (!regex.test(selectedDate)) {
                alert("Vui lòng chọn ngày tháng hợp lệ (YYYY-MM-DD)!");
                return false;
            }
            if (!regex.test(selectedDate2)) {
                alert("Vui lòng chọn ngày tháng hợp lệ (YYYY-MM-DD)!");
                return false;
            }
            return true;
        }
</script>
</body>
</html>