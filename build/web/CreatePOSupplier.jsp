<%-- 
    Document   : UpdateSupplierList
    Created on : Apr 8, 2015, 3:15:21 PM
    Author     : Number 2
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
	
<link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
   
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <link href="assets/jquery-ui-1.11.4.custom/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
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
          	<h3><i class="fa fa-angle-right"></i> Purchase Order</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
                    <div class="col-lg-12">
                  <div class="form-panel">
                  	
                          <form action = "UpdateSupplierProductList" class="form-horizontal style-form" method="post"> 
                          <div class="form-group">
                              <label class="col-lg-2 col-sm-2 control-label">Employee Id</label>
                                <div class="col-lg-3 col-sm-3 input-group">
                                     <input name = "employeeId" type="text" id="disabledInput" class="form-control" value="<c:out value="${employee.employeeId}"/>" rows="1"  readonly>
                                </div>
                          </div>
                          <div class="form-group">
                              <label class="col-lg-2 col-sm-2 control-label">Product Code</label>
                                <div class="col-lg-3 col-sm-3 input-group">
                                     <input name = "productCode" type="text"  class="form-control" value="<c:out value="${product.productCode}"/>" rows="1"  readonly>
                                </div>
                          </div>
                          <div class="form-group">
                              <label class="col-lg-2 col-sm-2 control-label">Quantity to Order</label>
                                <div class="col-lg-1 col-sm-1 input-group">
                                     <input required name = "quantity" min= "1" type="number" class="form-control"  rows="1">
                                </div>
                          </div>
                           <div class ="form-group" >
                                <label class="col-lg-2 col-sm-2 control-label">Delivery Date</label>
                                <div class = col-lg-2>
                                    <input  required name ="orderdate" id = "datepicker" type = "input" class="form-control" rows="1"  required>
                                </div>
                             </div>
                                       
                           <h4 class="mb"><i class="fa fa-angle-right"></i> Choose Supplier to Order From</h4>             
                                        <div class ="form-group" >
                               <label class="col-lg-2 col-sm-2 control-label">Supplier</label>
                                    <div class="col-lg-3">
					 <select id ="customer_tin" required name ="SupplierId" class="form-control" required>
                                          <c:forEach items="${supplier}" var="Supplier" >
                                            <option value="<c:out value="${Supplier.supplierTin}"/>"><c:out value="${Supplier.supplierName}"/></option>
                                        </c:forEach>
                                        </select>
                                     </div>
                              </div>
                           
                           <div class ="form-group" >
                            <div class="col-lg-12">
                                 <input type = "submit" class="btn btn-theme center-block" >
                            </div>
                           </div>
                          </form>
                            </div>	   
                    </div>
                    </div><!-- col-lg-12-->      
                    </div><!-- /row -->
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      
  </section>
   <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>	   
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    <script src="assets/DataTables-1.10.6/media/js/jquery.dataTables.min.js"></script>
 <script>
        $(document).ready( function () {
    $('#what').DataTable({
      
        "scrollCollapse": true,
        "jQueryUI":       false
    });
    } );
    </script>
	
	<!--custom tagsinput-->
	<script src="assets/js/jquery.tagsinput.js"></script>
	
	<!--custom checkbox & radio-->
	
	
	
	<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	
  <script>
  $(document).ready(function() {
    $('#datepicker').datepicker({
		minDate: 0,						
        beforeShowDay: noSunday
      });

      function noSunday(date){
          var day = date.getDay();
                      return [(day > 0 && day < 6), ''];
      }; 
	
  });
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