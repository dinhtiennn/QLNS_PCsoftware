package bo;

import java.util.ArrayList;

import bean.DangKyNghiBean;
import dao.DangKyNghidao;

public class DangKyNghibo {
	DangKyNghidao dknghidao = new DangKyNghidao();
	public ArrayList<DangKyNghiBean> GetAllDKN() throws Exception{
		return dknghidao.GetAllDKN();
	}
	public void insertDKN(DangKyNghiBean dkn) throws Exception {
		dknghidao.insertDKN(dkn);
	}
}
