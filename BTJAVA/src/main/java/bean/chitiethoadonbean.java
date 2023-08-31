package bean;

public class chitiethoadonbean {
	 private long MaChiTietHD;
	 private String Masach;
	 private int SoLuongMua;
	 private long MaHoaDon;
	 private boolean damua;
	public chitiethoadonbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public chitiethoadonbean(long maChiTietHD, String masach, int soLuongMua, long maHoaDon, boolean damua) {
		super();
		MaChiTietHD = maChiTietHD;
		Masach = masach;
		SoLuongMua = soLuongMua;
		MaHoaDon = maHoaDon;
		this.damua = damua;
	}
	public long getMaChiTietHD() {
		return MaChiTietHD;
	}
	public void setMaChiTietHD(long maChiTietHD) {
		MaChiTietHD = maChiTietHD;
	}
	public String getMasach() {
		return Masach;
	}
	public void setMasach(String masach) {
		Masach = masach;
	}
	public int getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(int soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public long getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(long maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	 
}
