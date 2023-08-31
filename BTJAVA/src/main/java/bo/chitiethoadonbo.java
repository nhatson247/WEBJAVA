package bo;

import java.util.ArrayList;

import bean.adminxacnhanbean;
import dao.chitiethoadondao;

public class chitiethoadonbo {
	chitiethoadondao cthddao = new chitiethoadondao();
	public int themCTHD(String masach, int soLuongMua, long maHoaDon) throws Exception{
		return cthddao.ThemCTHD(masach, soLuongMua, maHoaDon);
	}
	public int sua(long mact) throws Exception {
		return cthddao.sua(mact);
	}
	public ArrayList<adminxacnhanbean> getxacnhan()throws Exception{
		return cthddao.getxacnhan();
	}
	public int xoa(long mact) throws Exception {
		return cthddao.xoa(mact);
	}
	 public int xacnhanHoaDonVaChiTiet(long mahoadon) throws Exception {
		 return cthddao.xacnhanHoaDonVaChiTiet(mahoadon);
	 }
}
