package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.giaybean;


public class giaydao {
	public ArrayList<giaybean> getgiay()throws Exception{
		 ArrayList<giaybean> ds = new  ArrayList<giaybean>();
		 ketnoidao kn = new ketnoidao();
			kn.ketnoi();
			//B2 tao cau lenh sql 
			String sql ="select * from giay";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			//b4: thuc hien cau lenh 
			ResultSet rs  = cmd.executeQuery();
			while(rs.next()){
				String magiay = rs.getString("magiay");
				String tengiay = rs.getString("tengiay");
				int soluong = rs.getInt("soluong");
				long gia = rs.getLong("gia");
				String maloai = rs.getString("maloai");
				String anh = rs.getString("anh");
				String tieude = rs.getString("tieude");
				String size = rs.getString("size"); 
				long soluotxem = rs.getLong("soluotxem");
				ds.add(new giaybean(magiay, tengiay, soluong, gia, maloai, anh, tieude, size, soluotxem));
			}
			 rs.close();kn.cn.close();
		return ds;
	}

	///
	public ArrayList<giaybean> getGiayOnPage(int pageNumber, int pageSize) throws Exception {
	    ArrayList<giaybean> ds = new ArrayList<giaybean>();
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
	    
	    // Tính toán vị trí bắt đầu của dữ liệu trên trang hiện tại
	    int startIndex = (pageNumber - 1) * pageSize;
	    
	    // Tạo câu lệnh SQL để lấy dữ liệu trang hiện tại với phân trang
	    String sql = "SELECT * FROM giay ORDER BY magiay OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    // Đặt tham số cho câu lệnh SQL
	    cmd.setInt(1, startIndex);
	    cmd.setInt(2, pageSize);
	    
	    // Thực hiện câu lệnh SQL
	    ResultSet rs = cmd.executeQuery();
	    while (rs.next()) {
	        String magiay = rs.getString("magiay");
	        String tengiay = rs.getString("tengiay");
	        int soluong = rs.getInt("soluong");
	        long gia = rs.getLong("gia");
	        String maloai = rs.getString("maloai");
	        String anh = rs.getString("anh");
	        String tieude = rs.getString("tieude");
			String size = rs.getString("size"); 
			long soluotxem = rs.getLong("soluotxem");
			ds.add(new giaybean(magiay, tengiay, soluong, gia, maloai, anh, tieude, size, soluotxem));
	    }
	    
	    rs.close();
	    cmd.close();
	    kn.cn.close();
	    return ds;
	}

