
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="Connection.DbConnection"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%

Gson gsonObj = new Gson();

Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

Map<Object,Object> map1 = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();

Map<Object,Object> mapG = null;
List<Map<Object,Object>> listG = new ArrayList<Map<Object,Object>>();

Map<Object,Object> mapN = null;
List<Map<Object,Object>> listN = new ArrayList<Map<Object,Object>>();


DbConnection db=new DbConnection();

Connection connection = db.getDBConnection();

Statement myStm=connection.createStatement();
String query = "select location,SUM(rqty*uprice) AS 'tamount' from request WHERE status!='Process' GROUP BY location";
ResultSet resultSet = myStm.executeQuery(query);
while(resultSet.next()){
	map = new HashMap<Object,Object>(); map.put("label", resultSet.getString("location")); map.put("y", Float.parseFloat(resultSet.getString("tamount"))); list.add(map);
}

Statement myStm1=connection.createStatement();
String query1 = "select material,SUM(rqty) AS 'tqty' from request GROUP BY material";
ResultSet resultSet1 = myStm1.executeQuery(query1);
while(resultSet1.next()){
	map1 = new HashMap<Object,Object>(); map1.put("label", resultSet1.getString("material")); map1.put("y", Integer.parseInt(resultSet1.getString("tqty"))); map1.put("exploded", true); list1.add(map1);
}

