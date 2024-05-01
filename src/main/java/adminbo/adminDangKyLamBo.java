package adminbo;

import java.util.ArrayList;
import java.util.Date;

import admindao.adminDangKyLamdao;
import bean.DangKyLamBean;

public class adminDangKyLamBo {
	adminDangKyLamdao addkl = new adminDangKyLamdao();
	public ArrayList<DangKyLamBean> GetAllDKL() throws Exception{
		return addkl.GetAllDKL();
	}
	public ArrayList<DangKyLamBean> getDKLLTK(Date SDate , Date EDate) throws Exception{
		return addkl.getDKLLTK(SDate, EDate);
	}
}
