package com.JeeProjetDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RoomLoginDao {
	public int check(String rName, String password) {
		String sql = "select * from rooms where name = ? and password = ?";
		String url = "jdbc:mysql://localhost/chat?serverTimezone=GMT";
		String user = "root";
		String pw = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pw);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, rName);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				return rs.getInt("roomId");
			}return -1;
		}catch (Exception e) {
			e.fillInStackTrace();
			return -1;
		}
	}
}
