<%-- 
    Document   : PurchaseOrderList
    Created on : 04 10, 15, 10:15:56 AM
    Author     : deathman28
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                <div class="panel-heading"><h3>Order Details</h3></div>
                  <div class="panel-body">
		   <div class="row mt">
                  <div class="col-md-12">
                          <table id = "what" class="table table-bordered table-striped table-condensed">
                                   <h4><i class="fa fa-angle-right"></i>Sales Order: <c:out value="${order.order_id}"/> </h4>
                           	  
                              
	                  	  	  <hr>
                              <thead>
                              <tr>
                                  <th><i class="fa fa-barcode"></i> Prouduct Name</th>
                                  <th class="hidden-phone"><i class="fa fa-truck"></i> Order Quantity</th>
                                  <th class="hidden-phone"><i class="fa fa-truck"></i> Price Each</th>
                              </tr>
                              </thead>
                              <tbody>
                                   <c:forEach items="${products}" var="product">
                                   <tr>
                                          <td><c:out value="${product.productName}"/></td>
                                          <td><c:out value="${product.quantity}"/> <c:out value="${product.packageType}"/></td>
                                          <td><c:out value="${product.MSRP}"/></td>
                                  </tr>
                                  </c:forEach>
                                  
                            
                              </tbody>
                              <tfoot>
                              <th>Comments</th>
                              <th><c:out value="${order.comments}"/></th>
                              </tfoot>
                          </table>
				<input class ="btn btn-round center-block btn-theme" type="button" value="Back" onclick="javascript:history.go(-1)">		  
                     
					 
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

