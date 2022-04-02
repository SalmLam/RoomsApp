

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/Resetpassword")
public class Resetpassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Resetpassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("resetpassword.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
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
			ResultSet rs = stat.executeQuery("select email, token from emailtokens where email = '"+email+"'");
			PrintWriter out = response.getWriter();
			if (rs.next()) {
				SendResetPassword.send(email, rs.getString("token"));
				out.print("done");
			}
			else out.print("notexist");
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
