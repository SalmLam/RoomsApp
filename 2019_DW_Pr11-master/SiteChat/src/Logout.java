

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Logout() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String userId = (String) session.getAttribute("userId");
		FileInputStream in = new FileInputStream("C:/Users/Ahmed/Desktop/JEE/SiteChat/WebContent/data.properties");
		Properties propFile = new Properties();
		propFile.load(in);
		in.close();
		String driverClass = propFile.getProperty("jdbc.driverClass");
		String url = propFile.getProperty("jdbc.url");
		String login = propFile.getProperty("jdbc.login");
		String password = propFile.getProperty("jdbc.password");
		try {
			Class.forName(driverClass);
			Connection conn = DriverManager.getConnection(url, login, password);
			Statement stat = conn.createStatement();
			stat.executeUpdate("update users set status = 'Deconnecte' where userId = "+userId);
			conn.close();
			session.invalidate();
			response.sendRedirect(request.getContextPath());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
