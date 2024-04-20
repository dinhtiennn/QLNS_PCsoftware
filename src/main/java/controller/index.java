package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.NhanVienBean;

import bo.NhanVienBo;


/**
 * Servlet implementation class index
 */
@WebServlet("/index")
public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public index() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String tendangnhap = request.getParameter("tendangnhap");
		String matkhau = request.getParameter("matkhau");
		NhanVienBo nvbo = new NhanVienBo();
		String url = "";
		
		try {
			NhanVienBean nv = null;
			if(tendangnhap!=null && matkhau != null) {
				nv = nvbo.getNhanVienTheoTKvaMK(tendangnhap, matkhau);
				if(nv != null ){
					System.out.println(nv.toString());
					String maCV = nv.getMaCV();
					if(maCV.equals("CV001")) {
						url = "adminIndex";
					}
					else {
						url = "NewFile.jsp";
					}		
					session.setAttribute("nhanvien", nv);
				}
			}else {
					url = "login.jsp";
					request.setAttribute("baoloilogin", "Sai tên đăng nhập hoặc mật khẩu!");
					request.setAttribute("tendangnhap", tendangnhap);
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
