package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.khachhangbean;

public class khachhangdao {
	public ArrayList<khachhangbean> getKH()throws Exception{
		 ArrayList<khachhangbean> ds = new  ArrayList<khachhangbean>();
		 ketnoidao kn = new ketnoidao();
			kn.ketnoi();
			//B2 tao cau lenh sql 
			String sql ="select * from khachhang";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			//b4: thuc hien cau lenh 
			ResultSet rs  = cmd.executeQuery();
			while(rs.next()){
				long makh = rs.getLong("makh");
				String hoten = rs.getString("hoten");
				String diachi = rs.getString("diachi");
				String sodt = rs.getString("sodt");
				String email = rs.getString("email");
				ds.add(new khachhangbean(makh, hoten, diachi, sodt, email, hoten, email));
			}
			 rs.close();kn.cn.close();
		return ds;
	}
	
	public long them(String hoten, String diachi, String sodt, String email, String tendn, String pass) throws Exception{
		ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
		String sql = "INSERT INTO khachhang(hoten, diachi, sodt, email, tendn, pass) VALUES (?, ?, ?, ?, ?, ?)";
		PreparedStatement cmd=  kn.cn.prepareStatement(sql);
		cmd.setString(1, hoten);
        cmd.setString(2, diachi);
        cmd.setString(3, sodt);
        cmd.setString(4, email);
        cmd.setString(5, tendn);
        cmd.setString(6, pass);
        long kq = cmd.executeUpdate(); 
		cmd.close(); kn.cn.close(); 
		return kq;
	}
	
	 public int sua(String hoten, String diachi, String sodt, String email, String tendn, String pass) throws Exception {
	        ketnoidao kn = new ketnoidao();
	        kn.ketnoi();
	        String sql = "UPDATE khachhang SET hoten=?, diachi=?, sodt=?, email=?, pass=? WHERE tendn=?";
	        PreparedStatement cmd = kn.cn.prepareStatement(sql);
	        cmd.setString(1, hoten);
	        cmd.setString(2, diachi);
	        cmd.setString(3, sodt);
	        cmd.setString(4, email);
	        cmd.setString(5, pass);
	        cmd.setString(6, tendn);
	        int kq = cmd.executeUpdate();
	        cmd.close();
	        kn.cn.close();
	        return kq;
	    }

	    public int xoa(long makh) throws Exception {
	        ketnoidao kn = new ketnoidao();
	        kn.ketnoi();
	        String sql = "DELETE FROM khachhang WHERE makh=?";
	        PreparedStatement cmd = kn.cn.prepareStatement(sql);
	        cmd.setLong(1, makh);
	        int kq = cmd.executeUpdate();
	        cmd.close();
	        kn.cn.close();
	        return kq;
	    }
	    
	    public ArrayList<khachhangbean> getKhachHangOnPage(int pageNumber, int pageSize) throws Exception {
	        ArrayList<khachhangbean> ds = new ArrayList<khachhangbean>();
	        ketnoidao kn = new ketnoidao();
	        kn.ketnoi();
	        
	        int startIndex = (pageNumber - 1) * pageSize;
	        
	        String sql = "SELECT * FROM khachhang ORDER BY makh OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	        PreparedStatement cmd = kn.cn.prepareStatement(sql);
	        cmd.setInt(1, startIndex);
	        cmd.setInt(2, pageSize);
	        
	        ResultSet rs = cmd.executeQuery();
	        while (rs.next()) {
	            long makh = rs.getLong("makh");
	            String hoten = rs.getString("hoten");
	            String diachi = rs.getString("diachi");
	            String sodt = rs.getString("sodt");
	            String email = rs.getString("email");
	            String tendn = rs.getString("tendn");
	            String pass = rs.getString("pass");
	            khachhangbean kh = new khachhangbean(makh, hoten, diachi, sodt, email, tendn, pass);
	            ds.add(kh);
	        }
	        
	        rs.close();
	        cmd.close();
	        kn.cn.close();
	        return ds;
	    }

	    public int getTotalKhachHangCount() throws Exception {
	        int totalKhachHang = 0;
	        ketnoidao kn = new ketnoidao();
	        kn.ketnoi();

	        String sql = "SELECT COUNT(*) AS total FROM khachhang";
	        PreparedStatement cmd = kn.cn.prepareStatement(sql);
	        ResultSet rs = cmd.executeQuery();

	        if (rs.next()) {
	            totalKhachHang = rs.getInt("total");
	        }

	        rs.close();
	        cmd.close();
	        kn.cn.close();
	        return totalKhachHang;
	    }
	
