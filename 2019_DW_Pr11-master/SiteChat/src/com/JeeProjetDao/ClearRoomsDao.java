package com.JeeProjetDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ClearRoomsDao {
	public void clear() {
		String sql = "delete from rooms where  end_date < SYSDATE() or beginning_date > end_date";
		String sql2 = "delete from messages where roomId in (select roomId from rooms where  end_date < SYSDATE() or beginning_date > end_date)";
		String url = "jdbc:mysql://localhost/chat?serverTimezone=GMT";
		String user = "root";
		String pw = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pw);
			PreparedStatement st = con.prepareStatement(sql);
			PreparedStatement st2 = con.prepareStatement(sql2);
			st2.executeUpdate();
			st.executeUpdate();
		}catch (Exception e) {
			e.fillInStackTrace();
		}
	}
}
