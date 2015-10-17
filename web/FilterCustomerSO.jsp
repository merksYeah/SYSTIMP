<%-- 
    Document   : NewPurchaseOrder
    Created on : 03 8, 15, 9:21:52 AM
    Author     : deathman28
--%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
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
          	<h3><i class="fa fa-angle-right"></i> Show Customer Sales Orders</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
                    <div class="col-lg-9">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Order Filters</h4>
                          <form action = "FilterSalesOrders" class="form-horizontal style-form" method="post"> 
                             <div class ="form-group" >
                               <label class="col-lg-2 col-sm-2 control-label">Customer Filter</label>
                                    <div class="col-lg-10">
					<label class="radio-inline">
                                            <input required type="radio" name="inlineRadioOptions" id="inlineRadio1" value="1"  onclick="hideCustomerName()"> Show All Customers
					</label>
					<label class="radio-inline">
                                            <input required type="radio" name="inlineRadioOptions" id="inlineRadio2" value="0"  onclick="hideCustomerName()"> Choose Customer
					</label>
                                        <span id="optionmessage" class="help-block">
                                        </span>
                                    </div>
                             </div>
                              <div class ="form-group" >
                               <label class="col-lg-2 col-sm-2 control-label">Customer Name</label>
                                    <div class="col-lg-3">
					 <select id ="customer_tin" disabled name ="address" class="form-control" required>
                                             <option ></option>
                                             <c:forEach items="${customers}" var="Customer">
                                                 <option value="<c:out value="${Customer.customerTin}"/>"><c:out value="${Customer.clientName}"/></option>
                                             </c:forEach>
                                        </select>
                                     </div>
                              </div>
                                        
                            
                            
                                          <div class ="form-group" >
                                            <div class="col-lg-12">
                                                <input type = "submit" class="btn btn-theme center-block">
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
  $(document).ready(function() {
    $('#what').dataTable( 
        {
            "scrollY":        "300px",
            "scrollCollapse": true,
            "paginate" : false,
            "bPaginate": false

        } );
    } );

function hideCustomerName(){
    if ($("#inlineRadio2").is(":checked")) 
    {
        $("#customer_tin").removeAttr("disabled");
    }
    if ($("#inlineRadio1").is(":checked")) 
    {
        $("#customer_tin").attr("disabled","disabled");
    }

}
function hideStatusName(){
        if ($("#inlineRadio4").is(":checked")) 
            {
                $("#status_name").removeAttr("disabled");
            }
        if ($("#inlineRadio3").is(":checked")) 
            {
                $("#status_name").attr("disabled","disabled");
            }

    }
    
    $('#status_name').on('change', function() {
        $("#inlineRadio4").val($(this).val());
    });
    
      $('#customer_tin').on('change', function() {
        $("#inlineRadio2").val($(this).val());
    });
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
