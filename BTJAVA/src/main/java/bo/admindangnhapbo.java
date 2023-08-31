package bo;

import bean.admindangnhapbean;
import dao.admindangnhapdao;


public class admindangnhapbo {
	admindangnhapdao admindndao = new admindangnhapdao();
	public admindangnhapbean ktdn(String tendn, String pass) throws Exception{
		return 	admindndao.ktdn(tendn, pass);
	}
	public admindangnhapbean kttk(String tendn) throws Exception{
		return admindndao.kttk(tendn);
	}
	public int doiMatKhau(String tendn, String oldPass, String newPass) throws Exception {
		return admindndao.doiMatKhau(tendn, oldPass, newPass);
	}
	public boolean kiemTraTaiKhoanMatKhau(String tendn, String pass) throws Exception {
		return admindndao.kiemTraTaiKhoanMatKhau(tendn, pass);
	}
}
