package com.JeeProjetDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

public class SendUpdateRoomDao {
	public void send(int roomId, HttpSession session) {
		String sql = "select * from rooms where roomId = ?";
		String url = "jdbc:mysql://localhost/chat?serverTimezone=GMT";
		String user = "root";
		String pw = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pw);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, roomId);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				session.setAttribute("roomName", rs.getString("name")); 
				session.setAttribute("roomPassword", rs.getString("password"));
				session.setAttribute("roomDescription", rs.getString("description"));
				session.setAttribute("roomTags", rs.getString("tags"));
				session.setAttribute("roomType", rs.getString("type"));
				session.setAttribute("roomBdate", rs.getDate("beginning_date"));
				session.setAttribute("roomEdate", rs.getDate("end_date"));
			}
		}catch (Exception e) {
			e.fillInStackTrace();
		}
	}
	
}
