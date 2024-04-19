package adminbo;

import java.util.ArrayList;

import admindao.adminThongSoKyThuatdao;
import bean.ThongSoKiThuatBean;

public class adminThongSoKyThuatbo {
	ArrayList<ThongSoKiThuatBean> ds;
	adminThongSoKyThuatdao tsktdao;
	public ArrayList<ThongSoKiThuatBean> GetThongSo() throws Exception{
		ds = tsktdao.GetThongSo();
		return ds;
	}
}
