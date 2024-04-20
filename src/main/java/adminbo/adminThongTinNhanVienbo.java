package adminbo;

import admindao.adminThongTinNhanViendao;
import bean.NhanVienBean;

public class adminThongTinNhanVienbo {
	adminThongTinNhanViendao adnvdao = new adminThongTinNhanViendao();
	public NhanVienBean ktdn (String TenDangNhap, String MatKhau)throws Exception{
		return adnvdao.ktdn(TenDangNhap, MatKhau);
	}
}
