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
              <div class="row">
                  <div class="col-sm-12">
                  
                  	<div class="row mtbox">
                  		<div class="col-md-2 col-sm-2 col-md-offset-1 box0">
                  			<div class="box1">
					  			<span class="li_note"></span>
					  			<h3>5</h3>
                  			</div>
					  			<p>5 purchase orders have been put on hold</p>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="li_truck"></span>
					  			<h3>5</h3>
                  			</div>
					  			<p>5 orders have been delivered</p>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="li_stack"></span>
					  			<h3>23</h3>
                  			</div>
					  			<p>You have 23 unread messages in your inbox.</p>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
			  			<span class="li_data"></span>
                	  			<h3>OK!</h3>
                  			</div>  			
                                    <p>The server is working perfectly. Relax & enjoy.</p>
                  		</div>
                  	</div><!-- /row mt -->
                  </div><!-- /col-lg-9 END SECTION MIDDLE -->
                  
                  <div class=" col-lg-4 col-lg-offset-1">
                      <div class="row mtbox">
                          <div class="panel panel-primary">
                              <div class="panel-heading">Order List</div>
                                <div class="panel-body">
                                    <div class="list-group">
                                        <a href="I" class="orderTable list-group-item list-group-item-info">In Process For Delivery<span id="inprocess" class="badge bg-info">0</span></a>
                                        <a href="R"  class="orderTable list-group-item list-group-item-warning">For Reordering<span id="forreorder" class="badge bg-warning">0</span></a>
                                        <a href="D"  class="orderTable list-group-item list-group-item-success">Delivered<span id="delivered" class="badge bg-success">0</span></a>
                                        <a href="C"  class="orderTable list-group-item list-group-item-danger">Canceled<span id="canceled" class="badge bg-important">0</span></a>
                                    </div>
                                </div>
                          </div>
                      </div>
                      </div>
                  <div class="col-lg-offset-1 col-lg-5 col-lg-offset-1">
                      <div class="row mtbox">
                          <div class="panel panel-primary">
                                <div class="panel-body">
                                   <div id="calendar" class="has-toolbar"></div>
                                </div>
                          </div>
                      </div>
                      </div>
                  <div class="col-lg-offset-2 col-lg-8 col-lg-offset-2">
                      <div class="row mtbox">
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
                      </div>
                  
                  
                  </div>
          </section>
      </section>
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
	 
  <script src="assets/js/fullcalendar/fullcalendar.min.js"></script>  

    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    <script src="assets/DataTables-1.10.6/media/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/ClientHomePageAjax.js"></script>
    </body>
    
</html>
