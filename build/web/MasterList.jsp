<%-- 
    Document   : PurchaseOrderList
    Created on : 04 10, 15, 10:15:56 AM
    Author     : deathman28
--%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
      String currentApp = "/ViewMasterList";
%>
<%@include file="security.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>CRIPSI</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/DataTables-1.10.6/media/css/jquery.dataTables.min.css">

  </head>

  <body>

  <section id="container" >
      <%@include file="LoadTemplate.jsp" %>
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                            <div class="panel panel-primary">
                    <div class="panel-heading"><h3>All Sales Orders</h3></div>
                  <div class="panel-body">
		   <div class="row mt">
                  <div class="col-md-12">
                          <table id = "what" class="table table-bordered table-striped table-condensed">
	                  	  	  <h4><i class="fa fa-angle-right"></i> Orders</h4>
	                  	  	  <hr>
                              <thead>
                              <tr>
                                  <th><i class="fa fa-barcode"></i> S.O.ID</th>
                                  <th class="hidden-phone"><i class="fa fa-truck"></i> Customer Name</th>
                                  <th class="hidden-phone"><i class="fa fa-truck"></i> Deliver To</th>
                                  <th><i class="fa fa-calendar"></i> Date Issued</th>
                                  <th><i class=" fa fa-calendar"></i> Specified Delivery Date</th>
                                  <th><i class=" fa fa-calendar"></i> Delivery Date</th>
                                   <th><i class=" fa fa-calendar"></i> Status</th>
                                  
                              </tr>
                              </thead>
                              <tbody>
                                  <c:forEach items="${orders}" var="SalesOrder">
                                   <tr>
                                          <td><a href="ShowOrderDetails?orderid=<c:out value="${SalesOrder.order_id}"/>"><c:out value="${SalesOrder.order_id}"/></td>
                                           <td><c:out value="${SalesOrder.customer_name}"/></td>
                                          <td><c:out value="${SalesOrder.deliver_to}"/></td>
                                          <td><c:out value="${SalesOrder.date_issued}"/></td>
                                          <td><c:out value="${SalesOrder.order_date}"/></td>
                                          <td><c:out value="${SalesOrder.date_delivered}"/></td>
                                           <c:choose>
                                    <c:when test="${SalesOrder.statusCode eq 'In Process For Delivery'}">
                                        <td><span class="label label-info">IN PROCESS FOR DELIVERY</span></td>
                                    </c:when>
                                      <c:when test="${SalesOrder.statusCode eq 'Delivered'}">
                                        <td><span class="label label-success">DELIVERED</span></td>
                                    </c:when>
                                    <c:when test="${SalesOrder.statusCode eq 'For Reordering'}">
                                        <td><span class="label label-warning">FOR REORDERING</span></td>
                                    </c:when>
                                     <c:when test="${SalesOrder.statusCode eq 'Pending for Approval'}">
                                        <td><span class="label label-default">PENDING FOR APPROVAL</span></td>
                                    </c:when>
                                    <c:otherwise>
                                       <td><span class="label label-danger">CANCELED</span></td>
                                    </c:otherwise>
                                    </c:choose>
                                          
                                          
                                  </tr>
                                  </c:forEach>
                                  
                            
                              </tbody>
                          </table>
						  
                     
					 
                  </div><!-- /col-md-12 -->
				  
              </div><!-- /row -->
							
                 
					   
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
                </div>	
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!--custom switch-->
	<script src="assets/js/bootstrap-switch.js"></script>
	
	<!--custom tagsinput-->
	<script src="assets/js/jquery.tagsinput.js"></script>
	
	<!--custom checkbox & radio-->
	
	<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	
	<script src="assets/DataTables-1.10.6/media/js/jquery.dataTables.min.js"></script>
        <script>
        $(document).ready( function () {
   var table = $('#what').DataTable( {
        "order": [[ 3, "desc" ]]
            } );

    } );
    </script>
	<script src="assets/js/form-component.js"></script>    
     
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>

