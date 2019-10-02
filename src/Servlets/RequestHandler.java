package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.Request;
import Service.AddRequestService;

/**
 * Servlet implementation class RequestHandler
 */
@WebServlet("/RequestHandler")
public class RequestHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String material=request.getParameter("material");
		String location=request.getParameter("location");
		String rdate=request.getParameter("rdate");
		String qty=request.getParameter("qty");
		
		
		Request req=new Request();
		req.setMaterial(material);
		req.setLocation(location);
		req.setRdate(rdate);
		req.setQty(qty);
		
		AddRequestService regsv=new AddRequestService();
		if(regsv.insertRequest(req))
			response.sendRedirect("SiteManagerRequestView.jsp");
	}
		
		
	

}
