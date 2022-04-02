
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Properties;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReloadChat")
public class ReloadChat extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReloadChat() {
        super();
    }

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
			ResultSet rs = stat.executeQuery("select messageId, message, username, messages.userId, type from messages join users on messages.userId = users.userId where roomId = "+roomId+" order by time asc");
			PrintWriter out = response.getWriter();
			while (rs.next()) {
				String usernameDB = rs.getString("username");
				String userIdDB = rs.getString("userId");
				String msgDB = rs.getString("message");
				if (rs.getString("type").compareTo("text")==0) {
					if (userIdDB.compareTo(userId) == 0) out.print("<div class='bubble you'>"+msgDB+"</div>");
					else out.print("<div class='bubble me'><b>"+usernameDB+":</b><br>"+msgDB+"</div>");
				}
				else {
					if (userIdDB.compareTo(userId) == 0) out.print("<div class='bubble you'><form action=\"Files\" method=\"POST\"><input type=\"hidden\" value='"+rs.getString("messageId")+"' name=\"id\"><input type=\"hidden\" value='download' name=\"action\"><li class='link'>"+msgDB+"<button type='submit' class=\"btn-download\">Télécharger</button></li></form></div>");
					else out.print("<div class='bubble me'><b>"+usernameDB+":</b><br><form action=\"Files\" method=\"POST\"><input type=\"hidden\" value='"+rs.getString("messageId")+"' name=\"id\"><input type=\"hidden\" value='download' name=\"action\"><li class='link'>"+msgDB+"<button type='submit' class=\"btn-download\">Télécharger</button></li></form></div>");
				}
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
