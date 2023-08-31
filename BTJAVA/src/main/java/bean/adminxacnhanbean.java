package bean;

import java.util.Date;

public class adminxacnhanbean {
	private long MaChiTietHD;
	private String hoten;
	private String tengiay;
	private String size;
	private long gia;
	private long SoLuongMua;
	private long thanhtien;
	private Date ngaymua;
	private boolean damua;

	public adminxacnhanbean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public adminxacnhanbean(long maChiTietHD, String hoten, String tengiay, String size, long gia, long soLuongMua,
			long thanhtien, Date ngaymua, boolean damua) {
		super();
		MaChiTietHD = maChiTietHD;
		this.hoten = hoten;
		this.tengiay = tengiay;
		this.size = size;
		this.gia = gia;
		SoLuongMua = soLuongMua;
		this.thanhtien = thanhtien;
		this.ngaymua = ngaymua;
		this.damua = damua;
	}

	public long getMaChiTietHD() {
		return MaChiTietHD;
	}

	public void setMaChiTietHD(long maChiTietHD) {
		MaChiTietHD = maChiTietHD;
	}

	public String getHoten() {
		return hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public String getTengiay() {
		return tengiay;
	}

	public void setTengiay(String tengiay) {
		this.tengiay = tengiay;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public long getGia() {
		return gia;
	}

	public void setGia(long gia) {
		this.gia = gia;
	}

	public long getSoLuongMua() {
		return SoLuongMua;
	}

	public void setSoLuongMua(long soLuongMua) {
		SoLuongMua = soLuongMua;
	}

	public long getThanhtien() {
		return thanhtien;
	}

	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}

	public Date getNgaymua() {
		return ngaymua;
	}

	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}

	public boolean isDamua() {
		return damua;
	}

	public void setDamua(boolean damua) {
		this.damua = damua;
	}

	
}
