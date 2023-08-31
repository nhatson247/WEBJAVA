package bo;

import java.util.ArrayList;

import bean.khachhangbean;
import dao.khachhangdao;

public class khachhangbo {
    khachhangdao khdao = new khachhangdao();
    ArrayList<khachhangbean> ds;
    int totalKHCount; 
    
    public ArrayList<khachhangbean> getKH()throws Exception{
        ds = khdao.getKH();
        return ds;
    }
    public khachhangbean finByMKH(String mkh) throws Exception {
        if (mkh == null || mkh.isEmpty()) {
            return null;
        }
        
        long makh = Long.parseLong(mkh);
        ds = khdao.getKH();
        for (khachhangbean kh : ds) {
            if (kh.getMakh() == makh) {
                return kh;
            }
        }
        return null;
    }

    
    public ArrayList<khachhangbean> getKhachHangOnPage(int pageNumber, int pageSize) throws Exception {
        int totalKH = getTotalKhachHangCount();
        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalKH);
        
        if (startIndex >= endIndex || startIndex < 0) {
            return new ArrayList<khachhangbean>();
        }
        ds = khdao.getKhachHangOnPage(pageNumber, pageSize);
        return ds;
    }

    public int getTotalKhachHangCount() throws Exception {
        if (totalKHCount == 0) {
        	totalKHCount = khdao.getTotalKhachHangCount();
        }
        return totalKHCount;
    }
    

	public int TimKiemKHCount(String key) throws Exception {
        return khdao.TimKiemKHCount(key);
    }
	
	public ArrayList<khachhangbean> TimKiemKH(String key, int pageNumber, int pageSize) throws Exception {
        int totalGiay = khdao.TimKiemKHCount(key);

        // Tính toán vị trí bắt đầu của dữ liệu trên trang hiện tại
        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalGiay);

        // Lấy dữ liệu trang hiện tại
        if (startIndex >= endIndex || startIndex < 0) {
            return new ArrayList<khachhangbean>();
        }
        ds = khdao.TimKiemKH(key, pageNumber, pageSize); 
        return ds;
    }
    public long them(String hoten, String diachi, String sodt, String email, String tendn, String pass) throws Exception {
        return khdao.them(hoten, diachi, sodt, email, tendn, pass);
    }
    
    public int sua(String hoten, String diachi, String sodt, String email, String tendn, String pass) throws Exception {
        return khdao.sua(hoten, diachi, sodt, email, tendn, pass);
    }
    
    public int xoa(long makh) throws Exception {
        return khdao.xoa(makh);
    }
    
    public khachhangbean ktdn(String tendn, String pass) throws Exception {
    	return khdao.ktdn(tendn, pass);
    }
    
    public khachhangbean kttk(String tendn) throws Exception {
        return khdao.kttk(tendn);
    }
    
    public boolean kiemTraTaiKhoanMatKhau(String tendn, String pass) throws Exception {
        return khdao.kiemTraTaiKhoanMatKhau(tendn, pass);
    }
    
    public int doiMatKhau(String tendn, String oldPass, String newPass) throws Exception {
        return khdao.doiMatKhau(tendn, oldPass, newPass);
    }
}
