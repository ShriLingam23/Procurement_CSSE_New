<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
    <%@ page import="Connection.DbConnection"%>
    <% String id=request.getParameter("id"); %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>Site Manager Dashboard</title>
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
            <li><a href="SiteManagerHome.jsp" class="active"><i class="fa fa-home fa-fw"></i>Dashboard</a></li>
            <li><a href="SiteAdminRequest.jsp"><i class="fa fa-users fa-fw"></i>Manage Orders</a></li>
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
                <li><a href="Request.jsp">Add Orders</a></li>
                <li><a href="SiteManagerRequestView.jsp">View Orders</a></li>
              </ul>
            </nav>
          </div>
        </div>
     
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10 text-center">Order</h2>
            </br></br>
<%

			try{
					Connection con = DbConnection.getDBConnection(); 
	 		        Statement myStm= con.createStatement();
	 		       	String query  ="SELECT * FROM material";
	 		       	
    				ResultSet  resultSet = myStm.executeQuery(query);
    			 	  
    				Statement myStm2= con.createStatement();
	 		       	String query2  ="SELECT * FROM site";
	 		       	
    				ResultSet  resultSet2 = myStm2.executeQuery(query2);
%>
   
            <form action="RequestHandler" class="templatemo-login-form" method="POST">
              <div class="row form-group">
              
                     
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputFirstName">Material</label>
            
                  <select class="form-control" id="material" name="material">
				      <%  while(resultSet.next()){ %>
				            <option><%=resultSet.getString("material") %></option>
				        <% } %>
				    </select>                    
                </div>
                
                    
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputFirstName">Location</label>
                    <select class="form-control" id="location" name="location">
                      <%  while(resultSet2.next()){ %>
				            <option><%=resultSet2.getString("location") %></option>
				        <% } %>
				    </select>                   
                </div> 
              </div>
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputFirstName">Request Date</label>
                    <input type="date" class="form-control" id="rdate" name="rdate">                  
                </div> 
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputConfirmNewPassword">Quantity</label>
                    <select class="form-control" id="qty" name="qty">
				      <option>500</option>
				      <option>1000</option>
				      <option>1500</option>
				      <option>2000</option>
				      <option>2500</option>
				    </select>  
                </div> 
              </div>
              
             
              <div class="form-group text-center">
                <button type="submit" class="templatemo-blue-button">Add</button>
              </div>                           
            </form>
     <% 
				
      
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