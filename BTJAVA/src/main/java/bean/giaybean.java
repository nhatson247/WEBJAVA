package bean;

public class giaybean {
	private String magiay;
	private String tengiay;
	private int soluong;
	private long gia;
	private String maloai;
	private String anh;
	private String tieude;
	private long thanhtien;
	private String size;
	private long soluotxem;
	public giaybean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public giaybean(String magiay, String tengiay, int soluong, long gia, String maloai, String anh, String tieude,
			 String size, long soluotxem) {
		super();
		this.magiay = magiay;
		this.tengiay = tengiay;
		this.soluong = soluong;
		this.gia = gia;
		this.maloai = maloai;
		this.anh = anh;
		this.tieude = tieude;
		this.thanhtien = gia*soluong;
		this.size = size;
		this.soluotxem = soluotxem;
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
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public String getTieude() {
		return tieude;
	}
	public void setTieude(String tieude) {
		this.tieude = tieude;
	}
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public long getSoluotxem() {
		return soluotxem;
	}
	public void setSoluotxem(long soluotxem) {
		this.soluotxem = soluotxem;
	}
	
	
}
