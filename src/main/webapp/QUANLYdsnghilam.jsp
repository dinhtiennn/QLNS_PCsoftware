<%@page import="bo.NhanVienBo"%>
<%@page import="bean.NhanVienBean"%>
<%@page import="bean.DangKyNghiBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh Sách Nghỉ Làm</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
		<div class="row">
			<div class="col-2  mt-5" style="margin-top: 8rem !important;">
				<jsp:include page="QUANLYslidebar.jsp"></jsp:include>
			</div>
			<div class="col-6  mt-5" style="margin-top: 8rem !important;">
				<form action="quanly?action=danhsachnghilam" method="post" onsubmit="return validateDate()">
			        <label for="selectedDate">Tìm kiếm từ ngày :</label>
			        <input type="date" id="selectedDate" name="ngayBatDau" required>
			        <label for="selectedDate">đến ngày :</label>
			        <input type="date" id="selectedDate2" name="ngayKetThuc">
			        <input type="submit" value="Tìm Kiếm" class="btn btn-primary">
			    </form>
			    <%
				ArrayList<DangKyNghiBean> ds = ((ArrayList<DangKyNghiBean>)request.getAttribute("ds_dkn")!=null)?(ArrayList<DangKyNghiBean>)request.getAttribute("ds_dkn"):new ArrayList<DangKyNghiBean>();
				NhanVienBo nvbo = new NhanVienBo();
				int i = 1;
				NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");
				%>
				<table class="table">
					<thead>
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">Tên nhân viên</th>
					      <th scope="col">Mã loại ca</th>
					      <th scope="col">Ngày đăng ký</th>
					      <th scope="col">Trạng thái duyệt</th>
					      <th scope="col">Người duyệt</th>
					      <th scope="col">Lý do</th>
					    </tr>
					</thead>
					<tbody>
					<%for(DangKyNghiBean item : ds){%>
						<tr>
					      <th scope="row"><%=i%></th>
					      <td><%=nvbo.getnhanvientheoma(item.getMaNV()).getTenNV()%></td>
					      <td><%=item.getMaLoaiCa()%></td>
					      <td><%=item.getNgayDK()%></td>
					      <%String trangthaiduyet = "";
					      	if(item.getDuyet()==0){
					    	  	trangthaiduyet = "Đang chờ duyêt";
					    	} else if(item.getDuyet()==1){
					    		trangthaiduyet = "Duyệt";
					    	} else if(item.getDuyet()==2){
					    		trangthaiduyet = "Không Duyệt";					    		
					    	} else 
					    		trangthaiduyet = "Vắng";
					      	if(item.getDuyet()==0){%> 		
					      <td><%=trangthaiduyet%>
					      <a href="quanly?action=duyetlichnghi&duyet=1&nguoiduyet=<%=nhanvien.getTenNV()%>&ngaydk=<%=item.getNgayDK()%>&manv=<%=item.getMaNV()%>">
							<button type="button" class="btn btn-warning">Duyệt</button>
						  </a>
						  <a href="quanly?action=duyetlichnghi&duyet=2<%%>&nguoiduyet=<%=nhanvien.getTenNV()%>&ngaydk=<%=item.getNgayDK()%>&manv=<%=item.getMaNV()%>">
							<button type="button" class="btn btn-warning">Không Duyệt</button>
						  </a>
					      </td>
					      <td>Chưa có người duyệt</td>
					      <td><%=item.getLyDo()%></td>
					      <%}if(item.getDuyet()!=0){%>
					      <td><%=trangthaiduyet %></td>
					      <td><%=item.getNguoiDuyet()%></td>
					      <td><%=item.getLyDo()%></td>
					      <%}%>
					    </tr>
					  <%i++;}%>
					</tbody>
				</table>
			</div>
		</div>
		<script>
        // Hàm này được sử dụng để kiểm tra định dạng của ngày tháng
        function validateDate() {
            var selectedDate = document.getElementById("selectedDate").value;
            // Kiểm tra xem selectedDate có đúng định dạng ngày tháng YYYY-MM-DD không
            var regex = /^\d{4}-\d{2}-\d{2}$/;
            if (!regex.test(selectedDate)) {
                alert("Vui lòng chọn ngày tháng hợp lệ (YYYY-MM-DD)!");
                return false;
            }
            return true;
        }
	</script>
</body>
</html>