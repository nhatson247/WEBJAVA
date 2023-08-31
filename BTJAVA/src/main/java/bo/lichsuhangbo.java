package bo;

import java.util.ArrayList;

import bean.lichsubean;
import dao.lichsuhangdao;

public class lichsuhangbo {
	 lichsuhangdao lshdao = new lichsuhangdao();
	    ArrayList<lichsubean> ds;
	    int totalGiayCount; // Tổng số lượng giày trong cơ sở dữ liệu
	public ArrayList<lichsubean> getlsu(long makh)throws Exception{
		return lshdao.getlsu(makh);
	}
	 public ArrayList<lichsubean> getLSOnPage(int pageNumber, int pageSize) throws Exception {
	        int totalGiay = getTotalGiayCount();
	        int startIndex = (pageNumber - 1) * pageSize;
	        int endIndex = Math.min(startIndex + pageSize, totalGiay);
	        
	        if (startIndex >= endIndex || startIndex < 0) {
	            return new ArrayList<lichsubean>();
	        }
	        ds = lshdao.getLSOnPage(pageNumber, pageSize);
	        return ds;
	    }

	    public int getTotalGiayCount() throws Exception {
	        if (totalGiayCount == 0) {
	            totalGiayCount = lshdao.getTotalLSCount();
	        }
	        return totalGiayCount;
	    }
	    
	    public int getTotalLichSuMuaHangCount(long makh) throws Exception {
	    	return getTotalLichSuMuaHangCount(makh);
	    }
	    
	public ArrayList<lichsubean> TimKiemLichSu(long makh, String key,int pageNumber, int pageSize) throws Exception {
	    	return lshdao.TimKiemLichSu(makh, key, pageNumber, pageSize);
	}
	public void xoahoadonchuatt(long makh, int daysAgo) throws Exception {
        lshdao.xoahoadonchuatt(makh, daysAgo);
    }
	public ArrayList<lichsubean> gettopmua(int limit) throws Exception {
		return lshdao.gettopmua(limit);
	}
}
