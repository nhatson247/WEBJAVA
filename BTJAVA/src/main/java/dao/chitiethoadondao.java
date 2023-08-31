package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.adminxacnhanbean;

public class chitiethoadondao {
	public int ThemCTHD(String magiay, long soluongmua, long mahoadon) throws Exception {
		// B1: ket noi vao csdl
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		// B2: tao cau len sql
		String sql = "Insert into ChiTietHoaDon(magiay,SoLuongMua,MaHoaDon,damua) values (?,?,?,?)";
		// B3: tao cau len preparestatement
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		// B4: Truyen tham so
		cmd.setString(1, magiay);
		cmd.setLong(2, soluongmua);
		cmd.setLong(3, mahoadon);
		cmd.setBoolean(4, false);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	 public int xacnhanHoaDonVaChiTiet(long mahoadon) throws Exception {
	        ketnoidao kn = new ketnoidao();
	        kn.ketnoi();
	        
	        // Xác nhận hóa đơn
	        String sqlHoaDon = "UPDATE HoaDon SET damua = 1 WHERE MaHoaDon = ?";
	        PreparedStatement cmdHoaDon = kn.cn.prepareStatement(sqlHoaDon);
	        cmdHoaDon.setLong(1, mahoadon);
	        cmdHoaDon.executeUpdate();
	        cmdHoaDon.close();

	        // Xác nhận các chi tiết hóa đơn tương ứng
	        String sqlChiTiet = "UPDATE ChiTietHoaDon SET damua = 1 WHERE MaHoaDon = ?";
	        PreparedStatement cmdChiTiet = kn.cn.prepareStatement(sqlChiTiet);
	        cmdChiTiet.setLong(1, mahoadon);
	        cmdChiTiet.executeUpdate();
	        cmdChiTiet.close();
	        
	        kn.cn.close();
			return 0;
	    }
	
	public int sua(long mact) throws Exception {
		// B1: ket noi vao csdl
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		// B2: tao cau len sql
		String sql = "UPDATE ChiTietHoaDon SET damua = 1 where MaChiTietHD = ?";
		// B3: tao cau len preparestatement
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		// B4: Truyen tham so
		cmd.setLong(1, mact);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public int xoa(long mact) throws Exception {
	    // B1: kết nối vào CSDL
	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
	    // B2: tạo câu lệnh SQL
	    String sql = "DELETE FROM ChiTietHoaDon WHERE MaChiTietHD = ?";
	    // B3: tạo câu lệnh PreparedStatement
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    // B4: Truyền tham số
	    cmd.setLong(1, mact);
	    int kq = cmd.executeUpdate();
	    cmd.close();
	    kn.cn.close();
	    return kq;
	}

	public ArrayList<adminxacnhanbean> getxacnhan()throws Exception{
		 ArrayList<adminxacnhanbean> ds = new  ArrayList<adminxacnhanbean>();
		 ketnoidao kn = new ketnoidao();
			kn.ketnoi();
			//B2 tao cau lenh sql 
			String sql ="select * from VAdminXacNhan";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			//b4: thuc hien cau lenh 
			ResultSet rs  = cmd.executeQuery();
			while(rs.next()){
				long MaChiTietHD = rs.getLong("MaChiTietHD");
				String hoten = rs.getString("hoten");
				String tengiay = rs.getString("tengiay");
				String size = rs.getString("size");
				long gia = rs.getLong("gia");
				long SoLuongMua = rs.getLong("SoLuongMua");
				long thanhtien = rs.getLong("thanhtien");
				boolean damua = rs.getBoolean("damua");
				Date ngaymua = rs.getDate("ngaymua");
				ds.add(new adminxacnhanbean(MaChiTietHD, hoten, tengiay, size, gia, SoLuongMua, thanhtien, ngaymua, damua));
			}
			 rs.close();kn.cn.close();
		return ds;
	}
	
}