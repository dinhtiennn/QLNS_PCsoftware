package admindao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import bean.DangKyNghiBean;

public class adminDangKyNghiDao {
	public ArrayList<DangKyNghiBean> GetAllDKN() throws Exception{
		ArrayList<DangKyNghiBean> ds = new ArrayList<DangKyNghiBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from DangKyLichNghi";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long maDkNghi = rs.getLong("MaDKNghi");
			String maNV = rs.getString("MaNV");
			String maLoaiCa = rs.getString("MaLoaiCa");
			Date ngayDK = rs.getDate("NgayDK");
			int duyet = rs.getInt("Duyet");
			String nguoiDuyet = rs.getString("NguoiDuyet");
			String lyDo = rs.getString("LyDo");
			ds.add(new DangKyNghiBean(maDkNghi, maNV, maLoaiCa, ngayDK, duyet, nguoiDuyet, lyDo));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
}
