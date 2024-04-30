package controller;

import java.io.IOException;
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
import bo.DangKyLamBo;
import bo.DangKyNghibo;
import bo.NhanVienBo;

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
			}else if(action.equals("showmonthlyschedule")) {
				showMonthlySchedule(request, response);
			}else if(action.equals("xemdsdangkinghi")){
				xemdsdangkinghi(request, response);
			}else if(action.equals("showemployeesworkingtogether")){
				showEmployeesWorkingTogether(request, response);
			}else if(action.equals("duyetlichnghi")) {
				duyetlichnghi(request, response);	
			}else if(action.equals("danhsachnhanvien")) {
				danhsachnhanvien(request, response);
			}else if(action.equals("themnhanvien")) {
				themnhanvien(request, response);
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
		HttpSession session = request.getSession();
		DangKyLamBo dklbo= new DangKyLamBo();
		NhanVienBean nv = (NhanVienBean)session.getAttribute("nhanvien");
		String url = "";
		LocalDate lcdate = LocalDate.now();
		if(nv != null) {
			url = "QUANLYlichthang.jsp";
			try {
				ArrayList<DangKyLamBean> ds = dklbo.GetDKLamByNhanVienAndMonth(nv.getMaNV(), lcdate.getMonthValue());
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
			dbo.DuyetLichNghi(duyet, nguoiduyet, ngaydk, manv);
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
}
