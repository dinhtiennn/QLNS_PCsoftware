package bo;

import java.sql.Date;
import java.util.ArrayList;

import bean.DangKyNghiBean;
import dao.DangKyNghidao;

public class DangKyNghiBo {
	DangKyNghidao dknghidao = new DangKyNghidao();
	public ArrayList<DangKyNghiBean> GetAllDKN() throws Exception{
		return dknghidao.GetAllDKN();
	}
	public void insertDKN(DangKyNghiBean dkn) throws Exception {
		dknghidao.insertDKN(dkn);
	}
}
