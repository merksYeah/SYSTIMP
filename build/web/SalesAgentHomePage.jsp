<%-- 
    Document   : ClientHomePage
    Created on : 10 10, 15, 9:02:37 AM
    Author     : deathman28
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>HOMEPAGE</title>
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css"/> 
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">
        <link href="assets/js/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
         <link rel="stylesheet" type="text/css" href="assets/DataTables-1.10.6/media/css/jquery.dataTables.min.css">
    </head>
    <body>
         <%@include file="LoadTemplate.jsp"%>
         <section id="main-content">
          <section class="wrapper">
             <div class="col-lg-8">
                 <div class="row mt">
                          <div class="panel panel-primary">
                              <div class="panel-heading"><h3>Current Orders</h3></div>  
                              <div class="panel-body">
                                    <table id = "orders" class="table table-bordered table-striped table-condensed">
	                  	  	  <hr>
                                           
                                        
                              <thead>
                              <tr>
                                  <th><i class="fa fa-barcode"></i> S.O.ID</th>
                                  <th class="hidden-phone"><i class="fa fa-truck"></i> Deliver To</th>
                                  <th><i class="fa fa-calendar"></i> Date Issued</th>
                                  <th><i class=" fa fa-calendar"></i> Order Date</th>
                                  <th id ="devDate"><i class=" fa fa-calendar"></i> Delivery Date</th>
                                  <th id="devStatus"><i class=" fa fa-edit"></i> Status</th>
                              </tr>
                              </thead>
                              <tbody> 
                              </tbody>
                          </table>
                                </div>
                          </div>
                      </div>
                 <div class="row mt">
                      <div class="col-lg-12">
                      <div class="row" style="height:300px">
                          <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
    <div class="item active">
        <h2 style="text-align: center">MONTHLY SALES REPORT</h2>
        <a href="ViewMonthlyRevenueReport">
            <div id="monthlyChart" style="height:250px"></div>
        </a>
    </div>
      
  </div>
  

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
                      </div>
                      </div>
                 </div>     
                 
                   <div class="row mt">
                  <div class="col-lg-12">
                      <div class = "row mtbox">
                          <div class="panel panel-primary">
                                <div class="panel-body">
                                    <a href="ToPendingClientOrders">
                                   <div id="calendar" class="has-toolbar"></div>
                                   </a>
                                </div>
                          </div>
                      </div>
                      </div>
                 
              </div>
                      </div>
            
              <div class="col-lg-offset-1 col-lg-3 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
						<h3>CURRENT ORDER NOTIFICATIONS</h3>
                                        
                      <!-- First Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-info"><i id="inprocess">0</i></span>
                      	</div>
                      	<div class="details">
                      		   <a class="orderTable" href="I">IN PROCESS FOR DELIVERY<br></a>
                      	</div>
                      </div>
                      <!-- Second Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-warning"><i id="forreorder">0</i></span>
                      	</div>
                      	<div class="details">
                      		   <a class="orderTable" href="R">FOR REORDERING<br></a>
                      	</div>
                      </div>
                      <!-- Third Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-success"><i id="delivered">0</i></span>
                      	</div>
                      	<div class="details">
                      		   <a class="orderTable" href="D">DELIVERED<br></a>
                      	</div>
                      </div>
                      <!-- Fourth Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-important"><i id="canceled">0</i></span>
                      	</div>
                      	<div class="details">
                      		   <a class="orderTable" href="C">CANCELED<br></a>
                      	</div>
                      </div>
                      

                       
                
                  
                  
                  
                   <div class="row">
                 
                  </div><!-- /col-lg-9 END SECTION MIDDLE -->
                 
          </section>
      </section>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
	 
  <script src="assets/js/fullcalendar/fullcalendar.min.js"></script>  
  <script src="assets/js/ClientHomePageAjax.js"></script>
    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    <script src="assets/DataTables-1.10.6/media/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    <script>
            $(document).ready(function() {
                
            $.ajax({
            type: "GET",
            url: 'LoadMonthlyRevenue',
            dataType: 'json',
            success: function(data) {
              Morris.Line({
                element: 'monthlyChart',
                data: data,
                xkey: 'label',
                ykeys: ['value'],
                labels: ['Revenue'],
                parseTime:false
                    });
                }
            });
        });
        </script>
    </body>
    
</html>
