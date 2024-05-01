package admindao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import bean.NhanVienBean;
import dao.ketnoiDB;

public class adminNhanVienDao {
	public ArrayList<NhanVienBean> getnhanvien() throws Exception{
		ArrayList<NhanVienBean> ds = new ArrayList<NhanVienBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from ThongTinNhanVien";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String MaNV = rs.getString("MaNV");
		    String TenNV = rs.getString("TenNV");
			String MaCV = rs.getString("MaCV");
			Date NgaySinh = rs.getDate("NgaySinh");
			Boolean GioiTinh = rs.getBoolean("GioiTinh");
			String Email = rs.getString("Email");
			String SDT = rs.getString("SDT");
			String DVCT = rs.getString("DVCT");
			String ChucDanh = rs.getString("ChucDanh");
			String TenDangNhap = rs.getString("TenDangNhap");
			String MatKhau = rs.getString("MatKhau");
			Boolean TrangThai = rs.getBoolean("TrangThaiCongViec");
			String anh = rs.getString("Anh");
			Date ngayVaoLam = rs.getDate("NgayVaoLam");
			Date ngayKetThuc = rs.getDate("NgayKetThuc");
			String soTaiKhoan = rs.getString("SoTaiKhoanNhanVien");
			ds.add( new NhanVienBean(MaNV, TenNV, MaCV, NgaySinh, GioiTinh, Email, SDT, DVCT, ChucDanh, TenDangNhap, MatKhau, TrangThai, anh, ngayVaoLam, ngayKetThuc, soTaiKhoan));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public void UpdateNhanVien(String maNV, String tenNV, String maCV, Date ngaySinh, Boolean gioiTinh, String email, String sDT, String dVCT, String chucDanh, String tenDangNhap, String matKhau, Boolean trangThaiCongViec, String anh, Date ngayVaoLam, String soTaiKhoan) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="UPDATE ThongTinNhanVien SET TenNV =?, MaCV =?, NgaySinh =?, GioiTinh =?, Email =?, SDT =?, DVCT =?, ChucDanh =?, TenDangNhap =?, MatKhau =?, TrangThaiCongViec =?, Anh =?, NgayVaoLam =?, SoTaiKhoanNhanVien =? where MaNV = ?  ";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, tenNV);
		cmd.setString(2, maCV);
		cmd.setDate(3, ngaySinh);
		cmd.setBoolean(4, gioiTinh);
		cmd.setString(5, email);
		cmd.setString(6, sDT);
		cmd.setString(7, dVCT);
		cmd.setString(8, chucDanh);
		cmd.setString(9, tenDangNhap);
		cmd.setString(10, matKhau);
		cmd.setBoolean(11, trangThaiCongViec);
		cmd.setString(12, anh);
		cmd.setDate(13, ngayVaoLam);
		cmd.setString(14, soTaiKhoan);
		cmd.setString(15, maNV);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	
	public void UpdateNgayKetThuc(String MaNV) throws Exception {
		admindao.ketnoiDB kn= new admindao.ketnoiDB();
		kn.ketnoi();
        String sql = "UPDATE ThongTinNhanVien SET NgayKetThuc = GETDATE() WHERE MaNV = ? AND TrangThaiCongViec = 0"; // Chỉ cập nhật khi trạng thái công việc là true

        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        cmd.setString(1, MaNV); 
        cmd.executeUpdate();

        cmd.close();
        kn.cn.close();
	}
	public NhanVienBean getnhanvientheoma(String manv) throws Exception{
		NhanVienBean nvb = new NhanVienBean();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from ThongTinNhanVien where MaNV = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, manv);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String MaNV = rs.getString("MaNV");
		    String TenNV = rs.getString("TenNV");
			String MaCV = rs.getString("MaCV");
			Date NgaySinh = rs.getDate("NgaySinh");
			Boolean GioiTinh = rs.getBoolean("GioiTinh");
			String Email = rs.getString("Email");
			String SDT = rs.getString("SDT");
			String DVCT = rs.getString("DVCT");
			String ChucDanh = rs.getString("ChucDanh");
			String TenDangNhap = rs.getString("TenDangNhap");
			String MatKhau = rs.getString("MatKhau");
			Boolean TrangThai = rs.getBoolean("TrangThaiCongViec");
			String anh = rs.getString("Anh");
			Date ngayVaoLam = rs.getDate("NgayVaoLam");
			Date ngayKetThuc = rs.getDate("NgayKetThuc");
			String soTaiKhoan = rs.getString("SoTaiKhoanNhanVien");
			nvb =  new NhanVienBean(MaNV, TenNV, MaCV, NgaySinh, GioiTinh, Email, SDT, DVCT, ChucDanh, TenDangNhap, MatKhau, TrangThai, anh, ngayVaoLam, ngayKetThuc, soTaiKhoan);
		}
		rs.close();
		kn.cn.close();
		
		return nvb;
	}
	public ArrayList<NhanVienBean> getnhanvientheoma1(String manv) throws Exception{
		ArrayList<NhanVienBean> ds = new ArrayList<NhanVienBean>();
		NhanVienBean nvb = new NhanVienBean();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from ThongTinNhanVien where MaNV = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, manv);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String MaNV = rs.getString("MaNV");
		    String TenNV = rs.getString("TenNV");
			String MaCV = rs.getString("MaCV");
			Date NgaySinh = rs.getDate("NgaySinh");
			Boolean GioiTinh = rs.getBoolean("GioiTinh");
			String Email = rs.getString("Email");
			String SDT = rs.getString("SDT");
			String DVCT = rs.getString("DVCT");
			String ChucDanh = rs.getString("ChucDanh");
			String TenDangNhap = rs.getString("TenDangNhap");
			String MatKhau = rs.getString("MatKhau");
			Boolean TrangThai = rs.getBoolean("TrangThaiCongViec");
			String anh = rs.getString("Anh");
			Date ngayVaoLam = rs.getDate("NgayVaoLam");
			Date ngayKetThuc = rs.getDate("NgayKetThuc");
			String soTaiKhoan = rs.getString("SoTaiKhoanNhanVien");
			ds.add(new NhanVienBean(MaNV, TenNV, MaCV, NgaySinh, GioiTinh, Email, SDT, DVCT, ChucDanh, TenDangNhap, MatKhau, TrangThai, anh, ngayVaoLam, ngayKetThuc, soTaiKhoan));
		}
		rs.close();
		kn.cn.close();
		
		return ds;
	}
	public NhanVienBean getNhanVienTheoTKvaMK( String tendangnhap,String matkhau) throws Exception{
		NhanVienBean nvb = null;
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from ThongTinNhanVien where TenDangNhap = ? and MatKhau = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tendangnhap);
		cmd.setString(2, matkhau);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String MaNV = rs.getString("MaNV");
		    String TenNV = rs.getString("TenNV");
			String MaCV = rs.getString("MaCV");
			Date NgaySinh = rs.getDate("NgaySinh");
			Boolean GioiTinh = rs.getBoolean("GioiTinh");
			String Email = rs.getString("Email");
			String SDT = rs.getString("SDT");
			String DVCT = rs.getString("DVCT");
			String ChucDanh = rs.getString("ChucDanh");
			String TenDangNhap = rs.getString("TenDangNhap");
			String MatKhau = rs.getString("MatKhau");
			Boolean TrangThai = rs.getBoolean("TrangThaiCongViec");
			String anh = rs.getString("Anh");
			Date ngayVaoLam = rs.getDate("NgayVaoLam");
			Date ngayKetThuc = rs.getDate("NgayKetThuc");
			String soTaiKhoan = rs.getString("SoTaiKhoanNhanVien");
			nvb =  new NhanVienBean(MaNV, TenNV, MaCV, NgaySinh, GioiTinh, Email, SDT, DVCT, ChucDanh, TenDangNhap, MatKhau, TrangThai, anh, ngayVaoLam, ngayKetThuc, soTaiKhoan);
		}
		rs.close();
		kn.cn.close();
		
		return nvb;
	}
}

