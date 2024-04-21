package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DangKyLamBean;
import bean.NhanVienBean;
import bo.DangKyLamBo;
import bo.NhanVienBo;

/**
 * Servlet implementation class nhanviencontroller
 */
@WebServlet("/nhanvien")
public class NhanVienController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NhanVienController() {
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
		if(action != null) {
			if(action.equals("index")) {
				index(request, response);
			}else if(action.equals("showmonthlyschedule")) {
				showMonthlySchedule(request, response);
			}else if(action.equals("workregistration")){
				workRegistration(request, response);
			}else if(action.equals("showemployeesworkingtogether")){
				showEmployeesWorkingTogether(request, response);
			}
//				else if(action.equals("loginbylink")){
//				loginbylink(request, response);
//			}else if(action.equals("index")){
//				index(request, response);
//			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		HttpSession session = request.getSession();
		DangKyLamBo dklbo= new DangKyLamBo();
		NhanVienBean nv = (NhanVienBean)session.getAttribute("nhanvien");
		String url = "";
		if(nv != null) {
			url = "NHANVIENview.jsp";
			try {
				ArrayList<DangKyLamBean> ds = dklbo.GetDKLamByNhanVien(nv.getMaNV());
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
			url = "NHANVIENLichthang.jsp";
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
	public void workRegistration(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "login";
		String btnAction = request.getParameter("submitBtn");
		String[] caSang = request.getParameterValues("casang");
		String[] caChieu = request.getParameterValues("cachieu");
		String[] caToi = request.getParameterValues("catoi");
		DangKyLamBo dklbo = new DangKyLamBo();
		HttpSession session = request.getSession();
		if((NhanVienBean)session.getAttribute("nhanvien")!=null) {
			NhanVienBean nv = (NhanVienBean)session.getAttribute("nhanvien");
			try {
				url = "NHANVIENDangkylam.jsp";
				if(caSang != null || caChieu != null || caToi != null) {		
					if(btnAction.equals("regis")) {
						if (caSang != null) {
				    		for (String ngay : caSang) {
				    			dklbo.insertDK(nv.getMaNV(),"LC001", Date.valueOf(ngay));
				    		}
				    	}
				    	if (caToi != null) {
				    		for (String ngay : caChieu) {
				    			dklbo.insertDK(nv.getMaNV(),"LC002", Date.valueOf(ngay));
				    		}
				    	}
				    	if (caToi != null) {
				    		for (String ngay : caToi) {
				    			dklbo.insertDK(nv.getMaNV(),"LC003", Date.valueOf(ngay));
				    		}
				    	}
				    	request.setAttribute("msgSuccess", "Đăng kí thành công!");
					}else if(btnAction.equals("changeregis")) {
						dklbo.deleteDK(nv.getMaNV());
						if (caSang != null) {
				    		for (String ngay : caSang) {
				    			dklbo.insertDK(nv.getMaNV(),"LC001", Date.valueOf(ngay));
				    		}
				    	}
				    	if (caToi != null) {
				    		for (String ngay : caChieu) {
				    			dklbo.insertDK(nv.getMaNV(),"LC002", Date.valueOf(ngay));
				    		}
				    	}
				    	if (caToi != null) {
				    		for (String ngay : caToi) {
				    			dklbo.insertDK(nv.getMaNV(),"LC003", Date.valueOf(ngay));
				    		}
				    	}
				    	request.setAttribute("msgSuccess", "Chỉnh sửa thành công!");
					}
				}
				request.setAttribute("dsdk", dklbo.GetDKLamByNhanVienNextWeek(nv.getMaNV()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}System.out.println(url);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	public void showEmployeesWorkingTogether(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "NHANVIENDSLamcungca.jsp";
		String date = request.getParameter("date");
		String loaica = request.getParameter("lc");
		request.setAttribute("date", date);
		request.setAttribute("loaica", loaica);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
