package com.JeeProjetDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UpdateUserDao {
	public void updateUser(int userId, String username, String password, String email, String telephone, String institution) {
		String sql = "update users set "
				+ "username=?, password=?, email=?,"
				+ " telephone=?,"
				+ " institution=? where userId=?";
		String url = "jdbc:mysql://localhost/chat?serverTimezone=GMT";
		String user = "root";
		String pw = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pw);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(6, userId);
			st.setString(1, username);
			st.setString(2, password);
			st.setString(3,  email);
			st.setString(4, telephone);
			st.setString(5, institution);
			try {
			st.executeUpdate();
			}catch(Exception e) {
				System.out.println("Query Problem");
			}
		}catch (Exception e) {
			e.fillInStackTrace();
		}
	}
}