Statement myStmGM=connection.createStatement();
String queryGM = "select * from request WHERE status='Delivered'";
ResultSet resultSetGM = myStmGM.executeQuery(queryGM);
while(resultSetGM.next()){
	mapG = new HashMap<Object,Object>(); mapG.put("label", resultSetGM.getString("rid")); mapG.put("y", Integer.parseInt(resultSetGM.getString("qty"))); listG.add(mapG);
	mapN = new HashMap<Object,Object>(); mapN.put("label", resultSetGM.getString("rid")); mapN.put("y", Integer.parseInt(resultSetGM.getString("rqty"))); listN.add(mapN);
}

 
String dataPoints = gsonObj.toJson(list);
String dataPoints1 = gsonObj.toJson(list1);
String dataPointsG = gsonObj.toJson(listG);
String dataPointsN = gsonObj.toJson(listN);
%>
    
    
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
    
    <script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	title: {
		text: "Material Order Analyzes for the Construction sites"
	},
	axisX: {
		title: "Procurement Material "
	},
	axisY: {
		title: "Number of Procurement Material Ordered"
	},
	data: [{
		type: "column",
		yValueFormatString: "Rs#,##0.0# ",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();

//Pie Chart
var chart1 = new CanvasJS.Chart("chartContainer1", {
	theme: "light2",
	animationEnabled: true,
	exportFileName: "New Year Resolutions",
	exportEnabled: true,
	title:{
		text: "Top Categories of New Year's Resolution"
	},
	data: [{
		type: "pie",
		showInLegend: true,
		legendText: "{label}",
		toolTipContent: "{label}: <strong>{y}%</strong>",
		indexLabel: "{label} {y}%",
		dataPoints : <%out.print(dataPoints1);%>
	}]
});
 
chart1.render();

//Comparison
var chartGN = new CanvasJS.Chart("chartContainerGN", {
	animationEnabled: true,
	title: {
		text: "Ordered Quantity Vs Received Quantity of Material"
	},
	axisX: {
		title: "Order ID",
		reversed: true
	},
	axisY: {
		title: "Ordered Quantity",
		titleFontColor: "#4F81BC",
		lineColor: "#4F81BC",
		labelFontColor: "#4F81BC",
		tickColor: "#4F81BC"
	},
	axisY2: {
		title: "Received Quantity",
		titleFontColor: "#C0504E",
		lineColor: "#C0504E",
		labelFontColor: "#C0504E",
		tickColor: "#C0504E"
	},
	toolTip: {
		shared: true
	},
	legend: {
		cursor: "pointer",
		itemclick: toggleDataSeries
	},
	data: [{
		type: "bar",
		name: "Ordered Quantity",
		axisYType: "primary",
		showInLegend: true,
		yValueFormatString: "#,### Items",
		dataPoints: <%out.print(dataPointsG);%>
	},
	{
		type: "bar",
		name: "Received Quantity",
		axisYType: "secondary",
		showInLegend: true,
		yValueFormatString: "#,### Items",
		dataPoints: <%out.print(dataPointsN);%>
	}]
});
chartGN.render();
 
function toggleDataSeries(e) {
	if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = true;
	} else {
		e.dataSeries.visible = true;
	}
	e.chartGN.render();
}
 
}
</script>
    
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
          <div class="templatemo-flex-row flex-content-row">
            <div class="templatemo-content-widget white-bg col-2">
              <i class="fa fa-times"></i>
              <div class="square"></div>
              <h2 class="templatemo-inline-block">Visual Admin Template</h2><hr>
              <p>Works on all major browsers. IE 10+. Visual Admin is <a href="http://www.templatemo.com/tag/admin" target="_parent">free responsive admin template</a> for everyone. Feel free to use this template for your backend user interfaces. Please tell your friends about <a href="http://www.templatemo.com" target="_parent">templatemo.com</a> website. You may <a href="http://www.templatemo.com/contact" target="_parent">contact us</a> if you have anything to say.</p>
              <p>Nunc placerat purus eu tincidunt consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dapibus nulla quis risus auctor, non placerat augue consectetur. Fusce mi lacus, semper sit amet mattis eu.</p>              
            </div>
            <div class="templatemo-content-widget white-bg col-2">
              <i class="fa fa-times"></i>
              <div class="square"></div>
              <h2 class="templatemo-inline-block">Visual Admin Template</h2><hr>
              <p>Works on all major browsers. IE 10+. Visual Admin is <a href="http://www.templatemo.com/tag/admin" target="_parent">free responsive admin template</a> for everyone. Feel free to use this template for your backend user interfaces. Please tell your friends about <a href="http://www.templatemo.com" target="_parent">templatemo.com</a> website. You may <a href="http://www.templatemo.com/contact" target="_parent">contact us</a> if you have anything to say.</p>
              <p>Nunc placerat purus eu tincidunt consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dapibus nulla quis risus auctor, non placerat augue consectetur. Fusce mi lacus, semper sit amet mattis eu.</p>              
            </div>
          </div>
          
          <!-- Data Visualization -->
          <div id="chartContainer" style="height: 370px; width: 100%;"><span class="badge">new</span></div>
          
		
          <div class="templatemo-flex-row flex-content-row templatemo-overflow-hidden"> <!-- overflow hidden for iPad mini landscape view-->
            <div class="col-1 templatemo-overflow-hidden">
              <div class="templatemo-content-widget white-bg templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
                <div class="templatemo-flex-row flex-content-row">
                  <div class="col-1 col-lg-6 col-md-12">
                    <h2 class="text-center">Modular<span class="badge">new</span></h2>
                    <div id="chartContainerGN" style="height: 370px; width: 100%;"></div>
                  </div>
                  <div class="col-1 col-lg-6 col-md-12">
                  	<h2 class="text-center">Modular<span class="badge">new</span></h2>
                    <div id="chartContainer1" style="height: 370px; width: 100%;"></div>
                  </div>  
                </div>                
              </div>
            </div>
          </div>        
        </div>
      </div>
    </div>
    
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    <!-- JS -->
    <script src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script src="js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
    <script>
      /* Google Chart 
      -------------------------------------------------------------------*/
      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart); 
      
      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Topping');
          data.addColumn('number', 'Slices');
          data.addRows([
            ['Mushrooms', 3],
            ['Onions', 1],
            ['Olives', 1],
            ['Zucchini', 1],
            ['Pepperoni', 2]
          ]);

          // Set chart options
          var options = {'title':'How Much Pizza I Ate Last Night'};

          // Instantiate and draw our chart, passing in some options.
          var pieChart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
          pieChart.draw(data, options);

          var barChart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
          barChart.draw(data, options);
      }

      $(document).ready(function(){
        if($.browser.mozilla) {
          //refresh page on browser resize
          // http://www.sitepoint.com/jquery-refresh-page-browser-resize/
          $(window).bind('resize', function(e)
          {
            if (window.RT) clearTimeout(window.RT);
            window.RT = setTimeout(function()
            {
              this.location.reload(false); /* false to get page from cache */
            }, 200);
          });      
        } else {
          $(window).resize(function(){
            drawChart();
          });  
        }   
      });
      
    </script>
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->

  </body>
</html>