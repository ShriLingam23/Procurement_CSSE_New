package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Entities.User;
import Service.LoginService;

/**
 * Servlet implementation class LoginHandler
 */
@WebServlet("/LoginHandler")
public class LoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String role=request.getParameter("role");
		
		User login=new User();
		login.setUsername(username);
		login.setPassword(password);
		login.setRole(role);
		
		LoginService regsv=new LoginService();
		 if(regsv.checkLogin(login) && "Admin".equals(role))  {
			response.sendRedirect("Home.jsp");
		}
		 else if(regsv.checkLogin(login) && "Site Manager".equals(role)) {
				response.sendRedirect("SiteManagerHome.jsp");
			}
		
		else
			response.sendRedirect("login.jsp");
		
	}

}
