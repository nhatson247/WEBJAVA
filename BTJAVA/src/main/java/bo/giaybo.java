package bo;

import java.util.ArrayList;
import bean.giaybean;
import dao.giaydao;

public class giaybo {
    giaydao gdao = new giaydao();
    ArrayList<giaybean> ds;
    int totalGiayCount; // Tổng số lượng giày trong cơ sở dữ liệu

    public ArrayList<giaybean> getgiay() throws Exception {
        ds = gdao.getgiay();
        return ds;
    }
    
    public giaybean finByMG(String magiay) throws Exception {
        for (giaybean s : ds) {
            if (s.getMagiay().equals(magiay)) {
                return s;
            }
        }
        return null;
    }
    
    public ArrayList<giaybean> getGiayOnPage(int pageNumber, int pageSize) throws Exception {
        int totalGiay = getTotalGiayCount();
        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalGiay);
        
        if (startIndex >= endIndex || startIndex < 0) {
            return new ArrayList<giaybean>();
        }
        ds = gdao.getGiayOnPage(pageNumber, pageSize);
        return ds;
    }

    public int getTotalGiayCount() throws Exception {
        if (totalGiayCount == 0) {
            totalGiayCount = gdao.getTotalGiayCount();
        }
        return totalGiayCount;
    }
    ///
    public int themGiay(String magiay, String tengiay, String maloai, int soluong, long gia, String anh, String tieude, String size) throws Exception {
    	return gdao.themGiay(magiay, tengiay, maloai, soluong, gia, anh, tieude, size);
    }
    
    public int suaGiay(String magiay, String tengiay, String maloai, int soluong, long gia, String anh, String tieude, String size) throws Exception {
    	return gdao.suaGiay(magiay, tengiay, maloai, soluong, gia, anh, tieude, size);
    }
    
    public int xoaGiay(String magiay) throws Exception {
    	return gdao.xoaGiay(magiay);
    }
    ///
    public int TimKiemTheoTenVaTieuDeCount(String key) throws Exception {
        return gdao.TimKiemTheoTenVaTieuDeCount(key);
    }
    public ArrayList<giaybean> TimKiemTheoTenVaTieuDe(String key, int pageNumber, int pageSize) throws Exception {
        int totalGiay = gdao.TimKiemTheoTenVaTieuDeCount(key); 

        // Tính toán vị trí bắt đầu của dữ liệu trên trang hiện tại
        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalGiay);

        // Lấy dữ liệu trang hiện tại
        if (startIndex >= endIndex || startIndex < 0) {
            return new ArrayList<giaybean>();
        }
        ds = gdao.TimKiemTheoTenVaTieuDe(key, pageNumber, pageSize); 
        return ds;
    }
    
    ///
    public int TimKiemTheoMaLoaiCount(String maloai) throws Exception {
    	return gdao.TimKiemTheoMaLoaiCount(maloai);
    }
    public ArrayList<giaybean> TimKiemTheoMaLoai(String maLoai, int pageNumber, int pageSize) throws Exception {
        int totalGiay = gdao.TimKiemTheoMaLoaiCount(maLoai);

        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalGiay);

        if (startIndex >= endIndex || startIndex < 0) {
            return new ArrayList<giaybean>();
        }
        ds = gdao.TimKiemTheoMaLoai(maLoai, pageNumber, pageSize);
        return ds;
    }

    ///
    public int TimKiemTheoMaSizeCount(String masize) throws Exception {
    	return gdao.TimKiemTheoMaSizeCount(masize);
    }
    public ArrayList<giaybean> TimKiemMaSize(String masize, int pageNumber, int pageSize) throws Exception {
        int totalGiay = gdao.TimKiemTheoMaSizeCount(masize);

        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalGiay);

        if (startIndex >= endIndex || startIndex < 0) {
            return new ArrayList<giaybean>();
        }
        ds = gdao.TimKiemMaSize(masize, pageNumber, pageSize);
        return ds;
    }
    
    ///
    public int TimKiemTheoGiaCaoVaThapCount() throws Exception {
    	return gdao.TimKiemTheoGiaCaoVaThapCount();
    }
    public ArrayList<giaybean> TimKiemTheoGiaCao(int pageNumber, int pageSize) throws Exception {
        int totalGiay = getTotalGiayCount();

        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalGiay);

        if (startIndex >= endIndex || startIndex < 0) {
            return new ArrayList<giaybean>();
        }
        ds = gdao.TimKiemTheoGiaCao(pageNumber, pageSize);
        return ds;
    }
    public ArrayList<giaybean> TimKiemTheoGiaThap(int pageNumber, int pageSize) throws Exception {
        int totalGiay = getTotalGiayCount();

        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalGiay);

        if (startIndex >= endIndex || startIndex < 0) {
            return new ArrayList<giaybean>();
        }
        ds = gdao.TimKiemTheoGiaThap(pageNumber, pageSize);
        return ds;
    }
    
    ///
    public int TimKiemTheoKhoangGiaCount(double minPrice, double maxPrice) throws Exception {
    	return gdao.TimKiemTheoKhoangGiaCount(minPrice, maxPrice);
    }
    public ArrayList<giaybean> TimKiemTheoKhoangGia(double minPrice, double maxPrice, int pageNumber, int pageSize) throws Exception {
        int totalGiay = getTotalGiayCount();

        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalGiay);

        if (startIndex >= endIndex || startIndex < 0) {
            return new ArrayList<giaybean>();
        }
        ds = gdao.TimKiemTheoKhoangGia(minPrice, maxPrice, pageNumber, pageSize);
        return ds;
    }
}
