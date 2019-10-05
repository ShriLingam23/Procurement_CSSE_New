<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="Connection.DbConnection"%>
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
          <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
        	
              <table class="table table-striped table-bordered templatemo-user-table">
                <thead>
                  <tr>
                    <td><a href="" class="white-text templatemo-sort-by"># <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Material <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Location <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Request Date <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Quantity <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Status<span class="caret"></span></a></td>
                    <td>Edit</td>
                  </tr>
                </thead>
               <%
        
        try {
             DbConnection db=new DbConnection();
             Connection connection = db.getDBConnection();
             Statement myStm=connection.createStatement();
             String query = "select * from request ";
             ResultSet resultSet = myStm.executeQuery(query);
                while(resultSet.next()){
%>
                  <tr>
                    
                  	<td><%=resultSet.getString("rid") %></td>
                    <td><%=resultSet.getString("material") %></td>
                    <td><%=resultSet.getString("location") %></td>
                    <td><%=resultSet.getString("rdate") %></td>
                    <td><%=resultSet.getString("qty") %></td>
                    <td><%=resultSet.getString("status") %></td>
                    <%
                    
				        if ("Process".equals(resultSet.getString("status"))) {
				    %>
                    <td><a href="SiteManagerRequestEdit.jsp?id=<%=resultSet.getString("rid")%>" class="templatemo-edit-btn">Edit</a></td>
                    <% } 
				        else if ("Ordered".equals(resultSet.getString("status"))) {
				    %>    
					 <td><a href="SiteManagerDeliveryNote.jsp?id=<%=resultSet.getString("rid")%>" class="templatemo-edit-btn">Accept</a></td>
					 
				    <% 
				        }
				        else  {
				    %>    
					 <td style="background-color: #3AEF7C;" >Order Completed</td>
					 
				    <% 
				        }
				    %>
                                 
                  </tr>
                  <%
            }
      
      			connection.close();
      
			} 
			
			catch (Exception e) {
				e.printStackTrace();
			}
%>
        
                </tbody>
              </table>  
         </div>                          
          </div>                  
        </div>
      </div>
    </div>
    
    <!-- JS -->
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->
  </body>
</html>