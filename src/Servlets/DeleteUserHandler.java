package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.DeleteUserService;

/**
 * Servlet implementation class DeleteUserHandler
 */
@WebServlet("/DeleteUserHandler")
public class DeleteUserHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String username=request.getParameter("id");
		
			DeleteUserService fdsv=new DeleteUserService();
		
		if(fdsv.deleteUser(username))
			response.sendRedirect("UserView.jsp");
	}


}
