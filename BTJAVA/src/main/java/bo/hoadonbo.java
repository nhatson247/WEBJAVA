package bo;

import bean.hoadonbean;
import dao.hoadondao;

public class hoadonbo {
	hoadondao hddao = new hoadondao();
	public int themHD(long makh) throws Exception{
		 return hddao.themHD(makh);
	}
	public long MaxHD() throws Exception{
		return hddao.MaxHD();
	}
	public hoadonbean timHD(long mahd) throws Exception{
		 return hddao.timHD(mahd);
	}
}
