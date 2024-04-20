package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import admindao.ketnoiDB;
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
			String GioiTinh = rs.getString("GioiTinh");
			String Email = rs.getString("Email");
			String SDT = rs.getString("SDT");
			String DVCT = rs.getString("DVCT");
			String ChucDanh = rs.getString("ChucDanh");
			String TenDangNhap = rs.getString("TenDangNhap");
			String MatKhau = rs.getString("MatKhau");
			Boolean TrangThai = rs.getBoolean("TrangThaiCongViec");
			ds.add( new NhanVienBean(MaNV, TenNV, MaCV, NgaySinh, TrangThai, Email, SDT, DVCT, ChucDanh, TenDangNhap, MatKhau, TrangThai));
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
			String GioiTinh = rs.getString("GioiTinh");
			String Email = rs.getString("Email");
			String SDT = rs.getString("SDT");
			String DVCT = rs.getString("DVCT");
			String ChucDanh = rs.getString("ChucDanh");
			String TenDangNhap = rs.getString("TenDangNhap");
			String MatKhau = rs.getString("MatKhau");
			Boolean TrangThai = rs.getBoolean("TrangThaiCongViec");
			nvb =  new NhanVienBean(MaNV, TenNV, MaCV, NgaySinh, TrangThai, Email, SDT, DVCT, ChucDanh, TenDangNhap, MatKhau, TrangThai);
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
			String GioiTinh = rs.getString("GioiTinh");
			String Email = rs.getString("Email");
			String SDT = rs.getString("SDT");
			String DVCT = rs.getString("DVCT");
			String ChucDanh = rs.getString("ChucDanh");
			String TenDangNhap = rs.getString("TenDangNhap");
			String MatKhau = rs.getString("MatKhau");
			Boolean TrangThai = rs.getBoolean("TrangThaiCongViec");
			nvb =  new NhanVienBean(MaNV, TenNV, MaCV, NgaySinh, TrangThai, Email, SDT, DVCT, ChucDanh, TenDangNhap, MatKhau, TrangThai);
		}
		rs.close();
		kn.cn.close();
		
		return nvb;
	}
}
