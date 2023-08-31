package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai() throws Exception{
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		//B1 ket noi vao csdl 
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2 tao cau lenh sql 
		String sql ="select * from loai";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//b4: thuc hien cau lenh 
		ResultSet rs  = cmd.executeQuery();
		while(rs.next()){
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			ds.add(new loaibean(maloai,tenloai));
		}
		 rs.close();kn.cn.close();
		return ds;
	}
	public ArrayList<loaibean> getLoaiOnPage(int pageNumber, int pageSize) throws Exception {
	    ArrayList<loaibean> ds = new ArrayList<loaibean>();
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
	    
	    // Tính toán vị trí bắt đầu của dữ liệu trên trang hiện tại
	    int startIndex = (pageNumber - 1) * pageSize;
	    
	    // Tạo câu lệnh SQL để lấy dữ liệu trang hiện tại với phân trang
	    String sql = "SELECT * FROM loai ORDER BY maloai OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    // Đặt tham số cho câu lệnh SQL
	    cmd.setInt(1, startIndex);
	    cmd.setInt(2, pageSize);
	    
	    // Thực hiện câu lệnh SQL
	    ResultSet rs = cmd.executeQuery();
	    while (rs.next()) {
	        String maloai = rs.getString("maloai");
	        String tenloai = rs.getString("tenloai");
			ds.add(new loaibean(maloai, tenloai));
	    }
	    rs.close();
	    cmd.close();
	    kn.cn.close();
	    return ds;
	}


    public int getTotalLoaiCount() throws Exception {
        int totalGiay = 0;
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();

        String sql = "SELECT COUNT(*) AS total FROM loai";
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
    
    public ArrayList<loaibean> TimKiemTheoLoai(String key, int pageNumber, int pageSize) throws Exception {
        ArrayList<loaibean> ds = new ArrayList<loaibean>();
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();
        
        // Tính toán vị trí bắt đầu của dữ liệu trên trang hiện tại
        int startIndex = (pageNumber - 1) * pageSize;
        
        // Tạo câu lệnh SQL với điều kiện tìm kiếm theo mã loại hoặc tên loại và phân trang
        String sql = "SELECT * FROM loai WHERE maloai LIKE ? OR tenloai LIKE ? ORDER BY maloai OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        
        cmd.setString(1, "%" + key + "%");
        cmd.setString(2, "%" + key + "%");
        cmd.setInt(3, startIndex);
        cmd.setInt(4, pageSize);
        
        ResultSet rs = cmd.executeQuery();
        while (rs.next()) {
            String maloai = rs.getString("maloai");
            String tenloai = rs.getString("tenloai");
            ds.add(new loaibean(maloai, tenloai));
        }
        rs.close();
        cmd.close();
        kn.cn.close();
        return ds;
    }
    
    public int TimKiemTheoTenLoaiCount(String key) throws Exception {
        int count = 0;
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();
        
        String sql = "SELECT COUNT(*) AS total FROM loai WHERE maloai LIKE ? OR tenloai LIKE ?";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        
        cmd.setString(1, "%" + key + "%");
        cmd.setString(2, "%" + key + "%");
        
        ResultSet rs = cmd.executeQuery();
        if (rs.next()) {
            count = rs.getInt("total");
        }
        
        rs.close();
        cmd.close();
        kn.cn.close();
        
        return count;
    }

	
	public int themloai(String maloai, String tenloai) throws Exception {
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
	    String sql = "INSERT INTO loai (maloai, tenloai) VALUES (?, ?)";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, maloai);
	    cmd.setString(2, tenloai);
	    int kq = cmd.executeUpdate();
	    cmd.close();
	    kn.cn.close();
	    return kq;
	}
	
	public int sualoai(String maloai, String tenloaimoi) throws Exception {
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
	    String sql = "UPDATE loai SET tenloai = ? WHERE maloai = ?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, tenloaimoi);
	    cmd.setString(2, maloai);
	    int kq = cmd.executeUpdate();
	    cmd.close();
	    kn.cn.close();
	    return kq;
	}
	
	public int xoaloai(String maloai) throws Exception {
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
	    String sql = "DELETE FROM loai WHERE maloai = ?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, maloai);
	    int kq = cmd.executeUpdate();
	    cmd.close();
	    kn.cn.close();
	    return kq;
	}

}