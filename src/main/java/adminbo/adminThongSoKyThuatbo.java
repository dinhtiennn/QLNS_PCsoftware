package adminbo;

import java.util.ArrayList;

import admindao.adminThongSoKyThuatdao;
import bean.ThongSoKiThuatBean;

public class adminThongSoKyThuatbo {
	ThongSoKiThuatBean ds;
	adminThongSoKyThuatdao tsktdao = new adminThongSoKyThuatdao();
	public ThongSoKiThuatBean GetThongSo() throws Exception{
		ds = tsktdao.GetThongSo();
		return ds;
	}
}
