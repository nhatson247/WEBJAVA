package bean;

public class giaysizebean {
	private long id;
    private String magiay;
    private String masize;
	public giaysizebean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public giaysizebean(long id, String magiay, String masize) {
		super();
		this.id = id;
		this.magiay = magiay;
		this.masize = masize;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getMagiay() {
		return magiay;
	}
	public void setMagiay(String magiay) {
		this.magiay = magiay;
	}
	public String getMasize() {
		return masize;
	}
	public void setMasize(String masize) {
		this.masize = masize;
	}
	

}
