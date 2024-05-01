package admincontroller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminbo.adminDangKyLamBo;
import admindao.adminDangKyLamdao;

/**
 * Servlet implementation class adminDangKyLamController
 */
@WebServlet("/adminDangKyLamController")
public class adminDangKyLamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDangKyLamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session= request.getSession();
			adminDangKyLamBo  addklbo = new adminDangKyLamBo();
			request.setAttribute("BangDangKyLam", addklbo.GetAllDKL());
			String StartDate = request.getParameter("selectedDate");
			String EndDate = request.getParameter("selectedDate2");
			if(StartDate != null && EndDate != null) {	
				SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
				Date S = dd.parse(StartDate);
				Date E = dd.parse(EndDate);
				request.setAttribute("BangDangKyLam", addklbo.getDKLLTK(S,E));
			}
			RequestDispatcher rd = request.getRequestDispatcher("ADMINdangkylam.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
