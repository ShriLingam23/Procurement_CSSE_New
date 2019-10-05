package Service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import Connection.DbConnection;
import EmailService.SendMail;
import Entities.Request;

public class EditAdminRequestService {
	
	public boolean updateRequest(Request res) {

		try {
					Connection con = DbConnection.getDBConnection();  	
					Statement st = con.createStatement();
					
					Statement myStmMS= con.createStatement();
	 		       	String queryMS  ="SELECT * FROM supplier_material WHERE material='"+res.getMaterial()+"' and supplier='"+res.getSupplier()+"'";

	 		        Double uprice=0.0; 
    				ResultSet  resultSetMS = myStmMS.executeQuery(queryMS);
    				while(resultSetMS.next()){
    					uprice = Double.parseDouble(resultSetMS.getString("price"));
    				}

						String query = "UPDATE request SET status='Ordered',odate='"+res.getOdate()+"',uprice="+uprice+",supplier='"+res.getSupplier()+"' WHERE rid='"+res.getRid()+"'";
						st.executeUpdate(query);
						
					//Sending Email
					Statement myStmMail= con.createStatement();
	 		       	String queryMail  ="SELECT * FROM supplier WHERE supplier='"+res.getSupplier()+"'";
	 		        ResultSet  resultSetMail = myStmMail.executeQuery(queryMail);
	 		        
		 		       while(resultSetMail.next()){
							String to = resultSetMail.getString("email");
							String message = " New Procurement Order List for SLIIT Procurement System "+
									"\n Please refer attached request details"
									+ "<ul>"
									+ "<li> Material - "+ res.getMaterial()+"</li>"
									+ "<li> Location - "+ res.getLocation()+"</li>"
									+ "<li> Order Date - "+ res.getOdate()+"</li>"
									+ "<li> Quantity - "+ res.getQty()+"</li>"
									+ "<li> Unit Price - Rs."+ uprice+"</li>"
									+ "</ul>";
							
							SendMail.send(to,"Order Request", message, "findmytrip2017@gmail.com", "findmytrip@2017");
					        System.out.println("Mail send successfully");
		 		       }

							return true;

	
			} 

					catch(Exception e){
						System.out.println(e);
					} 

						return false;
	}
	
	public boolean paymentRequest(String rid) {

		try {
					Connection con = DbConnection.getDBConnection();  	
					Statement st = con.createStatement();

						String query = "UPDATE request SET payment='Paid' WHERE rid='"+rid+"'";
						st.executeUpdate(query);
						
						//Sending Email
						Statement myStmSup= con.createStatement();
		 		       	String querySup  ="SELECT * FROM request WHERE rid='"+rid+"'";
		 		        ResultSet  resultSetSup = myStmSup.executeQuery(querySup);
		 		        
		 		        while(resultSetSup.next()) {
		 		        	String supplier = resultSetSup.getString("supplier");
		 		        	
		 		        	Statement myStmMail= con.createStatement();
			 		       	String queryMail  ="SELECT * FROM supplier WHERE supplier='"+supplier+"'";
			 		        ResultSet  resultSetMail = myStmMail.executeQuery(queryMail);
			 		        
				 		       while(resultSetMail.next()){
									String to = resultSetMail.getString("email");
									String message = " Payment has been made for the Procurement Order "+
											"\n Please refer attached Payment and relavent Order details"
											+ "<ul>"
											+ "<li> Order Date - "+ resultSetSup.getString("odate")+"</li>"
											+ "<li> MAterial Ordered - "+ resultSetSup.getString("material")+"</li>"
											+ "<li> Ordered Quantity -"+ resultSetSup.getString("qty")+"</li>"
											+ "<li> Received Quantity -"+ resultSetSup.getString("rqty")+"</li>"
											+ "<li> Payment Amount Rs."+ (Integer.parseInt(resultSetSup.getString("rqty"))*Double.parseDouble(resultSetSup.getString("uprice")))+"</li>"
											+ "</ul>";
									
									SendMail.send(to,"Payment Receipt", message, "findmytrip2017@gmail.com", "findmytrip@2017");
							        System.out.println("Mail send successfully");
				 		       }
		 		        }
						
						

							return true;

	
			} 

					catch(Exception e){
						System.out.println(e);
					} 

						return false;
	}


}
