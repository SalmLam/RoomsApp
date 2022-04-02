package com.JeeProjetDao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
	public int check(String username, String password) {
		String sql = "select * from users where username = ? and password = ?";
		String url = "jdbc:mysql://localhost/chat?serverTimezone=GMT";
		String user = "root";
		String pw = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pw);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, username);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				return rs.getInt("userId");
			}return -1;
		}catch (Exception e) {
			e.fillInStackTrace();
			return -1;
		}
	}
}
