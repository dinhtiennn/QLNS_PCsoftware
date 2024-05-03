package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DangKyLamBean;
import bean.DangKyNghiBean;
import bean.NhanVienBean;
import bean.ThongKeLuongBean;
import bo.DangKyLamBo;
import bo.DangKyNghibo;
import bo.NhanVienBo;
import bo.ThongKeLuongBo;
import bo.ThongSoKyThuatBo;

/**
 * Servlet implementation class Quanlycontroller
 */
@WebServlet("/quanly")
public class QuanLyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanLyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
		if(action != null) {
			if(action.equals("quanlyIndex")) {
				quanlyIndex(request, response);
			}else if(action.equals("showMonthlySchedule")) {
				showMonthlySchedule(request, response);
			}else if(action.equals("xemdsdangkinghi")){
				xemdsdangkinghi(request, response);
			}else if(action.equals("showemployeesworkingtogether")){
				showEmployeesWorkingTogether(request, response);
			}else if(action.equals("duyetlichnghi")) {
				duyetlichnghi(request, response);	
			}else if(action.equals("danhvangkhongphep")) {
				danhvangkhongphep(request, response);	
			}else if(action.equals("danhsachnhanvien")) {
				danhsachnhanvien(request, response);
			}else if(action.equals("themnhanvien")) {
				themnhanvien(request, response);
			}else if(action.equals("thongkeluong")) {
				thongkeluong(request, response);
			}else if(action.equals("danhsachnghilam")) {
				danhsachnghilam(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void quanlyIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		HttpSession session = request.getSession();
		DangKyLamBo dklbo= new DangKyLamBo();
		NhanVienBean nv = (NhanVienBean)session.getAttribute("nhanvien");
		String url = "";
		if(nv != null) {
			url = "QUANLYview.jsp";
			try {
				ArrayList<DangKyLamBean> ds = dklbo.GetAllDKL();
				request.setAttribute("bdk", ds);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			url = "login.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	public void showMonthlySchedule(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYlichthang.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();

			String ngayBatDau = request.getParameter("ngayBatDau");
			String ngayKetThuc = request.getParameter("ngayKetThuc");
			ArrayList<DangKyLamBean> ds_dkl = null;
			DangKyLamBo dklbo = new DangKyLamBo();
			
			System.out.println(ngayBatDau + ngayKetThuc);
			LocalDate date = LocalDate.now();
			String thang = Integer.toString(date.getMonthValue());
			String nam = Integer.toString(date.getYear());
			if(ngayBatDau == null && ngayKetThuc == null) {
				ds_dkl = dklbo.GetDKLbyMonth_Year(Integer.parseInt(thang), Integer.parseInt(nam));
				request.setAttribute("ds_dkn",ds_dkl);
			}else
			if(ngayBatDau != null && ngayKetThuc != null) {
				SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
				Date S = dd.parse(ngayBatDau);
				Date E = dd.parse(ngayKetThuc);
				ds_dkl = dklbo.getDKL_BD_KT(S, E);
				request.setAttribute("ds_dkn",ds_dkl);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void showEmployeesWorkingTogether(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdslamcungca.jsp";
		String date = request.getParameter("date");
		String loaica = request.getParameter("lc");
		request.setAttribute("date", date);
		request.setAttribute("loaica", loaica);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	public void xemdsdangkinghi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdsdangkinghi.jsp";
		System.out.println(url);
		try {
			ArrayList<DangKyNghiBean> ds_dkn = null;
			DangKyNghibo dbo = new DangKyNghibo();
			String date = request.getParameter("date");
			String loaica = request.getParameter("loaica");
			ds_dkn = dbo.getDSDKNtheoNgay(date);
			request.setAttribute("ds_dkn",ds_dkn);
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void duyetlichnghi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdsdangkinghi.jsp";
		System.out.println(url);
		try {
			ArrayList<DangKyNghiBean> ds_dkn = null;
			DangKyNghibo dbo = new DangKyNghibo();
			String duyet = request.getParameter("duyet");
			String nguoiduyet = request.getParameter("nguoiduyet");
			String ngaydk = request.getParameter("ngaydk");
			String manv = request.getParameter("manv");
			String maloaica = request.getParameter("maloaica");
			if(duyet.equals("1")) {
				dbo.DuyetLichNghi(duyet, nguoiduyet, ngaydk, manv);
				dbo.XoaLichLam(manv, maloaica, ngaydk);
			}
			if(duyet.equals("2")) {
				dbo.DuyetLichNghi(duyet, nguoiduyet, ngaydk, manv);				
			}
			ds_dkn = dbo.getDSDKNtheoNgay(ngaydk);
			request.setAttribute("ds_dkn",ds_dkn);
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void danhvangkhongphep(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdsdangkinghi.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			ArrayList<DangKyNghiBean> ds_dkn = null;
			DangKyNghibo dbo = new DangKyNghibo();
			
			String maloaica = request.getParameter("maloaica");
			String nguoiduyet = request.getParameter("nguoiduyet");
			String ngaydk = request.getParameter("ngaydk");
			String manv = request.getParameter("manv");	
			dbo.DanhVangKhongPhep(manv, maloaica, ngaydk, nguoiduyet);
			dbo.XoaLichLam(manv, maloaica, ngaydk);
			dbo.XoaLichNghi(manv, maloaica, ngaydk);
			ds_dkn = dbo.getDSDKNtheoNgay(ngaydk);
			request.setAttribute("ds_dkn",ds_dkn);
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void danhsachnhanvien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdsnhanvien.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			ArrayList<NhanVienBean> ds_nv = null;
			NhanVienBo nvbo = new NhanVienBo();
			
			String manv = request.getParameter("manv");
			String ttcv = request.getParameter("ttcv");
			nvbo.UpdateTTCV(manv, ttcv);
			ds_nv = nvbo.getnhanvien();
			request.setAttribute("ds_nv", ds_nv);
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void themnhanvien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdsnhanvien.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			ArrayList<NhanVienBean> ds_nv = null;
			NhanVienBo nvbo = new NhanVienBo();
			
			String tennv = request.getParameter("tennv");
			String ngaysinh = request.getParameter("ngaysinh");
			String gioitinh = request.getParameter("gioitinh");
			String email = request.getParameter("email");
			String sdt = request.getParameter("sdt");
			String tendn = request.getParameter("tendn");
			String mk = request.getParameter("mk");
			String anh = request.getParameter("anh");
			String stk = request.getParameter("stk");
			
			nvbo.ThemNhanVien_QL(tennv, java.sql.Date.valueOf(ngaysinh), Boolean.parseBoolean(gioitinh), email, sdt, tendn, stk, anh, anh);
			ds_nv = nvbo.getnhanvien();
			request.setAttribute("ds_nv", ds_nv);
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void thongkeluong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYthongkeluong.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");
			DangKyNghibo dknbo = new DangKyNghibo();
			DangKyLamBo dklbo = new DangKyLamBo();
			NhanVienBo nvbo = new NhanVienBo();
			ThongKeLuongBo tkbo = new ThongKeLuongBo();
			
			ArrayList<NhanVienBean> nvbean = nvbo.getnhanvien();
			ArrayList<ThongKeLuongBean> tkl = new ArrayList<ThongKeLuongBean>();
			String thang = request.getParameter("thang");
			String nam = request.getParameter("nam");
			ThongSoKyThuatBo tsktbo = new ThongSoKyThuatBo();
			if(thang == null && nam == null) {				
				LocalDate date = LocalDate.now();
				thang = Integer.toString(date.getMonthValue());
				nam = Integer.toString(date.getYear());
			}
				//Nếu tkl.size!=0 ->k có nút duyệt
				tkl = tkbo.getTKLTheoThangNam(Integer.parseInt(thang), Integer.parseInt(nam));
				if(tkl.size()==0) {
					tkl = tkbo.getTKLTamTheoThangNam(Integer.parseInt(thang), Integer.parseInt(nam));
					
					System.out.println(tkl);
					for (ThongKeLuongBean thongKeLuongBean : tkl) {
						thongKeLuongBean.setLuong(tkbo.TinhLuong(tsktbo.GetThongSo(),thongKeLuongBean.getSoCaLam(), thongKeLuongBean.getSoCaNghi()));
					}
					request.setAttribute("thang", thang);
					request.setAttribute("nam", nam);
					request.setAttribute("tkl", tkl);
					request.setAttribute("msg", "Danh sách tạm tính:");
				}else {
					request.setAttribute("thang", thang);
					request.setAttribute("nam", nam);
					request.setAttribute("tkl", tkl);
				}	

			System.out.println(tkl);
			if(request.getParameter("duyet") != null) {
				for (ThongKeLuongBean thongKeLuongBean : tkl) {
					tkbo.DuyetLuongTheoThangNam(thongKeLuongBean);
				}
			}
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void danhsachnghilam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdsnghilam.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();

			String ngayBatDau = request.getParameter("ngayBatDau");
			String ngayKetThuc = request.getParameter("ngayKetThuc");
			ArrayList<DangKyNghiBean> ds_dkn = null;
			DangKyNghibo dbo = new DangKyNghibo();
			
			if(ngayBatDau != null && ngayKetThuc == null) {
				ds_dkn = dbo.getDSDKNtheoNgay(ngayBatDau);
				request.setAttribute("ds_dkn",ds_dkn);
			}else
			if(ngayBatDau != null && ngayKetThuc != null) {
				ds_dkn = dbo.getDS_DKLN_BDKT(ngayBatDau, ngayKetThuc);
				request.setAttribute("ds_dkn",ds_dkn);
			}
			
			System.out.println(ngayBatDau + ngayKetThuc);
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
