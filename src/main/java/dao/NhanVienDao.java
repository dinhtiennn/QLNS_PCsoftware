package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.NhanVienBean;


public class NhanVienDao {
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
	public void updateNV(NhanVienBean nhanVien) throws Exception{
		ketnoiDB kn = new ketnoiDB();
	    kn.ketnoi();
	    
	    String sql = "UPDATE ThongTinNhanVien SET TenNV=?, MaCV=?, NgaySinh=?, GioiTinh=?, Email=?, SDT=?, DVCT=?, ChucDanh=?,MatKhau=? ,TrangThaiCongViec=?, Anh=?, NgayVaoLam=?, NgayKetThuc=?, SoTaiKhoanNhanVien=? WHERE MaNV=?";
	    
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    
	    cmd.setString(1, nhanVien.getTenNV());
	    cmd.setString(2, nhanVien.getMaCV());
	    cmd.setDate(3, nhanVien.getNgaySinh());
	    cmd.setBoolean(4, nhanVien.getGioiTinh());
	    cmd.setString(5, nhanVien.getEmail());
	    cmd.setString(6, nhanVien.getsDT());
	    cmd.setString(7, nhanVien.getdVCT());
	    cmd.setString(8, nhanVien.getChucDanh());
	    cmd.setString(9, nhanVien.getMatKhau());
	    cmd.setBoolean(10, nhanVien.getTrangThaiCongViec());
	    cmd.setString(11, nhanVien.getAnh());
	    cmd.setDate(12, nhanVien.getNgayVaoLam());
	    cmd.setDate(13, nhanVien.getNgayKetThuc());
	    cmd.setString(14, nhanVien.getSoTaiKhoan());
	    cmd.setString(15, nhanVien.getMaNV());
	   
	    cmd.executeUpdate();
	    
	    kn.cn.close();
	}
}
