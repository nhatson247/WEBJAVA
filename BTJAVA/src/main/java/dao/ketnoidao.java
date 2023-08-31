package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ketnoidao {
	public Connection cn;
	public void ketnoi() throws Exception{
		// b1 : xac dinh hqtcsdl
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		System.out.println("Da xac dinh heqtcsdl");
		String url = "jdbc:sqlserver://DESKTOP-05R3T93\\SQLEXPRESS:1433;databaseName=QLgiay;user=sa; password=123;";
		cn=DriverManager.getConnection(url);
		System.out.print("Da ket noi duoc heqtcsdl");
	}
}