package com.JeeProjet;

import java.io.IOException;

import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.JeeProjetDao.UpdateRoomDao;

/**
 * Servlet implementation class UpdateRoom
 */
@WebServlet("/UpdateRoom")
public class UpdateRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRoom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSession session = request.getSession();
		int roomId = Integer.parseInt(request.getParameter("roomId"));
		String name = request.getParameter("name");
		System.out.println(name);
		String password = request.getParameter("password");
		String description = request.getParameter("description");
		String tags = request.getParameter("tags");
		try {
			java.util.Date bdate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("bDate"));
			java.sql.Date bDate = new java.sql.Date(bdate.getTime());
			java.util.Date edate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("eDate"));
			System.out.println(bDate);
			java.sql.Date eDate = new java.sql.Date(edate.getTime());
			UpdateRoomDao urd = new UpdateRoomDao();
			urd.updateRoom(roomId, name, password, description, tags,  bDate, eDate);
			
		}catch(Exception e){
			e.fillInStackTrace();
		}
		response.sendRedirect("home.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