    public int getTotalGiayCount() throws Exception {
        int totalGiay = 0;
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();

        String sql = "SELECT COUNT(*) AS total FROM giay";
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
    
    public int themGiay(String magiay, String tengiay, String maloai, int soluong, long gia, String anh, String tieude, String size) throws Exception {
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();
        String sql = "INSERT INTO giay (magiay, tengiay, soluong, gia, maloai, anh, tieude, size) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        cmd.setString(1, magiay);
        cmd.setString(2, tengiay);
        cmd.setInt(3, soluong);
        cmd.setLong(4, gia);
        cmd.setString(5, maloai);
        cmd.setString(6, anh);
        cmd.setString(7, tieude);
        cmd.setString(8, size);
        int kq = cmd.executeUpdate();
        cmd.close();
        kn.cn.close();
        return kq;
    }

    public int suaGiay(String magiay, String tengiay, String maloai, int soluong, long gia, String anh, String tieude, String size) throws Exception {
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();
        String sql = "UPDATE giay SET tengiay = ?, soluong = ?, gia = ?, maloai = ?, anh = ?, tieude = ?, size = ? WHERE magiay = ?";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        cmd.setString(1, tengiay);
        cmd.setInt(2, soluong);
        cmd.setLong(3, gia);
        cmd.setString(4, maloai);
        cmd.setString(5, anh);
        cmd.setString(6, tieude);
        cmd.setString(7, size);
        cmd.setString(8, magiay);
        int kq = cmd.executeUpdate();
        cmd.close();
        kn.cn.close();
        return kq;
    }

    public int xoaGiay(String magiay) throws Exception {
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();
        String sql = "DELETE FROM giay WHERE magiay = ?";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        cmd.setString(1, magiay);
        int kq = cmd.executeUpdate();
        cmd.close();
        kn.cn.close();
        return kq;
    }
   
    public ArrayList<giaybean> TimKiemTheoTenVaTieuDe(String key, int pageNumber, int pageSize) throws Exception {
        ArrayList<giaybean> ds = new ArrayList<giaybean>();
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();
        // Tính toán vị trí bắt đầu của dữ liệu trên trang hiện tại
        int startIndex = (pageNumber - 1) * pageSize;
        
        // Tạo câu lệnh SQL với điều kiện tìm kiếm theo tên sách hoặc tiêu đề và phân trang
        String sql = "SELECT * FROM giay WHERE tengiay LIKE ? OR tieude LIKE ?"
                     + " ORDER BY magiay OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        // Đặt tham số cho câu lệnh SQL
        cmd.setString(1, "%" + key + "%");
        cmd.setString(2, "%" + key + "%");
        cmd.setInt(3, startIndex);
        cmd.setInt(4, pageSize);
        // Thực hiện câu lệnh SQL
        ResultSet rs = cmd.executeQuery();
        while (rs.next()) {
        	String magiay = rs.getString("magiay");
            String tengiay = rs.getString("tengiay");
            int soluong = rs.getInt("soluong");
            long gia = rs.getLong("gia");
            String maloai = rs.getString("maloai");
            String anh = rs.getString("anh");
            String tieude = rs.getString("tieude");
			String size = rs.getString("size"); 
			long soluotxem = rs.getLong("soluotxem");
			ds.add(new giaybean(magiay, tengiay, soluong, gia, maloai, anh, tieude, size, soluotxem));
        }
        rs.close();
        cmd.close();
        kn.cn.close();
        return ds;
    }
    
    public ArrayList<giaybean> TimKiemTheoMaLoai(String maLoai, int pageNumber, int pageSize) throws Exception {
        ArrayList<giaybean> ds = new ArrayList<giaybean>();
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();
        
        // Tính toán vị trí bắt đầu của dữ liệu trên trang hiện tại
        int startIndex = (pageNumber - 1) * pageSize;
        
        // Tạo câu lệnh SQL để tìm giày theo mã loại và phân trang
        String sql = "SELECT * FROM giay WHERE maloai LIKE ? ORDER BY magiay OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        // Đặt tham số cho câu lệnh SQL
        cmd.setString(1, "%" + maLoai + "%");
        cmd.setInt(2, startIndex);
        cmd.setInt(3, pageSize);
        // Thực hiện câu lệnh SQL
        ResultSet rs = cmd.executeQuery();
        while (rs.next()) {
            String magiay = rs.getString("magiay");
            String tengiay = rs.getString("tengiay");
            int soluong = rs.getInt("soluong");
            long gia = rs.getLong("gia");
            String maloai = rs.getString("maloai");
            String anh = rs.getString("anh");
            String tieude = rs.getString("tieude");
            String size = rs.getString("size"); 
            long soluotxem = rs.getLong("soluotxem");
            ds.add(new giaybean(magiay, tengiay, soluong, gia, maloai, anh, tieude, size, soluotxem));
        }
        rs.close();
        cmd.close();
        kn.cn.close();
        return ds;
    }

    public ArrayList<giaybean> TimKiemMaSize(String masize, int pageNumber, int pageSize) throws Exception {
        ArrayList<giaybean> ds = new ArrayList<giaybean>();
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();
        
        // Tính toán vị trí bắt đầu của dữ liệu trên trang hiện tại
        int startIndex = (pageNumber - 1) * pageSize;
        
        // Tạo câu lệnh SQL để tìm giày theo mã size và phân trang
        String sql = "SELECT * FROM giay WHERE magiay IN (SELECT magiay FROM giaysize WHERE masize LIKE ?) ORDER BY magiay OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        // Đặt tham số cho câu lệnh SQL
        cmd.setString(1,  masize);
        cmd.setInt(2, startIndex);
        cmd.setInt(3, pageSize);
        // Thực hiện câu lệnh SQL
        ResultSet rs = cmd.executeQuery();
        while (rs.next()) {
        	String magiay = rs.getString("magiay");
            String tengiay = rs.getString("tengiay");
            int soluong = rs.getInt("soluong");
            long gia = rs.getLong("gia");
            String maloai = rs.getString("maloai");
            String anh = rs.getString("anh");
            String tieude = rs.getString("tieude");
            String size = rs.getString("size"); 
            long soluotxem = rs.getLong("soluotxem");
            ds.add(new giaybean(magiay, tengiay, soluong, gia, maloai, anh, tieude, size, soluotxem));
        }
        rs.close();
        cmd.close();
        kn.cn.close();
        return ds;
    }

    public ArrayList<giaybean> TimKiemTheoGiaCao(int pageNumber, int pageSize) throws Exception {
        ArrayList<giaybean> ds = new ArrayList<giaybean>();
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();
        
        // Tính toán vị trí bắt đầu của dữ liệu trên trang hiện tại
        int startIndex = (pageNumber - 1) * pageSize;
        
        String sql = "SELECT * FROM giay ORDER BY gia DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        // Đặt tham số cho câu lệnh SQL
        cmd.setInt(1, startIndex);
        cmd.setInt(2, pageSize);
        // Thực hiện câu lệnh SQL
        ResultSet rs = cmd.executeQuery();
        while (rs.next()) {
        	String magiay = rs.getString("magiay");
            String tengiay = rs.getString("tengiay");
            int soluong = rs.getInt("soluong");
            long gia = rs.getLong("gia");
            String maloai = rs.getString("maloai");
            String anh = rs.getString("anh");
            String tieude = rs.getString("tieude");
            String size = rs.getString("size"); 
            long soluotxem = rs.getLong("soluotxem");
            ds.add(new giaybean(magiay, tengiay, soluong, gia, maloai, anh, tieude, size, soluotxem));
        }
        rs.close();
        cmd.close();
        kn.cn.close();
        return ds;
    }

    public ArrayList<giaybean> TimKiemTheoGiaThap(int pageNumber, int pageSize) throws Exception {
        ArrayList<giaybean> ds = new ArrayList<giaybean>();
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();
        
        // Tính toán vị trí bắt đầu của dữ liệu trên trang hiện tại
        int startIndex = (pageNumber - 1) * pageSize;
        
        String sql = "SELECT * FROM giay ORDER BY gia ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        // Đặt tham số cho câu lệnh SQL
        cmd.setInt(1, startIndex);
        cmd.setInt(2, pageSize);
        // Thực hiện câu lệnh SQL
        ResultSet rs = cmd.executeQuery();
        while (rs.next()) {
        	String magiay = rs.getString("magiay");
            String tengiay = rs.getString("tengiay");
            int soluong = rs.getInt("soluong");
            long gia = rs.getLong("gia");
            String maloai = rs.getString("maloai");
            String anh = rs.getString("anh");
            String tieude = rs.getString("tieude");
            String size = rs.getString("size"); 
            long soluotxem = rs.getLong("soluotxem");
            ds.add(new giaybean(magiay, tengiay, soluong, gia, maloai, anh, tieude, size, soluotxem));
        }
        rs.close();
        cmd.close();
        kn.cn.close();
        return ds;
    }

    public ArrayList<giaybean> TimKiemTheoKhoangGia(double minPrice, double maxPrice, int pageNumber, int pageSize) throws Exception {
        ArrayList<giaybean> ds = new ArrayList<>();
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();
        
        // Tính toán vị trí bắt đầu của dữ liệu trên trang hiện tại
        int startIndex = (pageNumber - 1) * pageSize;
        
        String sql = "SELECT * FROM giay WHERE gia BETWEEN ? AND ? ORDER BY magiay OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        // Đặt tham số cho câu lệnh SQL
        cmd.setDouble(1, minPrice);
        cmd.setDouble(2, maxPrice);
        cmd.setInt(3, startIndex);
        cmd.setInt(4, pageSize);
        // Thực hiện câu lệnh SQL
        ResultSet rs = cmd.executeQuery();
        while (rs.next()) {
        	String magiay = rs.getString("magiay");
            String tengiay = rs.getString("tengiay");
            int soluong = rs.getInt("soluong");
            long gia = rs.getLong("gia");
            String maloai = rs.getString("maloai");
            String anh = rs.getString("anh");
            String tieude = rs.getString("tieude");
            String size = rs.getString("size"); 
            long soluotxem = rs.getLong("soluotxem");
            ds.add(new giaybean(magiay, tengiay, soluong, gia, maloai, anh, tieude, size, soluotxem));
        }
        rs.close();
        cmd.close();
        kn.cn.close();
        return ds;
    }
    
   
    
    public int countProductsByCondition(String sql, Object... params) throws Exception {
        int totalRows = 0;
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();

        PreparedStatement cmd = kn.cn.prepareStatement(sql);

        for (int i = 0; i < params.length; i++) {
            cmd.setObject(i + 1, params[i]);
        }

        ResultSet rs = cmd.executeQuery();
        if (rs.next()) {
            totalRows = rs.getInt("total");
        }

        rs.close();
        cmd.close();
        kn.cn.close();
        return totalRows;
    }
    
    public int TimKiemTheoTenVaTieuDeCount(String key) throws Exception {
        String sql = "SELECT COUNT(*) AS total FROM giay WHERE tengiay LIKE ? OR tieude LIKE ?";
        return countProductsByCondition(sql, "%" + key + "%", "%" + key + "%");
    }

    public int TimKiemTheoMaLoaiCount(String maloai) throws Exception {
        String sql = "SELECT COUNT(*) AS total FROM giay WHERE maloai LIKE ?";
        return countProductsByCondition(sql, "%" + maloai + "%");
    }

    public int TimKiemTheoMaSizeCount(String masize) throws Exception {
        String sql = "SELECT COUNT(*) AS total FROM giay WHERE magiay IN (SELECT magiay FROM giaysize WHERE masize LIKE ?)";
        return countProductsByCondition(sql, "%" + masize + "%");
    }

    public int TimKiemTheoGiaCaoVaThapCount() throws Exception {
        String sql = "SELECT COUNT(*) AS total FROM giay";
        return countProductsByCondition(sql);
    }

    public int TimKiemTheoKhoangGiaCount(double minPrice, double maxPrice) throws Exception {
        String sql = "SELECT COUNT(*) AS total FROM giay WHERE gia BETWEEN ? AND ?";
        return countProductsByCondition(sql, minPrice, maxPrice);
    }
    
}
