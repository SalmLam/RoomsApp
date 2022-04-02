

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.apache.tomcat.util.http.fileupload.IOUtils;


@WebServlet("/Files")
@MultipartConfig
public class Files extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Files() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("room: "+request.getParameter("roomId"));
		System.out.println("user: "+request.getParameter("userId"));
		String action = request.getParameter("action");
		if (action.compareTo("upload") == 0) {
			Integer roomId = Integer.parseInt(request.getParameter("roomId"));
			Integer userId = Integer.parseInt(request.getParameter("userId"));
			Part filePart = request.getPart("file");
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		    InputStream fileContent = filePart.getInputStream();
		    final ByteArrayOutputStream baos = new ByteArrayOutputStream();
		    final byte[] buffer = new byte[500];
		    int read = -1;
		    while ((read = fileContent.read(buffer)) > 0) {
		        baos.write(buffer, 0, read);
		    }
		    byte[] fileByte = baos.toByteArray();
		    String driverClass = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/chat?serverTimezone=GMT";
			String login = "root";
			String password = "";
			try {
				Class.forName(driverClass);
				Connection conn = DriverManager.getConnection(url, login, password);
				SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date date = new Date(System.currentTimeMillis());
				String msgDate = d.format(date);
				String sql = "insert into messages(userId, roomId, message, type, file, time) values(?,?,?,?,?,?)";
				PreparedStatement statement = conn.prepareStatement(sql);
				statement.setInt(1, userId);
				statement.setInt(2, roomId);
				statement.setString(3, fileName);
				statement.setString(4, "file");
				ByteArrayInputStream file = new ByteArrayInputStream(fileByte);
				statement.setBlob(5, file); 
				statement.setString(6, msgDate);
				statement.execute();
				response.sendRedirect(request.getContextPath()+"/Chat");
			}
			catch (Exception e) {
				response.sendRedirect(request.getContextPath()+"/Home");
				e.printStackTrace();
			}
		}
		else if (action.compareTo("download") == 0) {
			Integer id = Integer.parseInt(request.getParameter("id"));
			String driverClass = "com.mysql.cj.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/chat?serverTimezone=GMT";
				String login = "root";
				String password = "";
				try {
					Class.forName(driverClass);
					Connection conn = DriverManager.getConnection(url, login, password);
					Statement stat = conn.createStatement();
					ResultSet rs = stat.executeQuery("select message, file from messages where messageId = "+id);
					if (rs.next()) {
						Blob blob = rs.getBlob("file");
						File outputFile = new File("fichier");
						FileOutputStream fout = new FileOutputStream(outputFile);
						IOUtils.copy(blob.getBinaryStream(), fout);
						InputStream fis = new FileInputStream(outputFile);
						ServletContext ctx = getServletContext();
						String mimeType = ctx.getMimeType(outputFile.getAbsolutePath());
						response.setContentType("APPLICATION/DOWNLOAD");
			            response.setHeader("Content-Disposition", "attachment; filename=" + rs.getString("message"));
			            ServletOutputStream os = response.getOutputStream();
			    		byte[] bufferData = new byte[1024];
			    		int read=0;
			    		while((read = fis.read(bufferData))!= -1){
			    			os.write(bufferData, 0, read);
			    		}
			    		os.flush();
			    		os.close();
			    		fis.close();
					}
				}
				catch (Exception e) {
					response.sendRedirect(request.getContextPath()+"/Home");
					e.printStackTrace();
				}
		}
	}

}
