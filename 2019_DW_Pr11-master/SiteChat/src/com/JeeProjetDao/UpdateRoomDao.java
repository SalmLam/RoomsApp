package com.JeeProjetDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UpdateRoomDao {
	public void updateRoom(int roomId, String name, String password, String description, String tags,  java.sql.Date bDate, java.sql.Date  eDate) {
		String sql = "update rooms set "
				+ "name=?, password=?, description=?,"
				+ " tags=?,"
				+ " beginning_date=?, end_date=?"
				+ " where roomId = ?";
		String url = "jdbc:mysql://localhost/chat?serverTimezone=GMT";
		String user = "root";
		String pw = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pw);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(7, roomId);
			st.setString(1, name);
			st.setString(2, password);
			st.setString(3,  description);
			st.setString(4, tags);
			st.setDate(5, bDate);
			st.setDate(6, eDate);
			try {
			st.executeUpdate();
			}catch(Exception e) {
				System.out.println("oups");
			}
		}catch (Exception e) {
			e.fillInStackTrace();
		}
	}
}
