package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import bean.giaybean;

public class chitietgiaydao {
    public giaybean timgiay(String magiay) throws Exception {
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();
        String sql = "SELECT * FROM giay WHERE magiay LIKE ?";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        cmd.setString(1, magiay);
        ResultSet rs = cmd.executeQuery();
        giaybean giay = null;
        if (rs != null && rs.next()) {
            String tengiay = rs.getString("tengiay");
            int soluong = rs.getInt("soluong");
            long gia = rs.getLong("gia");
            String maloai = rs.getString("maloai");
            String anh = rs.getString("anh");
            String tieude = rs.getString("tieude");
			String size = rs.getString("size");
			long soluotxem = rs.getLong("soluotxem"); 
            giay = new giaybean(magiay, tengiay, soluong, gia, maloai, anh, tieude, size, soluotxem);
        }
        if (rs != null) {
            rs.close();
        }
        kn.cn.close();
        return giay;
    }
    
    public ArrayList<giaybean> timloai(String maloai) throws Exception {
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();
        String sql = "SELECT * FROM giay WHERE maloai LIKE ?";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        cmd.setString(1, maloai);
        ResultSet rs = cmd.executeQuery();
        ArrayList<giaybean> dsGiay = new ArrayList<>();
        while (rs != null && rs.next()) {
            String magiay = rs.getString("magiay");
            String tengiay = rs.getString("tengiay");
            int soluong = rs.getInt("soluong");
            long gia = rs.getLong("gia");
            String anh = rs.getString("anh");
            String tieude = rs.getString("tieude");
			String size = rs.getString("size"); 
			long soluotxem = rs.getLong("soluotxem"); 
            giaybean  giay = new giaybean(magiay, tengiay, soluong, gia, maloai, anh, tieude, size, soluotxem);
            dsGiay.add(giay);
        }
        if (rs != null) {
            rs.close();
        }
        kn.cn.close();
        return dsGiay;
    }
    // luot xem
    
    public void tangLuotXem(String magiay) throws Exception {
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();

        String sql = "UPDATE giay SET soluotxem = soluotxem + 1 WHERE magiay = ?";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        cmd.setString(1, magiay);

        cmd.executeUpdate();
        
        cmd.close();
        kn.cn.close();
    }
    
    public ArrayList<giaybean> getGiayByLuotXem(int limit) throws Exception {
        ArrayList<giaybean> ds = new ArrayList<>();
        ketnoidao kn = new ketnoidao();
        kn.ketnoi();

        String sql = "SELECT TOP (?) * FROM giay ORDER BY soluotxem DESC";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        cmd.setInt(1, limit);
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
            ds.add(new giaybean(magiay, tengiay, soluong, gia, maloai, anh, tieude, size,soluotxem));
        }
        rs.close();
        cmd.close();
        kn.cn.close();
        return ds;
    }


}

