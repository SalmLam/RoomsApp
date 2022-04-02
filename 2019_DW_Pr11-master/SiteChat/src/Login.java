

import java.io.FileInputStream;
import java.io.IOException;
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
import javax.servlet.http.HttpSession;

import com.JeeProjetDao.ClearRoomsDao;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user").toLowerCase();
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
            System.out.println(pass);
        } 
        catch (NoSuchAlgorithmException e) 
        {
            e.printStackTrace();
        }
		FileInputStream in = new FileInputStream("C:/Users/Ahmed/Desktop/JEE/SiteChat/WebContent/data.properties");
		Properties propFile = new Properties();
		propFile.load(in);
		in.close();
		String driverClass = propFile.getProperty("jdbc.driverClass");
		String url = propFile.getProperty("jdbc.url");
		String login = propFile.getProperty("jdbc.login");
		String password = propFile.getProperty("jdbc.password");
		try {
			ClearRoomsDao crd = new ClearRoomsDao();
			crd.clear();
			Class.forName(driverClass);
			System.out.println("1");
			Connection conn = DriverManager.getConnection(url, login, password);
			System.out.println("2");
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery("select userId from users where username = '"+user+"' AND password = '"+pass+"' AND verified = 'true'");
			if(rs.next()) {
				HttpSession session = request.getSession(true);
				session.setAttribute("username", user);
				session.setAttribute("userId", rs.getString("userId"));
				session.setAttribute("connected", new Boolean(true));
				stat.executeUpdate("update users set status = 'Connecte' where userId = "+rs.getString("userId"));
				System.out.println("3");
				response.sendRedirect(request.getContextPath() + "/Home");
			}
			else {
				System.out.println("4");
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
