package bean;

public class ThongSoKiThuatBean {
	private int SoCaLamMin; 
	private int SoNVMotCaMin;
	private int SoNVMotCaMax;
	private float HSL;
	private float HSLOT;
	private float HSLPhat;
	public ThongSoKiThuatBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ThongSoKiThuatBean(int soCaLamMin, int soNVMotCaMin, int soNVMotCaMax, float hSL, float hSLOT,
			float hSLPhat) {
		super();
		SoCaLamMin = soCaLamMin;
		SoNVMotCaMin = soNVMotCaMin;
		SoNVMotCaMax = soNVMotCaMax;
		HSL = hSL;
		HSLOT = hSLOT;
		HSLPhat = hSLPhat;
	}
	public int getSoCaLamMin() {
		return SoCaLamMin;
	}
	public void setSoCaLamMin(int soCaLamMin) {
		SoCaLamMin = soCaLamMin;
	}
	public int getSoNVMotCaMin() {
		return SoNVMotCaMin;
	}
	public void setSoNVMotCaMin(int soNVMotCaMin) {
		SoNVMotCaMin = soNVMotCaMin;
	}
	public int getSoNVMotCaMax() {
		return SoNVMotCaMax;
	}
	public void setSoNVMotCaMax(int soNVMotCaMax) {
		SoNVMotCaMax = soNVMotCaMax;
	}
	public float getHSL() {
		return HSL;
	}
	public void setHSL(float hSL) {
		HSL = hSL;
	}
	public float getHSLOT() {
		return HSLOT;
	}
	public void setHSLOT(float hSLOT) {
		HSLOT = hSLOT;
	}
	public float getHSLPhat() {
		return HSLPhat;
	}
	public void setHSLPhat(float hSLPhat) {
		HSLPhat = hSLPhat;
	}
	@Override
	public String toString() {
		return "ThongSoKiThuatBean [SoCaLamMin=" + SoCaLamMin + ", SoNVMotCaMin=" + SoNVMotCaMin + ", SoNVMotCaMax="
				+ SoNVMotCaMax + ", HSL=" + HSL + ", HSLOT=" + HSLOT + ", HSLPhat=" + HSLPhat + "]";
	}
	
}
