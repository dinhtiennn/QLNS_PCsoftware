package bo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.ThongKeLuongBean;
import bean.ThongSoKiThuatBean;
import dao.ThongKeLuongdao;
import dao.ketnoiDB;

public class ThongKeLuongBo {
	ThongKeLuongdao tkdao = new ThongKeLuongdao();
	public float TinhLuong(ThongSoKiThuatBean tkb,int SoCaLam, int SoCaNghiKhongPhep) throws Exception{
		int SoCaLamMin = tkb.getSoCaLamMin();
		long Luong1ca = tkb.getLuong();
		float HSL = tkb.getHSL();
		float HSLOT = tkb.getHSLOT();
		
//		ThongSoKyThuatBo tskt = new ThongSoKyThuatBo();
//		int SoCaLamMin = tskt.GetThongSo().getSoCaLamMin();
//		long Luong1ca = tskt.GetThongSo().getLuong();
//		float HSL = tskt.GetThongSo().getHSL();
//		float HSLOT = tskt.GetThongSo().getHSLOT();
		float luong = 0;
		if(SoCaNghiKhongPhep == 0) {
			if(SoCaLam == SoCaLamMin) {
				luong = SoCaLam*HSL*Luong1ca;
			}else if(SoCaLam > SoCaLamMin) {
				luong = SoCaLam*HSL*Luong1ca + (SoCaLam - SoCaLamMin)*HSLOT*Luong1ca;
			}else{
				float SoCaLamThieu = SoCaLam - SoCaLamMin;
				float n = (SoCaLamThieu/SoCaLamMin)*100;
				if(n <= 10) {
					luong = (float)(SoCaLam*Luong1ca*(HSL-0.1f));
				}else if(n <= 20) {
					luong = (float)(SoCaLam*Luong1ca*(HSL-0.2f));
				}else if(n <= 30) {
					luong = (float)(SoCaLam*Luong1ca*(HSL-0.5f));
				}
			}			
		}else {
			if(SoCaLam == SoCaLamMin) {
				luong = SoCaLam*HSL*Luong1ca - SoCaNghiKhongPhep*200000;
			}else if(SoCaLam > SoCaLamMin) {
				luong = SoCaLam*HSL*Luong1ca + (SoCaLam - SoCaLamMin)*HSLOT*Luong1ca - SoCaNghiKhongPhep*200000;
			}else{
				float SoCaLamThieu = SoCaLam - SoCaLamMin;
				float n = (SoCaLamThieu/SoCaLamMin)*100;
				if(n <= 10) {
					luong = (float)(SoCaLam*Luong1ca*(HSL-0.1f) - SoCaNghiKhongPhep*200000);
				}else if(n <= 20) {
					luong = (float)(SoCaLam*Luong1ca*(HSL-0.2f) - SoCaNghiKhongPhep*200000);
				}else if(n <= 30) {
					luong = (float)(SoCaLam*Luong1ca*(HSL-0.5f) - SoCaNghiKhongPhep*200000);
				}
			}
		}
		return luong;
	}
	public ArrayList<ThongKeLuongBean> getTKLTheoThangNam(int thang, int nam) throws Exception{
		return tkdao.getTKLTheoThangNam(thang, nam);
	}
	public void DuyetLuongTheoThangNam(ThongKeLuongBean tlb) throws Exception{
		tkdao.DuyetLuongTheoThangNam(tlb);
	}
	public ArrayList<ThongKeLuongBean> getTKLTamTheoThangNam(int thang, int nam) throws Exception{
		return tkdao.getTKLTamTheoThangNam(thang, nam);
	}
}
