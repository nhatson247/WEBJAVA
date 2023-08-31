package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import bean.admindangnhapbean;

public class admindangnhapdao {
	
	public admindangnhapbean ktdn(String tendn, String pass) throws Exception{
		//B1 ket noi vao csdl 
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2 tao cau lenh sql 
		String sql ="select * from DangNhap where TenDangNhap=? and MatKhau=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tendn);
		cmd.setString(2, pass);
		//b4: thuc hien cau lenh 
		ResultSet rs  = cmd.executeQuery();
		admindangnhapbean dn = null;
		if(rs.next()) {
			String TenDangNhap=rs.getString("TenDangNhap");
			 String MatKhau=rs.getString("MatKhau");
			 boolean Quyen=rs.getBoolean("Quyen");
			 dn =new admindangnhapbean(TenDangNhap, MatKhau, Quyen);
		}
		rs.close();kn.cn.close();
		return dn;
	}
	
	public admindangnhapbean kttk(String tendn) throws Exception{
		//B1 ket noi vao csdl 
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2 tao cau lenh sql 
		String sql ="select * from DangNhap where TenDangNhap=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tendn);
		//b4: thuc hien cau lenh 
		ResultSet rs  = cmd.executeQuery();
		admindangnhapbean dn = null;
		if(rs.next()) {
			String TenDangNhap=rs.getString("TenDangNhap");
			 String MatKhau=rs.getString("MatKhau");
			 boolean Quyen=rs.getBoolean("Quyen");
			 dn =new admindangnhapbean(TenDangNhap, MatKhau, Quyen);
		}
		 rs.close();kn.cn.close();
		return dn;
	}
	
	public boolean kiemTraTaiKhoanMatKhau(String tendn, String pass) throws Exception {
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
	    String sql = "SELECT * FROM DangNhap WHERE TenDangNhap=? AND MatKhau=?";
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
	    
	    String sql = "UPDATE DangNhap SET MatKhau = ? WHERE TenDangNhap = ? AND MatKhau = ?";
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
