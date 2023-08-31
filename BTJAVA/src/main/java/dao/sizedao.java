package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.sizebean;

public class sizedao {
	public ArrayList<sizebean> getsize()throws Exception{
		 ArrayList<sizebean> ds = new  ArrayList<sizebean>();
		 ketnoidao kn = new ketnoidao();
			kn.ketnoi();
			//B2 tao cau lenh sql 
			String sql ="select * from size";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			//b4: thuc hien cau lenh 
			ResultSet rs  = cmd.executeQuery();
			while(rs.next()){
				String masize = rs.getString("masize");
				String size = rs.getString("size");				
				ds.add(new sizebean(masize, size));
			}
			 rs.close();kn.cn.close();
		return ds;
	}
}
