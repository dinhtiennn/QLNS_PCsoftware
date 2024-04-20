package adminbo;

import java.util.ArrayList;

import admindao.adminDangKyNghiDao;
import bean.DangKyNghiBean;

public class adminDangKyNghiBo {
	adminDangKyNghiDao dkdao = new adminDangKyNghiDao();
	public ArrayList<DangKyNghiBean> GetAllDKN() throws Exception{
		return dkdao.GetAllDKN();
	}
}
