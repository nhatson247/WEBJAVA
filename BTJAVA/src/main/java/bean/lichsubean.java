package bean;

import java.util.Date;

public class lichsubean {
	 private long makh;
	 private String magiay;
	 private String tengiay;
	 private int soluongmua;
	 private long gia;
	 private long thanhtien;
	 private boolean damua;
	 private Date ngaymua;
	 private String mahoadon;
	 private String anh;
	public lichsubean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public lichsubean(long makh, String magiay, String tengiay, int soluongmua, long gia, long thanhtien, boolean damua,
			Date ngaymua, String mahoadon, String anh) {
		super();
		this.makh = makh;
		this.magiay = magiay;
		this.tengiay = tengiay;
		this.soluongmua = soluongmua;
		this.gia = gia;
		this.thanhtien = thanhtien;
		this.damua = damua;
		this.ngaymua = ngaymua;
		this.mahoadon = mahoadon;
		this.anh = anh;
	}
	public long getMakh() {
		return makh;
	}
	public void setMakh(long makh) {
		this.makh = makh;
	}
	public String getMagiay() {
		return magiay;
	}
	public void setMagiay(String magiay) {
		this.magiay = magiay;
	}
	public String getTengiay() {
		return tengiay;
	}
	public void setTengiay(String tengiay) {
		this.tengiay = tengiay;
	}
	public int getSoluongmua() {
		return soluongmua;
	}
	public void setSoluongmua(int soluongmua) {
		this.soluongmua = soluongmua;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	public Date getNgaymua() {
		return ngaymua;
	}
	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}
	public String getMahoadon() {
		return mahoadon;
	}
	public void setMahoadon(String mahoadon) {
		this.mahoadon = mahoadon;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	
	
	
}
