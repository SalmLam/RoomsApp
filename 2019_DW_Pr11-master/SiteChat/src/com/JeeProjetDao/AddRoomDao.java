package com.JeeProjetDao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class AddRoomDao {
	public void addRoom(String name, String password, String description, String tags, int creator, java.sql.Date bDate, java.sql.Date  eDate) {
		String sql = "insert into rooms values(null, ?, ?, ?, ?, ?, ?, ?)";
		String url = "jdbc:mysql://localhost/chat?serverTimezone=GMT";
		String user = "root";
		String pw = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pw);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, name);
			st.setString(2, password);
			st.setString(3,  description);
			st.setString(4, tags);
			st.setInt(5, creator);
			st.setDate(6, bDate);
			st.setDate(7, eDate);
			st.executeUpdate();
		}catch (Exception e) {
			e.fillInStackTrace();
		}
	}
}