<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="Connection.DbConnection"%>
    <% String id=request.getParameter("id"); %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>Admin Dashboard</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
    
  </head>
  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>CONSTRUCTION</h1>
        </header>
        <div class="profile-photo-container">
          <img src="images/profile-photo.jpg" alt="Profile Photo" class="img-responsive">  
          <div class="profile-photo-overlay"></div>
        </div>      
        <br><br>
       
         <nav class="templatemo-left-nav">          
          <ul>
            <li><a href="Home.jsp" class="active"><i class="fa fa-home fa-fw"></i>Dashboard</a></li>
            <li><a href="UserMain.jsp"><i class="fa fa-users fa-fw"></i>Manage Users</a></li>
            <li><a href="SiteMain.jsp"><i class="fa fa-sliders fa-fw"></i>Manage Sites</a></li>
            <li><a href="MaterialMain.jsp"><i class="fa fa-sliders fa-fw"></i>Manage Materials</a></li>
            <li><a href="SupplierMain.jsp"><i class="fa fa-users fa-fw"></i>Manage Suppliers</a></li>
            <li><a href="AdminRequestView.jsp"><i class="fa fa-users fa-fw"></i>Order View</a></li>
            <li><a href="login.jsp"><i class="fa fa-eject fa-fw"></i>Sign Out</a></li>
          </ul>  
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
          <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
              <ul class="text-uppercase">
                <li><a href="UserMain.jsp">Manage Users</a></li>
                <li><a href="SiteMain.jsp">Manage Sites</a></li>
                <li><a href="MaterialMain.jsp">Manage Materials</a></li>
                <li><a href="AdminRequestView.jsp">View Orders</a></li>
              </ul>
            </nav>
          </div>
        </div>
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10 text-center">Site</h2>
            <br><br>
            <%

			try{
					Connection con = DbConnection.getDBConnection(); 
					Statement myStm2= con.createStatement();
	 		       	String query2  ="SELECT * FROM supplier";

    				ResultSet  resultSet2 = myStm2.executeQuery(query2);
    				
	 		        Statement myStm= con.createStatement();
	 		       	String query  ="SELECT * FROM request WHERE rid='"+id+"'";

    				ResultSet  resultSet = myStm.executeQuery(query);
    
      			while(resultSet.next()){
    	  
    	  
%>
            <form action="EditAdmitRequestHandler" class="templatemo-login-form" method="POST">
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputFirstName">Material</label>
                    <input type="text" class="form-control" id=material name="material"  value="<%=resultSet.getString("material") %>">                  
                </div>
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputFirstName">Location</label>
                    <input type="text" class="form-control" id=location name="location"  value="<%=resultSet.getString("location") %>">      
                </div> 
              </div>
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputUsername">Request Date</label>
                    <input type="date" class="form-control" id="rdate" name="rdate" value="<%=resultSet.getString("rdate") %>">                  
                </div>
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputConfirmNewPassword">Quantity</label>
                    <input type="text" class="form-control" id="qty" name="qty" value="<%=resultSet.getString("qty") %>"> 
                </div> 
              </div>
              <div class="row form-group">
              	 <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputEmail">Status</label>
                    <select class="form-control" id="status" name="status">
                      <option><%=resultSet.getString("status") %></option>
				      <option>Process</option>	
				      <option>Delivered</option>
				    </select>                 
                </div> 
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputNewPassword">Order Date</label>
                    <input type="text" class="form-control" id="odate" name="odate" value="<%= (new java.util.Date()).toLocaleString()%>">  
                </div>
                
              </div>
              <div class="row form-group">
              	 <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputEmail">Unit Price</label>
                    <input type="text" class="form-control" id="uprice" name="uprice" value="<%=resultSet.getString("uprice") %>">                 
                </div> 
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputNewPassword">Received Quantity</label>
                    <input type="text" class="form-control" id="rqty" name="rqty" >  
                </div>
                
              </div>

			<div class="row form-group">
              	 <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputEmail">Supplier</label>
                    <select class="form-control" id="supplier" name="supplier" >
                      <%  while(resultSet2.next()){ %>
				            <option><%=resultSet2.getString("supplier") %></option>
				        <% } %>
				    </select>                  
                </div> 
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputNewPassword">Payment</label>
                    <select class="form-control" id="payment" name="payment">
                      <option>Pending</option>
				      <option>Received</option>
				    </select> 
                </div>
                
              </div>
        
              <div class="form-group text-center">
                <button type="submit" class="templatemo-blue-button">Update</button>
              </div>                           
            </form>
<% 
				}
      
      			con.close();
      
			} 
			
			catch (Exception e) {
				e.printStackTrace();
			}
%>
          </div>
        </div>
      </div>
    </div>

    <!-- JS -->
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>        <!-- jQuery -->
    <script type="text/javascript" src="js/bootstrap-filestyle.min.js"></script>  <!-- http://markusslima.github.io/bootstrap-filestyle/ -->
    <script type="text/javascript" src="js/templatemo-script.js"></script>        <!-- Templatemo Script -->
  </body>
</html>
