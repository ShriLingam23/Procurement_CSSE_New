package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.Material;
import Service.AddMaterialService;

/**
 * Servlet implementation class MaterialHandler
 */
@WebServlet("/MaterialHandler")
public class MaterialHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MaterialHandler() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String material=request.getParameter("material");
		String supplier=request.getParameter("supplier");
		String qty=request.getParameter("qty");
		String price=request.getParameter("price");
		
		Material materials=new Material();
		materials.setMaterial(material);
		materials.setSupplier(supplier);
		materials.setQty(qty);
		materials.setPrice(price);
		
		AddMaterialService regsv=new AddMaterialService();
		if(regsv.insertMaterial(materials))
			response.sendRedirect("MaterialView.jsp");
	}

}
