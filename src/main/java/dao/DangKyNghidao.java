package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.DangKyNghiBean;


public class DangKyNghidao {
	public ArrayList<DangKyNghiBean> GetAllDKN() throws Exception{
		ArrayList<DangKyNghiBean> ds = new ArrayList<DangKyNghiBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from DangKyLichNghi";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long maDangkyNghi = rs.getLong("MaDKNghi");
			String maNV = rs.getString("MaNV");
			String maLoaiCa = rs.getString("MaLoaiCa");
			Date ngayDK = rs.getDate("NgayDK");
			int duyet = rs.getInt("Duyet");
			String nguoiDuyet = rs.getString("NguoiDuyet");
			String lyDo = rs.getString("LyDo");
			ds.add(new DangKyNghiBean(maDangkyNghi, maNV, maLoaiCa, ngayDK, duyet, nguoiDuyet, lyDo));
		}
		kn.cn.close();
		rs.close();
		return ds;
	}
	public void insertDKN(DangKyNghiBean dkn) throws Exception {
	    ketnoiDB kn = new ketnoiDB();
	    kn.ketnoi();
	    String sql = "INSERT INTO DangKyLichNghi (MaNV, MaLoaiCa, NgayDK, Duyet, NguoiDuyet, LyDo) VALUES (?, ?, ?, ?, ?, ?)";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, dkn.getMaNV());
	    cmd.setString(2, dkn.getMaLoaiCa());
	    cmd.setDate(3, new java.sql.Date(dkn.getNgayDK().getTime()));
	    cmd.setInt(4, dkn.getDuyet());
	    cmd.setString(5, dkn.getNguoiDuyet());
	    cmd.setString(6, dkn.getLyDo());
	    cmd.executeUpdate();
	    kn.cn.close();
	}

}
