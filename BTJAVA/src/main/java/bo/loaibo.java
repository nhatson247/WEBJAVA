package bo;

import java.util.ArrayList;

import bean.loaibean;
import dao.loaidao;

public class loaibo {
	loaidao ldao = new loaidao();
	ArrayList<loaibean> ds;
	int totalLoaiCount;
	public ArrayList<loaibean> getloai() throws Exception {
		ds  = ldao.getloai();
		return ds;
	}
	
	public ArrayList<loaibean> getLoaiOnPage(int pageNumber, int pageSize) throws Exception {
        int totalGiay = getTotalLoaiCount();

        // Tính toán vị trí bắt đầu của dữ liệu trên trang hiện tại
        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalGiay);

        // Lấy dữ liệu trang hiện tại
        if (startIndex >= endIndex || startIndex < 0) {
            return new ArrayList<loaibean>();
        }
        ds = ldao.getLoaiOnPage(pageNumber, pageSize);
        return ds;
    }

    public int getTotalLoaiCount() throws Exception {
        if (totalLoaiCount == 0) {
        	totalLoaiCount = ldao.getTotalLoaiCount();
        }
        return totalLoaiCount;
    }
    
	public int themloai(String maloai, String tenloai) throws Exception {
		 ArrayList<loaibean> ds = getloai();
		for(loaibean loai: ds) {
			if(loai.getMaloai().equals(maloai))
				return 0;
		}
		return ldao.themloai(maloai, tenloai);
	}
	
	 public ArrayList<loaibean> TimKiemTheoLoai(String key, int pageNumber, int pageSize) throws Exception {
		return ldao.TimKiemTheoLoai(key, pageNumber, pageSize);
	}
	
	 public int TimKiemTheoTenLoaiCount(String key) throws Exception {
		 return ldao.TimKiemTheoTenLoaiCount(key);
	 }
	 
	public String Tim(String maloai) throws Exception {
		for(loaibean loai: ds) 
			if(loai.getMaloai().equals(maloai))
				return loai.getTenloai();
			return null;
	}
	
	public int sualoai(String maloai, String tenloaimoi) throws Exception {
		return ldao.sualoai(maloai, tenloaimoi);
	}
	
	public int xoaloai(String maLoai) throws Exception {
		return ldao.xoaloai(maLoai);
	}
}