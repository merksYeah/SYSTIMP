<%-- 
    Document   : PurchaseOrderList
    Created on : 04 10, 15, 10:15:56 AM
    Author     : deathman28
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
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
          	<h3><i class="fa fa-angle-right"></i> Update Order Details</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
		   <div class="row mt">
                  <div class="col-md-12">
                      <form id="create" action = "UpdateDeliveredOrders" class="form-horizontal style-form" method="post">
                      <table id = "what" class="table table-bordered table-striped table-condensed">
                                   <h4><i class="fa fa-angle-right"></i>Sales Order: <c:out value="${order.order_id}"/> </h4>
                         
                                     <input name = "orderid" type="hidden" value="<c:out value="${order.order_id}"/>">
                             
                              
	                  	  	  <hr>
                              <thead>
                              <tr>
                                  <th></th>
                                  <th></th>
                                  <th><i class="fa fa-barcode"></i> Prouduct Name</th>
                                  <th class="hidden-phone"><i class="fa fa-truck"></i> Order Quantity</th>
                                   <th class="hidden-phone"><i class="fa fa-truck"></i> Fulfilled Quantity</th>
                              </tr>
                              </thead>
                              <tbody>
                                   <c:forEach items="${products}" var="product" varStatus="status">
                                   <tr>
                                           <td><input type="checkbox" name="checkedRows" value="${product.productCode}" onclick="var input = document.getElementById('<c:out value="${status.count}" />'); if(this.checked){ input.disabled = false; input.focus();}else{input.disabled=true;}"></td>
                                          <td><input type="number" name="orderquantity" id = "<c:out value="${status.count}" />" min = "0" max = "<c:out value="${product.quantity - product.fulfilledQuantity}" />" disabled/></td>
                                          <td><c:out value="${product.productName}"/></td>
                                          <td> 
                                              <c:out value="${product.quantity}"/>
                                              <input name = "quantity" type="hidden"  value="<c:out value="${product.quantity}"/>">
                                            </td>
                                           <td><c:out value="${product.fulfilledQuantity}"/></td>
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

