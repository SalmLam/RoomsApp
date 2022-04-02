
package com.JeeProjet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JeeProjetDao.RoomLoginDao;

/**
 * Servlet implementation class RoomLogin
 */
@WebServlet("/RoomLogin")
public class RoomLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("username"));
		//String rName = (String) session.getAttribute("rName");
		String password = request.getParameter("password");
		String rName = request.getParameter("rName");
		System.out.println(rName);
		RoomLoginDao roomLoginDao = new RoomLoginDao();
		int roomId = roomLoginDao.check(rName, password);
		if(roomId != -1) {
			session.setAttribute("roomId", Integer.toString(roomId));
			response.sendRedirect(request.getContextPath()+"/Chat");
			System.out.println("login working");
		}else {
			System.out.println("login not working");
			response.sendRedirect("home.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
