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
          <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
        	
              <table class="table table-striped table-bordered templatemo-user-table">
                <thead>
                  <tr>
                    <td><a href="" class="white-text templatemo-sort-by"># <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">User Name <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Email <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Password <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Mobile <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Role <span class="caret"></span></a></td>
                    
                    <td>Edit</td>
                    <td>Delete</td>
                  </tr>
                </thead>
               <%
        
        try {
             DbConnection db=new DbConnection();
             Connection connection = db.getDBConnection();
             Statement myStm=connection.createStatement();
             String query = "select * from user ";
             ResultSet resultSet = myStm.executeQuery(query);
                while(resultSet.next()){
%>
                  <tr>
                    
                  	<td><%=resultSet.getString("uid") %></td>
                    <td><%=resultSet.getString("username") %></td>
                    <td><%=resultSet.getString("email") %></td>
                    <td><%=resultSet.getString("password") %></td>
                    <td><%=resultSet.getString("mobile") %></td>
                    <td><%=resultSet.getString("role") %></td>
                    <td><a href="UserEdit.jsp?id=<%=resultSet.getString("username")%>" class="templatemo-edit-btn">Edit</a></td>
                    <td><a href="DeleteUserHandler?id=<%=resultSet.getString("uid")%>" class="templatemo-edit-btn">Delete</a></td>
                    
                                 
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