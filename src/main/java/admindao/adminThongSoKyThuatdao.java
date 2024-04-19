package admindao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.ThongSoKiThuatBean;


public class adminThongSoKyThuatdao {
	public ThongSoKiThuatBean GetThongSo() throws Exception{
		ThongSoKiThuatBean ds = null;
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from ThongSoKiThuat";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			int SoCaLamMin = rs.getInt("SoCaLamMin"); 
			int SoNVMotCaMin = rs.getInt("SoNVMotCaMin");
			int SoNVMotCaMax = rs.getInt("SoNVMotCaMax");
			float HSL = rs.getFloat("HSL");
			float HSLOT = rs.getFloat("HSLOT");;
			float HSLPhat = rs.getFloat("HSLPhat");;
			ds = new ThongSoKiThuatBean(SoCaLamMin, SoNVMotCaMin, SoNVMotCaMax, HSL, HSLOT, HSLPhat);
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
}
