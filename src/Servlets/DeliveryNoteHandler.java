package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.Request;
import Service.DeliveryNoteService;
import Service.EditAdminRequestService;

/**
 * Servlet implementation class DeliveryNoteHandler
 */
@WebServlet("/DeliveryNoteHandler")
public class DeliveryNoteHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliveryNoteHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rid=request.getParameter("rid");
		String material=request.getParameter("material");
		String location=request.getParameter("location");
		String rdate=request.getParameter("rdate");
		String qty=request.getParameter("qty");
		String status=request.getParameter("status");
		String odate=request.getParameter("odate");
		String uprice=request.getParameter("uprice");
		String rqty=request.getParameter("rqty");
		String supplier=request.getParameter("supplier");
		String payment=request.getParameter("payment");
		

		Request req=new Request();
		req.setRid(rid);
		req.setMaterial(material);
		req.setLocation(location);
		req.setRdate(rdate);
		req.setQty(qty);
		req.setStatus(status);
		req.setOdate(odate);
		req.setUprice(uprice);
		req.setRqty(rqty);
		req.setSupplier(supplier);
		req.setPayment(payment);
		
		
		DeliveryNoteService auusv=new DeliveryNoteService();
		if(auusv.updateRequest(req))
			response.sendRedirect("SiteManagerRequestView.jsp");
	}

}