package adminbo;

import java.util.ArrayList;

import admindao.adminThongKeLuongdao;
import bean.ThongKeLuongBean;

public class adminThongKeLuongbo {
	adminThongKeLuongdao adtkl = new adminThongKeLuongdao();
	public ArrayList<ThongKeLuongBean> getAllThongKeLuong() throws Exception{
		return adtkl.getAllThongKeLuong();
	}
}
