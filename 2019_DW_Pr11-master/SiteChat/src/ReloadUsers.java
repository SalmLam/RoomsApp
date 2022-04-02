

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReloadUsers")
public class ReloadUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReloadUsers() {
        super();
    }
    //SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FileInputStream in = new FileInputStream("C:/Users/Ahmed/Desktop/JEE/SiteChat/WebContent/data.properties");
		Properties propFile = new Properties();
		propFile.load(in);
		in.close();
		String userId = request.getParameter("userId");
		String roomId = request.getParameter("roomId");
		String driverClass = propFile.getProperty("jdbc.driverClass");
		String url = propFile.getProperty("jdbc.url");
		String login = propFile.getProperty("jdbc.login");
		String password = propFile.getProperty("jdbc.password");
		try {
			response.setContentType("text/html");
			Class.forName(driverClass);
			Connection conn = DriverManager.getConnection(url, login, password);
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery("select users.userId, username, status from messages join users on users.userId = messages.userId where roomId = "+roomId+" group by username");
			while (rs.next()) {
				String usernameDB = rs.getString("username");
				String userIdDB = rs.getString("userId");
				String statusDB = rs.getString("status");
				String s;
				if (statusDB.compareTo("Connecte") == 0) s = "tr";
				else s = "fa";
				PrintWriter out = response.getWriter();
				if (userIdDB.compareTo(userId) != 0) out.print("<div class=\"user-line\">" + 
																	"<span class=\"user-stat\">"+usernameDB+"</span>" + 
																	"<div class=\"status "+s+"\"></div>" + 
																"</div>");
			}
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
