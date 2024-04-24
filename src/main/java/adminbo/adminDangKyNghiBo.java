package adminbo;

import java.util.ArrayList;

import admindao.adminDangKyNghiDao;
import bean.DangKyNghiBean;
import bean.VDangKyNghiBean;

public class adminDangKyNghiBo {
	adminDangKyNghiDao dkdao = new adminDangKyNghiDao();
	public ArrayList<VDangKyNghiBean> GetAllDKN() throws Exception{
		return dkdao.GetAllDKN();
	}
}
