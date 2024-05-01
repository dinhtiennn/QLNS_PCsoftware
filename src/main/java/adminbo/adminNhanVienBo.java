package adminbo;

import java.sql.Date;
import java.util.ArrayList;

import admindao.adminNhanVienDao;
import bean.NhanVienBean;

public class adminNhanVienBo {
	ArrayList<NhanVienBean>ds;
	adminNhanVienDao adnvdao = new adminNhanVienDao();
	public ArrayList<NhanVienBean> getnhanvien() throws Exception{
		return adnvdao.getnhanvien();
	}
	public ArrayList<NhanVienBean> getnhanvienTK(String manv) throws Exception{
		return adnvdao.getnhanvienTK(manv);
	}
	public NhanVienBean getnhanvientheoma(String manv) throws Exception{
		return adnvdao.getnhanvientheoma(manv);
	}
	public void UpdateNhanVien(String maNV, String tenNV, String maCV, Date ngaySinh, Boolean gioiTinh, String email, String sDT, String dVCT, String chucDanh, String tenDangNhap, String matKhau, Boolean trangThaiCongViec, String anh, Date ngayVaoLam, String soTaiKhoan) throws Exception{
		adnvdao.UpdateNhanVien(maNV, tenNV, maCV, ngaySinh, gioiTinh, email, sDT, dVCT, chucDanh, tenDangNhap, matKhau, trangThaiCongViec, anh, ngayVaoLam, soTaiKhoan);
	}
	public void UpdateNgayKetThuc(String MaNV) throws Exception {
		adnvdao.UpdateNgayKetThuc(MaNV);
	}
}