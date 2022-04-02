

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
import javax.servlet.http.HttpSession;

@WebServlet("/Chat")
public class Chat extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Chat() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Integer roomId;
    	HttpSession session = request.getSession(true);
    	try {
    		System.out.println("1");
    		roomId = Integer.parseInt((String)session.getAttribute("roomId"));
    		System.out.println("2");
    	}
    	catch (Exception e) {
    		roomId = 0;
    	}
		Object connec = session.getAttribute("connected");
		if (connec == null) response.sendRedirect(request.getContextPath() + "/Login");	
		else {
			//TESTER SI ROOM ID N EST PAS NUMERIQUE
			if ((boolean) connec == true && roomId > 0) {
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
					ResultSet rs = stat.executeQuery("select name from rooms where roomId = "+roomId.toString());
					if(rs.next()) {
						request.setAttribute("roomName", rs.getString("name"));
					}
					rs = stat.executeQuery("select username from users where userId = "+session.getAttribute("userId"));
					if(rs.next()) {
						request.setAttribute("userName", rs.getString("username"));
					}
					conn.close();
				}
				catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("roomId", roomId.toString());
				System.out.println("login not workingggg");
				RequestDispatcher rd = request.getRequestDispatcher("chat.jsp");
				rd.forward(request, response);
			}
			//SI ROOMID N EST PAS NUMERIQUE
			else response.sendRedirect(request.getContextPath() + "/Home");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
