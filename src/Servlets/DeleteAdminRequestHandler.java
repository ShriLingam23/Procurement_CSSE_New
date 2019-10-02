package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.DeleteAdminRequestService;

/**
 * Servlet implementation class DeleteAdminRequestHandler
 */
@WebServlet("/DeleteAdminRequestHandler")
public class DeleteAdminRequestHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAdminRequestHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String material=request.getParameter("id");
		
		DeleteAdminRequestService fdsv=new DeleteAdminRequestService();
	
		if(fdsv.deleteRequest(material))
		response.sendRedirect("AdminRequestView.jsp");
	}
	

}
