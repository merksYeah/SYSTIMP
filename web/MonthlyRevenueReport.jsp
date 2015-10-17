<%-- 
    Document   : ClientHomePage
    Created on : 10 10, 15, 9:02:37 AM
    Author     : deathman28
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>MONTHLY SALES REPORT</title>
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
             
                  <div class="panel panel-primary">
                      <div class="panel-heading"><h3>MONTHLY SALES REPORT</h3></div>
                                <div class="panel-body">
                                   
                  <div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
                      <div class="row mtbox">
                          <div class="panel panel-primary">
                              <div class="panel-heading">Monthly Revenue</div>
                                <div class="panel-body">
                                    <div id="monthlyChart" style="height: 200px"></div>
                                </div>
                          </div>
                      </div>
                      </div>
               <div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
                      <div class="row mtbox">
                          <div class="panel panel-primary">
                              <div class="panel-heading">Monthly Revenue Breakdown</div>
                                <div class="panel-body">
                                    <table id = "orders" class="table table-bordered table-striped table-condensed">                 
                              <thead>
                              <tr>
                                  <th><i class="fa fa-barcode"></i> Customer Name</th>
                                  <th><i class="fa fa-barcode"></i> S.O.ID</th>
                                  <th><i class="fa fa-barcode"></i> Month</th>
                                  <th class="hidden-phone"><i class="fa fa-truck"></i> Year</th>
                                  <th><i class="fa fa-calendar"></i> Revenue</th>
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
                  </div>
          </section>
      </section>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
	 
  <script src="assets/js/fullcalendar/fullcalendar.min.js"></script>  

    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    <script src="assets/DataTables-1.10.6/media/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    <script>
            $(document).ready(function() {
                 var table = $('#orders').dataTable();
                  table.fnClearTable();
                  table.fnDestroy();
                 $('#orders').dataTable( {
        "ajax": {
            "url":"LoadMonthlyRevenueBreakdown",
            "dataSrc": ''
            
        },
        "columns": [
            { "data": "customerName" },
            { "data": "salesOrderId" },
            { "data": "label" },
            { "data": "year" },
            { "data": "value" }   
        ]
    } );
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
