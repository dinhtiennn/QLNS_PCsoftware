package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.DangKyLamBean;
import bean.NhanVienBean;

public class DangKyLichLamdao {
	public ArrayList<DangKyLamBean> GetAllDKL() throws Exception{
		ArrayList<DangKyLamBean> ds = new ArrayList<DangKyLamBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from DangKyLichLam";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long MaDKLam = rs.getLong("MaDKLam");
			String MaNV = rs.getString("MaNV");
			String MaLoaiCa = rs.getString("MaLoaiCa");
			Date Duyet = rs.getDate("NgayDK");
			ds.add(new DangKyLamBean(MaDKLam, MaNV, MaLoaiCa, Duyet));
		}
		kn.cn.close();
		rs.close();
		return ds;
	}
	public ArrayList<DangKyLamBean> GetAllNVLamCungCa(java.sql.Date ngayDK, String maLC) throws Exception{
		ArrayList<DangKyLamBean> ds = new ArrayList<DangKyLamBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "SELECT * FROM DangKyLichLam WHERE NgayDK=? and MaLoaiCa = ?;";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setDate(1, ngayDK);
		cmd.setString(2, maLC);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long MaDKLam = rs.getLong("MaDKLam");
			String MaNV = rs.getString("MaNV");
			String MaLoaiCa = rs.getString("MaLoaiCa");
			Date Duyet = rs.getDate("NgayDK");
			ds.add(new DangKyLamBean(MaDKLam, MaNV, MaLoaiCa, Duyet));
		}
		kn.cn.close();
		rs.close();
		return ds;
	}
	public ArrayList<DangKyLamBean> GetDKLamByNhanVien(String idnv) throws Exception{
		ArrayList<DangKyLamBean> ds = new ArrayList<DangKyLamBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from DangKyLichLam where MaNV = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, idnv);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long MaDKLam = rs.getLong("MaDKLam");
			String MaNV = rs.getString("MaNV");
			String MaLoaiCa = rs.getString("MaLoaiCa");
			Date Duyet = rs.getDate("NgayDK");
			ds.add(new DangKyLamBean(MaDKLam, MaNV, MaLoaiCa, Duyet));
		}
		kn.cn.close();
		rs.close();
		return ds;
	}
	public ArrayList<DangKyLamBean> GetDKLamByNhanVienAndMonth(String idnv, int month) throws Exception{
		ArrayList<DangKyLamBean> ds = new ArrayList<DangKyLamBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "SELECT * FROM DangKyLichLam WHERE MaNV = ? and MONTH(NgayDK) = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, idnv);
		cmd.setInt(2, month);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long MaDKLam = rs.getLong("MaDKLam");
			String MaNV = rs.getString("MaNV");
			String MaLoaiCa = rs.getString("MaLoaiCa");
			Date Duyet = rs.getDate("NgayDK");
			ds.add(new DangKyLamBean(MaDKLam, MaNV, MaLoaiCa, Duyet));
		}
		kn.cn.close();
		rs.close();
		return ds;
	}
	public ArrayList<DangKyLamBean> GetDKLamByNhanVienNextWeek(java.sql.Date beginDate, java.sql.Date endDate,String idnv) throws Exception{
		ArrayList<DangKyLamBean> ds = new ArrayList<DangKyLamBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "SELECT * \r\n"
				+ "FROM DangKyLichLam \r\n"
				+ "WHERE NgayDK BETWEEN ? AND ? and MaNV = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setDate(1, beginDate);
		cmd.setDate(2, endDate);
		cmd.setString(3, idnv);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String MaLoaiCa = rs.getString("MaLoaiCa");
			Date Duyet = rs.getDate("NgayDK");
			ds.add(new DangKyLamBean(MaLoaiCa, Duyet));
		}
		kn.cn.close();
		rs.close();
		return ds;
	}
	public void ThemDKL(String maNV,String maLoaica, Date ngayDK) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="insert into DangKyLichLam(MaNV,MaLoaiCa,NgayDK) values(?,?,?) ";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, maNV);
		cmd.setString(2, maLoaica);
		SimpleDateFormat dd= new SimpleDateFormat("yyyy-MM-dd"); 
		String tam= dd.format(ngayDK);
		Date n2= dd.parse(tam);
		cmd.setDate(3, new java.sql.Date(n2.getTime()));
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	public void XoaDKL(java.sql.Date beginDate, java.sql.Date endDate, String idnv) throws Exception {
	    ketnoiDB kn = new ketnoiDB();
	    kn.ketnoi();
	    String sql = "DELETE FROM DangKyLichLam WHERE NgayDK BETWEEN ? AND ? AND MaNV = ?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setDate(1, beginDate);
	    cmd.setDate(2, endDate);
	    cmd.setString(3, idnv);
	    cmd.executeUpdate();
	    cmd.close();
	    kn.cn.close();
	}

}
