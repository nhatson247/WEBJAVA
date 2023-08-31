package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import bean.lichsubean;

public class lichsuhangdao {
	
	public ArrayList<lichsubean> getlsu(long makh)throws Exception{
		 ArrayList<lichsubean> ds = new  ArrayList<lichsubean>();
		 ketnoidao kn = new ketnoidao();
			kn.ketnoi();
			//B2 tao cau lenh sql 
			String sql ="select * from VLichSuMuaHang where makh=? order by NgayMua desc";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setLong(1, makh);
			//b4: thuc hien cau lenh 
			ResultSet rs  = cmd.executeQuery();
			while(rs.next()){
				/* long makh = rs.getLong("makh"); */
				String magiay = rs.getString("magiay");
				String tengiay = rs.getString("tengiay");
				int soluongmua = rs.getInt("soluongmua");
				long gia = rs.getLong("gia");
				long thanhtien = rs.getLong("thanhtien");
				boolean damua = rs.getBoolean("damua");
				Date ngaymua = rs.getDate("ngaymua");
				String mahoadon = rs.getString("mahoadon");
				String anh = rs.getString("anh");
				ds.add(new lichsubean(makh, magiay, tengiay, soluongmua, gia, thanhtien, damua, ngaymua, mahoadon, anh));
			}
			 rs.close();kn.cn.close();
		return ds;
	}
	
	
	public ArrayList<lichsubean> getLSOnPage(int pageNumber, int pageSize) throws Exception {
	    ArrayList<lichsubean> ds = new ArrayList<lichsubean>();
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
	    
	    // Tính toán vị trí bắt đầu của dữ liệu trên trang hiện tại
	    int startIndex = (pageNumber - 1) * pageSize;
	    
	    // Tạo câu lệnh SQL để lấy dữ liệu trang hiện tại với phân trang
	    String sql = "SELECT * FROM VLichSuMuaHang ORDER BY magiay OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    // Đặt tham số cho câu lệnh SQL
	    cmd.setInt(1, startIndex);
	    cmd.setInt(2, pageSize);
	    
	    // Thực hiện câu lệnh SQL
	    ResultSet rs = cmd.executeQuery();
	    while (rs.next()) {
	    	long makhResult = rs.getLong("makh");
	        String magiay = rs.getString("magiay");
	        String tengiay = rs.getString("tengiay");
	        int soluongmua = rs.getInt("soluongmua");
	        long gia = rs.getLong("gia");
	        long thanhtien = rs.getLong("thanhtien");
	        boolean damua = rs.getBoolean("damua");
	        Date ngaymua = rs.getDate("ngaymua");
	        String mahoadon = rs.getString("mahoadon");
	        String anh = rs.getString("anh");
	        ds.add(new lichsubean(makhResult, magiay, tengiay, soluongmua, gia, thanhtien, damua, ngaymua, mahoadon, anh));
	    }
	    
	    rs.close();
	    cmd.close();
	    kn.cn.close();
	    return ds;
	}

    public int getTotalLSCount() throws Exception {
        int totalGiay = 0;
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();

        String sql = "SELECT COUNT(*) AS total FROM VLichSuMuaHang";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();

        if (rs.next()) {
            totalGiay = rs.getInt("total");
        }

        rs.close();
        cmd.close();
        kn.cn.close();
        return totalGiay;
    }
   
	public ArrayList<lichsubean> TimKiemLichSu(long makh, String key,int pageNumber, int pageSize) throws Exception {
	    ArrayList<lichsubean> ds = new ArrayList<lichsubean>();
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
	    // Tính toán vị trí bắt đầu của dữ liệu trên trang hiện tại
        int startIndex = (pageNumber - 1) * pageSize;
	    // Tạo câu lệnh SQL với điều kiện tìm kiếm theo mã hóa đơn hoặc tên giày
	    String sql = "SELECT * FROM VLichSuMuaHang WHERE makh = ? AND (CONVERT(NVARCHAR(50), mahoadon) = ? OR tengiay LIKE ?)"
	    		+ "ORDER BY NgayMua DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	    
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    // Đặt tham số cho câu lệnh SQL
	    cmd.setLong(1, makh);
	    cmd.setString(2, key);
	    cmd.setString(3, "%" + key + "%");
	    cmd.setInt(4, startIndex);
        cmd.setInt(5, pageSize);
	    // Thực hiện câu lệnh SQL
	    ResultSet rs = cmd.executeQuery();
	    while (rs.next()) {
	        /* long makh = rs.getLong("makh"); */
	        String magiay = rs.getString("magiay");
	        String tengiayResult = rs.getString("tengiay");
	        int soluongmua = rs.getInt("soluongmua");
	        long gia = rs.getLong("gia");
	        long thanhtien = rs.getLong("thanhtien");
	        boolean damua = rs.getBoolean("damua");
	        Date ngaymua = rs.getDate("ngaymua");
	        String mahoadonResult = rs.getString("mahoadon");
	        String anh = rs.getString("anh");
	        ds.add(new lichsubean(makh, magiay, tengiayResult, soluongmua, gia, thanhtien, damua, ngaymua, mahoadonResult, anh));
	    }
	    rs.close();
	    cmd.close();
	    kn.cn.close();
	    return ds;
	}
	
	public int getTotalLichSuMuaHangCount(long makh) throws Exception {
	    int totalCount = 0;
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();

	    String sql = "SELECT COUNT(*) AS total FROM VLichSuMuaHang WHERE makh = ?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setLong(1, makh);

	    ResultSet rs = cmd.executeQuery();
	    if (rs.next()) {
	        totalCount = rs.getInt("total");
	    }

	    rs.close();
	    cmd.close();
	    kn.cn.close();
	    return totalCount;
	}

	// xoa hóa đơn
	public void xoahoadonchuatt(long makh, int daysAgo) throws Exception {
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
	    
	    LocalDate expirationDate = LocalDate.now().minusDays(daysAgo);
	    
	    String sql = "DELETE FROM hoadon WHERE damua = 0 AND makh = ? AND ngaymua < ?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setLong(1, makh);
	    cmd.setDate(2, java.sql.Date.valueOf(expirationDate));
	    
	    cmd.executeUpdate();
	    
	    kn.cn.close();
	}
	
	public ArrayList<lichsubean> gettopmua(int limit) throws Exception {
	    ArrayList<lichsubean> ds = new ArrayList<lichsubean>();
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();

	    // Sử dụng truy vấn SQL để lấy các sản phẩm có số lượng mua cao nhất
	    String sql = "SELECT TOP (?) * FROM VLichSuMuaHang WHERE DAMUA = 1 ORDER BY soluongmua DESC";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setLong(1, limit);

	    ResultSet rs = cmd.executeQuery();
	    while (rs.next()) {
	        long makhResult = rs.getLong("makh");
	        String magiay = rs.getString("magiay");
	        String tengiay = rs.getString("tengiay");
	        int soluongmua = rs.getInt("soluongmua");
	        long gia = rs.getLong("gia");
	        long thanhtien = rs.getLong("thanhtien");
	        boolean damua = rs.getBoolean("damua");
	        Date ngaymua = rs.getDate("ngaymua");
	        String mahoadon = rs.getString("mahoadon");
	        String anh = rs.getString("anh");
	        ds.add(new lichsubean(makhResult, magiay, tengiay, soluongmua, gia, thanhtien, damua, ngaymua, mahoadon, anh));
	    }
	    rs.close();
	    cmd.close();
	    kn.cn.close();
	    return ds;
	}
	

}
