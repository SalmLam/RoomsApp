package com.JeeProjet;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.JeeProjetDao.AddRoomDao;

/**
 * Servlet implementation class AddRoom
 */
@WebServlet("/AddRoom")
public class AddRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRoom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		}else {
			int creator = Integer.parseInt((String)session.getAttribute("userId"));
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String description = request.getParameter("description");
			String tags = request.getParameter("tags");
			try {
				java.util.Date bdate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("bDate"));
				java.sql.Date bDate = new java.sql.Date(bdate.getTime());
				java.util.Date edate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("eDate"));
				System.out.println(bDate);
				java.sql.Date eDate = new java.sql.Date(edate.getTime());
				AddRoomDao ard = new AddRoomDao();
				ard.addRoom(name, password, description, tags, creator, bDate, eDate);
				
			}catch(Exception e){
				e.fillInStackTrace();
			}
			response.sendRedirect("home.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/addRoom.jsp").forward(request, response);

	}

}
