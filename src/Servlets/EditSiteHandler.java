package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.Site;
import Service.EditSiteService;

/**
 * Servlet implementation class EditSiteHandler
 */
@WebServlet("/EditSiteHandler")
public class EditSiteHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSiteHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String client=request.getParameter("client");
		String location=request.getParameter("location");
		String budget=request.getParameter("budget");
		String contact=request.getParameter("contact");
		String sdate=request.getParameter("sdate");
		String edate=request.getParameter("edate");
		
		Site site= new Site();
		site.setClient(client);
		site.setLocation(location);
		site.setBudget(budget);
		site.setContact(contact);
		site.setSdate(sdate);
		site.setEdate(edate);
		
		EditSiteService auusv=new EditSiteService();
		if(auusv.updateSite(site))
			response.sendRedirect("SiteView.jsp");
	}

}
