

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Verifyemail")
public class Verifyemail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Verifyemail() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String token = request.getParameter("token");
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
			ResultSet rs = stat.executeQuery("select email from emailtokens where token = '"+token+"'");
			if (rs.next()) {
				stat.executeUpdate("update users set verified = 'true' where email = '"+rs.getString("email")+"'");
				RequestDispatcher rd = request.getRequestDispatcher("verified.jsp");
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			conn.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
