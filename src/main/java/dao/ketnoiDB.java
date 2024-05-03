package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ketnoiDB {
	public static Connection cn;
	public void ketnoi() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
<<<<<<< HEAD
		String url ="jdbc:sqlserver://DESKTOP-VSQGE62\\TANNGO:1433;databaseName=QLNS; user=sa; password=123";
=======
		String url ="jdbc:sqlserver://RIN\\SQLEXPRESS:1433;databaseName=QLNS; user=sa; password=123";
>>>>>>> 097148eef5fefc12e245ad24425f83197efdf3c1
		cn = DriverManager.getConnection(url);
		System.out.println("Da Ket Noi");
	}
}
