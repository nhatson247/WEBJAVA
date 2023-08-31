package bo;

import java.util.ArrayList;

import bean.giaybean;
import dao.chitietgiaydao;

public class chitietgiaybo {
	chitietgiaydao ctdao = new chitietgiaydao();
	public giaybean timgiay(String magiay) throws Exception{
		return ctdao.timgiay(magiay);
	}
	 public ArrayList<giaybean> timloai(String maloai) throws Exception {
		  return ctdao.timloai(maloai);
	  }
	 public void tangLuotXem(String magiay) throws Exception {
		 ctdao.tangLuotXem(magiay);
	    }
	 public ArrayList<giaybean> getGiayByLuotXem(int limit) throws Exception {
		 return ctdao.getGiayByLuotXem(limit);
	 }
	 
}
