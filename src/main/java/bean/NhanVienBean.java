package bean;

import java.util.Date;

public class NhanVienBean {
	private String maNV;
	private String tenNV;
	private String maCV;
	private Date ngaySinh;
	private String gioiTinh;
	private String email;
	private String sDT;
	private String dVCT;
	private String chucDanh;
	private String tenDangNhap;
	private String matKhau;
	private String trangThaiCongViec;
	public NhanVienBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NhanVienBean(String maNV, String tenNV, String maCV, Date ngaySinh, String gioiTinh, String email,
			String sDT, String dVCT, String chucDanh, String tenDangNhap, String matKhau, String trangThaiCongViec) {
		super();
		this.maNV = maNV;
		this.tenNV = tenNV;
		this.maCV = maCV;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.email = email;
		this.sDT = sDT;
		this.dVCT = dVCT;
		this.chucDanh = chucDanh;
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
		this.trangThaiCongViec = trangThaiCongViec;
	}
	public String getMaNV() {
		return maNV;
	}
	public void setMaNV(String maNV) {
		this.maNV = maNV;
	}
	public String getTenNV() {
		return tenNV;
	}
	public void setTenNV(String tenNV) {
		this.tenNV = tenNV;
	}
	public String getMaCV() {
		return maCV;
	}
	public void setMaCV(String maCV) {
		this.maCV = maCV;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getsDT() {
		return sDT;
	}
	public void setsDT(String sDT) {
		this.sDT = sDT;
	}
	public String getdVCT() {
		return dVCT;
	}
	public void setdVCT(String dVCT) {
		this.dVCT = dVCT;
	}
	public String getChucDanh() {
		return chucDanh;
	}
	public void setChucDanh(String chucDanh) {
		this.chucDanh = chucDanh;
	}
	public String getTenDangNhap() {
		return tenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public String getTrangThaiCongViec() {
		return trangThaiCongViec;
	}
	public void setTrangThaiCongViec(String trangThaiCongViec) {
		this.trangThaiCongViec = trangThaiCongViec;
	}
	@Override
	public String toString() {
		return "NhanVienBean [maNV=" + maNV + ", tenNV=" + tenNV + ", maCV=" + maCV + ", ngaySinh=" + ngaySinh
				+ ", gioiTinh=" + gioiTinh + ", email=" + email + ", sDT=" + sDT + ", dVCT=" + dVCT + ", chucDanh="
				+ chucDanh + ", tenDangNhap=" + tenDangNhap + ", matKhau=" + matKhau + ", trangThaiCongViec="
				+ trangThaiCongViec + "]";
	}
	
	
}
