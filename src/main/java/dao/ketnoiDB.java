package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ketnoiDB {
	public static Connection cn;
	public void ketnoi() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
<<<<<<< HEAD
		String url ="jdbc:sqlserver://LAPTOP-N2S29REU\\SQLEXPRESS03:1433;databaseName=QLNS; user=sa; password=123";
=======
		String url ="jdbc:sqlserver://RIN\\SQLEXPRESS:1433;databaseName=QLNS; user=sa; password=123";
>>>>>>> fdc82ec (dinhtien5-2)
		cn = DriverManager.getConnection(url);
		System.out.println("Da Ket Noi");
	}
}
