package bo;

import java.sql.Date;
import java.util.ArrayList;

import bean.NhanVienBean;
import dao.NhanVienDao;


public class NhanVienBo {
	ArrayList<NhanVienBean> ds;
	NhanVienDao nvd = new NhanVienDao();
	public ArrayList<NhanVienBean> getnhanvien() throws Exception{
		ds = nvd.getnhanvien();
		return ds;
	}
	public NhanVienBean getnhanvientheoma(String manv) throws Exception{
		return nvd.getnhanvientheoma(manv);
	}
	public NhanVienBean getNhanVienTheoTKvaMK( String tendangnhap,String matkhau) throws Exception{
		return nvd.getNhanVienTheoTKvaMK(tendangnhap,matkhau);
	}
	public void updateNV(NhanVienBean nhanvien) throws Exception{
		nvd.updateNV(nhanvien);
	}
}
