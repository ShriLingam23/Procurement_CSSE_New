package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.User;
import Service.EditUserService;

/**
 * Servlet implementation class EditUserHandler
 */
@WebServlet("/EditUserHandler")
public class EditUserHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String cpassword=request.getParameter("cpassword");
		String mobile=request.getParameter("mobile");
		String role=request.getParameter("role");
		
		User user= new User();
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(password);
		user.setCpassword(cpassword);
		user.setMobile(mobile);
		user.setRole(role);
		
		EditUserService auusv=new EditUserService();
		if(auusv.updateUser(user))
			response.sendRedirect("UserView.jsp");
	}

}
