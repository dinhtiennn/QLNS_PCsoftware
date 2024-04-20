package adminbo;

import java.util.ArrayList;

import admindao.adminNhanVienDao;
import bean.NhanVienBean;

public class adminNhanVienBo {
	ArrayList<NhanVienBean>ds;
	adminNhanVienDao adnvdao = new adminNhanVienDao();
	public ArrayList<NhanVienBean> getnhanvien() throws Exception{
		return adnvdao.getnhanvien();
	}
}
