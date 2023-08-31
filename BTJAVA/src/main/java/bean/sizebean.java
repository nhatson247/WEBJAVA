package bean;

public class sizebean {
    private String masize;
    private String tensize;
	public sizebean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public sizebean(String masize, String tensize) {
		super();
		this.masize = masize;
		this.tensize = tensize;
	}
	public String getMasize() {
		return masize;
	}
	public void setMasize(String masize) {
		this.masize = masize;
	}
	public String getTensize() {
		return tensize;
	}
	public void setTensize(String tensize) {
		this.tensize = tensize;
	}
    
}
