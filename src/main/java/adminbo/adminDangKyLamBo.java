package adminbo;

import java.util.ArrayList;

import admindao.adminDangKyLamdao;
import bean.DangKyLamBean;

public class adminDangKyLamBo {
	adminDangKyLamdao addkl = new adminDangKyLamdao();
	public ArrayList<DangKyLamBean> GetAllDKL() throws Exception{
		return addkl.GetAllDKL();
	}
}
