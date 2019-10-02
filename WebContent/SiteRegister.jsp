<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
            <h2 class="margin-bottom-10 text-center">Sites</h2>
            </br></br>
            <form action="SiteHandler" class="templatemo-login-form" method="POST">
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputFirstName">Client</label>
                    <input type="text" class="form-control" id=client name="client"  placeholder="Enter the Client Name">                  
                </div>
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputLastName">Location</label>
                    <select class="form-control" id="location" name="location">
				      <option>Malabe</option>
				      <option>Kollupitiya</option>
				      <option>Wellawatte</option>
				      <option>Bambalapitiya</option>
				      <option>Borella</option>
				      <option>Pettah</option>
				    </select>        
                </div> 
              </div>
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputUsername">Budget</label>
                    <input type="text" class="form-control" id="budget" name="budget" placeholder="Enter the Budget">                  
                </div>
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputConfirmNewPassword">Contact No</label>
                    <input type="text" class="form-control" id="contact" name="contact" placeholder="Enter the Contact No"> 
                </div> 
              </div>
              <div class="row form-group">
              	 <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputEmail">Start Date</label>
                    <input type="date" class="form-control" id="sdate" name="sdate">                  
                </div> 
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputNewPassword">End Date</label>
                    <input type="date" class="form-control" id="edate" name="edate">  
                </div>
                
              </div>

        
              <div class="form-group text-center">
                <button type="submit" class="templatemo-blue-button">Add</button>
              </div>                           
            </form>
          
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
