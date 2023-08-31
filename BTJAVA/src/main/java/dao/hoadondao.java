package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;


import bean.hoadonbean;

public class hoadondao {
	public int themHD(long makh) throws Exception{
		 ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
		String sql = "INSERT INTO hoadon(makh, NgayMua, damua) VALUES(?,?,?)";
		PreparedStatement cmd=  kn.cn.prepareStatement(sql);
		cmd.setLong(1, makh);
		Date n = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		String nn = dd.format(n);
		Date  n2 = dd.parse(nn);
		cmd.setDate(2, new java.sql.Date(n2.getTime()));
		cmd.setBoolean(3, false);
		int kq = cmd.executeUpdate();
		 cmd.close(); kn.cn.close(); 
		return kq;
	}
	
	public long MaxHD() throws Exception{
		ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
		String sql = "SELECT MAX(MaHoaDon) as 'HDLD' FROM hoadon";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		long max = 0;
		if(rs.next() ) {
			max =  rs.getLong(1);
		}
		 cmd.close(); kn.cn.close(); 
		return max;
	}
	
	public hoadonbean timHD(long mahd) throws Exception{
		ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
		String sql = "SELECT * FROM hoadon WHERE MaHoaDon = ?";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setLong(1, mahd);
		ResultSet rs = cmd.executeQuery();
		hoadonbean hd=null;
		if(rs != null) {
			long makh = rs.getLong("makh");
			Date ngaymua = rs.getDate("ngaymua");
			boolean damua = rs.getBoolean("damua");
			hd = new hoadonbean(mahd, makh, ngaymua, damua);
		}
		return hd;
	}

}
