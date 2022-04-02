

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

@WebServlet("/Signin")
public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Signin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		String passwordToHash = request.getParameter("pass");
        String pass = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            md.update(passwordToHash.getBytes());
            //Get the hash's bytes 
            byte[] bytes = md.digest();
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            pass = sb.toString();
        } 
        catch (NoSuchAlgorithmException e) 
        {
            e.printStackTrace();
        }
		String email = request.getParameter("email");
		String tele = request.getParameter("tele");
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
			ResultSet rs = stat.executeQuery("select username from users where username = '"+user+"'");
			PrintWriter out = response.getWriter();
			boolean flag = true;
			if (rs.next()) {
				out.print("exist user");
				flag = false;
			}
			rs = stat.executeQuery("select email from users where email = '"+email+"'");
			if (rs.next()) {
				out.print("exist email");
				flag = false;
			}
			if (flag) {
				stat.executeUpdate("insert into users(username, password, email, telephone, status, verified) values('"+user+"','"+pass+"','"+email+"','"+tele+"','Deconnecte', 'false')");
				String token = RandomToken.getAlphaNumericString();
				boolean flagT = true;
				while (flagT) {
					rs = stat.executeQuery("select email from emailtokens where token = '"+token+"'");
					flagT = false;
					if (rs.next()) {
						flagT = true;
						token = RandomToken.getAlphaNumericString();
					}
				}
				stat.executeUpdate("insert into emailtokens values ('"+email+"', '"+token+"')");
				SendVerifyEmail.send(email, token);
				conn.close();
				out.print("done");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
