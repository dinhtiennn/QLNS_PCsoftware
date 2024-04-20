package bo;

import java.sql.Date;
import java.util.ArrayList;

import bean.DangKyLamBean;
import dao.DangKyLichLamdao;

public class DangKyLamBo {
	DangKyLichLamdao dklam = new DangKyLichLamdao();
	public ArrayList<DangKyLamBean> GetDKLamByNhanVien(String idnv) throws Exception{
		return dklam.GetDKLamByNhanVien(idnv);
	}
	public ArrayList<DangKyLamBean> GetAllNVLamCungCa(Date ngayDK, String maLC) throws Exception{
		return dklam.GetAllNVLamCungCa(ngayDK,maLC);
	}
	public ArrayList<DangKyLamBean> GetDKLamByNhanVienAndMonth(String idnv, int month) throws Exception{
		return dklam.GetDKLamByNhanVienAndMonth(idnv,month);
	}
	public void insertDK(String idnv,String maloaica,Date date) throws Exception{
		dklam.ThemDKL(idnv,maloaica,date);
	}
//	public static void main(String[] args) {
//		DangKyLamBo dkbo = new DangKyLamBo();
//		try {
//			System.out.println(dkbo.GetAllNVLamCungCa(Date.valueOf("2024-04-19"),"LC001"));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
}
