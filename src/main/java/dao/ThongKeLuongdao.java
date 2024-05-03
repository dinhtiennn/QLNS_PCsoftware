package dao;

	
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import bean.NhanVienBean;
import bean.ThongKeLuongBean;
import bo.DangKyLamBo;
import bo.DangKyNghibo;
import bo.NhanVienBo;
import bo.ThongSoKyThuatBo;

public class ThongKeLuongdao {
	public ArrayList<ThongKeLuongBean> getTKLTheoThangNam(int thang, int nam) throws Exception{
		ArrayList<ThongKeLuongBean> ds = new ArrayList<ThongKeLuongBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from ThongKeLuong where month(ThangNam)= ? and YEAR(ThangNam) = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, thang);
		cmd.setInt(2, nam);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long MaThongKe = rs.getLong("MaThongKe");
		    String MaNV = rs.getString("MaNV");
			Date ThangNam = rs.getDate("ThangNam");
			int SoCaLam = rs.getInt("SoCaLam");
			int SoCaNghi = rs.getInt("SoCaNghi");
			float Luong = rs.getFloat("Luong");
			ds.add( new ThongKeLuongBean(MaThongKe, MaNV, ThangNam, SoCaLam, SoCaNghi, Luong));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public ArrayList<ThongKeLuongBean> getTKLTamTheoThangNam(int thang, int nam) throws Exception{
		ArrayList<ThongKeLuongBean> ds = new ArrayList<ThongKeLuongBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from dbo.TKeLuongTam(?, ?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, thang);
		cmd.setInt(2, nam);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
		    String MaNV = rs.getString("MaNV");
		    Date ThangNam = rs.getDate("ThangNam");
			int SoCaLam = rs.getInt("TongSoCaLam");
			int SoCaNghi = rs.getInt("TongSoCaNghi");
			ds.add( new ThongKeLuongBean(MaNV, ThangNam, SoCaLam, SoCaNghi));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public void DuyetLuongTheoThangNam(ThongKeLuongBean tlb) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "insert into ThongKeLuong (MaNV, ThangNam, SoCaLam, SoCaNghi, Luong) values (?, ?, ?, ?, ?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tlb.getMaNV());
		SimpleDateFormat dd= new SimpleDateFormat("yyyy-MM-dd");
		String Sdate= dd.format(tlb.getThangNam());	// Doi ngay ra chuoi theo dd
		java.util.Date s = dd.parse(Sdate);
		cmd.setDate(2,new java.sql.Date(s.getTime()));
		cmd.setInt(3, tlb.getSoCaLam());
		cmd.setInt(4, tlb.getSoCaNghi());
		cmd.setFloat(5, tlb.getLuong());
		cmd.executeUpdate();
		kn.cn.close();
	}
}
