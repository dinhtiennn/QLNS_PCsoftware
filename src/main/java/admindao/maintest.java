package admindao;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.tagext.TryCatchFinally;

public class maintest {
	public static void main(String[] args) {
		try {
			adminDangKyLamdao addkl = new adminDangKyLamdao();
			SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
			Date ngay = dd.parse("2024-04-20");
			addkl.ThemDKL("NV001","LC001", ngay);
			System.out.println("abc");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