	public ArrayList<khachhangbean> TimKiemKH(String key, int pageNumber, int pageSize) throws Exception {
	    ArrayList<khachhangbean> ds = new ArrayList<>();
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();

	    int startIndex = (pageNumber - 1) * pageSize;

	    String sql = "SELECT * FROM khachhang WHERE hoten LIKE ? OR diachi LIKE ? OR sodt LIKE ? OR email LIKE ? "
	                 + "ORDER BY makh OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, "%" + key + "%");
	    cmd.setString(2, "%" + key + "%");
	    cmd.setString(3, "%" + key + "%");
	    cmd.setString(4, "%" + key + "%");
	    cmd.setInt(5, startIndex);
	    cmd.setInt(6, pageSize);

	    ResultSet rs = cmd.executeQuery();
	    while (rs.next()) {
	        long makh = rs.getLong("makh");
	        String hoten = rs.getString("hoten");
	        String diachi = rs.getString("diachi");
	        String sodt = rs.getString("sodt");
	        String email = rs.getString("email");
	        ds.add(new khachhangbean(makh, hoten, diachi, sodt, email, hoten, email));
	    }

	    rs.close();
	    cmd.close();
	    kn.cn.close();
	    return ds;
	}

	public int TimKiemKHCount(String key) throws Exception {
	    int totalKhachHang = 0;
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();

	    String sql = "SELECT COUNT(*) AS total FROM khachhang WHERE hoten LIKE ? OR diachi LIKE ? OR sodt LIKE ? OR email LIKE ?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, "%" + key + "%");
	    cmd.setString(2, "%" + key + "%");
	    cmd.setString(3, "%" + key + "%");
	    cmd.setString(4, "%" + key + "%");

	    ResultSet rs = cmd.executeQuery();

	    if (rs.next()) {
	        totalKhachHang = rs.getInt("total");
	    }

	    rs.close();
	    cmd.close();
	    kn.cn.close();
	    return totalKhachHang;
	}

	
	public khachhangbean ktdn(String tendn, String pass) throws Exception{
		//B1 ket noi vao csdl 
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2 tao cau lenh sql 
		String sql ="select * from khachhang where tendn=? and pass=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tendn);
		cmd.setString(2, pass);
		//b4: thuc hien cau lenh 
		ResultSet rs  = cmd.executeQuery();
		khachhangbean kh = null;
		if(rs.next()) {
			long makh = rs.getLong("makh");
			String hoten = rs.getString("hoten");
			String diachi = rs.getString("diachi");
			String sodt = rs.getString("sodt");
			String email = rs.getString("email");
			kh = new khachhangbean(makh, hoten, diachi, sodt, email, tendn, pass);
		}
		 rs.close();kn.cn.close();
		return kh;
	}
	
	public khachhangbean kttk(String tendn) throws Exception{
		//B1 ket noi vao csdl 
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2 tao cau lenh sql 
		String sql ="select * from khachhang where tendn=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tendn);
		//b4: thuc hien cau lenh 
		ResultSet rs  = cmd.executeQuery();
		khachhangbean kh = null;
		if(rs.next()) {
			long makh = rs.getLong("makh");
			String hoten = rs.getString("hoten");
			String diachi = rs.getString("diachi");
			String sodt = rs.getString("sodt");
			String email = rs.getString("email");
			String pass = rs.getString("pass");
			kh = new khachhangbean(makh, hoten, diachi, sodt, email, tendn,pass);
		}
		 rs.close();kn.cn.close();
		return kh;
	}
	
	public boolean kiemTraTaiKhoanMatKhau(String tendn, String pass) throws Exception {
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
	    String sql = "SELECT * FROM khachhang WHERE tendn=? AND pass=?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, tendn);
	    cmd.setString(2, pass);
	    ResultSet rs = cmd.executeQuery();
	    boolean isValid = rs.next();
	    rs.close();
	    kn.cn.close();
	    return isValid;
	}

	public int doiMatKhau(String tendn, String oldPass, String newPass) throws Exception {
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
	    
	    String sql = "UPDATE khachhang SET pass = ? WHERE tendn = ? AND pass = ?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, newPass);
	    cmd.setString(2, tendn);
	    cmd.setString(3, oldPass);
	    
	    int kq = cmd.executeUpdate();
	    
	    cmd.close();
	    kn.cn.close();
	    return kq;
	}

}
