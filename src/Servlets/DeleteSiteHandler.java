package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.DeleteSiteService;


/**
 * Servlet implementation class DeleteSiteHandler
 */
@WebServlet("/DeleteSiteHandler")
public class DeleteSiteHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSiteHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String client=request.getParameter("id");
		
		DeleteSiteService fdsv=new DeleteSiteService();
	
		if(fdsv.deleteSite(client))
		response.sendRedirect("SiteView.jsp");
	}

	

}
