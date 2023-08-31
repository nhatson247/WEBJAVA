package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.giaysizebean;

public class giaysizedao {
	public ArrayList<giaysizebean> getgiaysize()throws Exception{
		 ArrayList<giaysizebean> ds = new  ArrayList<giaysizebean>();
		 ketnoidao kn = new ketnoidao();
			kn.ketnoi();
			//B2 tao cau lenh sql 
			String sql ="select * from giaysize";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			//b4: thuc hien cau lenh 
			ResultSet rs  = cmd.executeQuery();
			while(rs.next()){
				long id = rs.getLong("id");
				String magiay = rs.getString("magiay");	
				String masize = rs.getString("magiay");
				ds.add(new giaysizebean(id, magiay, masize));
			}
			 rs.close();kn.cn.close();
		return ds;
	}
}
