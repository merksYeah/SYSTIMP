<%-- 
    Document   : PurchaseOrderList
    Created on : 04 10, 15, 10:15:56 AM
    Author     : deathman28
--%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
      String currentApp = "/ViewApprovedOrders";
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
          	<h3><i class="fa fa-angle-right"></i> Approved Orders</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
		   <div class="row mt">
                  <div class="col-md-12">
                      <form id="create" action = "ViewPriceModel" class="form-horizontal style-form" method="post">
                          <table id = "what" class="table table-bordered table-striped table-condensed">
	                  	  	  <h4><i class="fa fa-angle-right"></i> Orders</h4>
                                          <hr>
                                          
                                              
                                          </form>
                              <thead>
                              <tr>
                                  <th></th>
                                  <th><i class="fa fa-barcode"></i> S.O.ID</th>
                                  <th class="hidden-phone"><i class="fa fa-truck"></i> Deliver To</th>
                                  <th><i class="fa fa-calendar"></i> Date Issued</th>
                                  <th><i class=" fa fa-calendar"></i> Order Date</th>
                                
                          
                              </tr>
                              </thead>
                              <tbody>
                                  <c:forEach items="${orders}" var="SalesOrder">
                                   <tr>
                                          <td>
                                            <input  type="radio" name="radio" value="<c:out value="${SalesOrder.order_id}"/>">
                                             <input type ="hidden" name ="code" value="A">
                                          </td>
                                          <td><a href="ShowOrderDetails?orderid=<c:out value="${SalesOrder.order_id}"/>"><c:out value="${SalesOrder.order_id}"/></td>
                                          <td><c:out value="${SalesOrder.deliver_to}"/></td>
                                          <td><c:out value="${SalesOrder.date_issued}"/></td>
                                          <td><c:out value="${SalesOrder.order_date}"/></td>
                                       
                                 
                                          
                                  </tr>
                                  </c:forEach>
                                  
                            
                              </tbody>
                          </table>
			 
                          <div class ="form-group" >
                            <div class="col-lg-12">
                                 <input type = "submit" class="btn btn-theme center-block" >
                            </div>
                           </div>	
                      </form>
                      	  
                     
					 
                  </div><!-- /col-md-12 -->
				  
              </div><!-- /row -->
							
                 
					   
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
          		
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      
  </section>
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="confirm" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title">MESSAGE</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p class="block-text" id="message">${errormessage}</p>
		                      </div>
                                      
		                     
		              </div>
		          </div>
   </div>
                                      
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
            var jsAtt = '${errormessage}';
            if(jsAtt !== ''){
            $(window).load(function(){
            $('#confirm').modal('show');
             });    
            }
           
        $(document).ready( function () {
    $('#what').DataTable();
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

