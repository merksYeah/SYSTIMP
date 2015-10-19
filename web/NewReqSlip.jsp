<%-- 
    Document   : NewPurchaseOrder
    Created on : 03 8, 15, 9:21:52 AM
    Author     : deathman28
--%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        String currentApp = "/ToReqSlip";
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
          
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
                    <div class="col-lg-12">
                        	<div class="panel panel-primary">
                    <div class="panel-heading"><h3>NEW PURCHASE ORDER</h3></div>
                  <div class="panel-body">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Order Information</h4>
                          <form id="create" action = "CreateReqSlip" class="form-horizontal style-form" method="post"> 
                            <div class ="form-group" >
                                <label class="col-lg-2 col-sm-2 control-label">Delivery Date</label>
                                <div class = col-lg-2>
                                    <input  name ="orderdate" id = "datepicker" type = "input" class="form-control" rows="1"  required>
                                </div>
                             </div>
                            <div class ="form-group" >
                                <label class="col-lg-2 col-sm-2 control-label">Comments</label>
                                <div class = col-lg-6>
                                    <input id="comments"  type = "input" class="form-control" rows="1">
                                </div>
                             </div>
                             <h4 class="mb"><i class="fa fa-angle-right"></i> Products to Order</h4>
						<table id = "what"class="table table-bordered table-striped table-condensed">
                                                        <hr>
                                                            <thead>
                                                                <tr>
                                                                    <th>Choose Product</th>
                                                                    <th>Order Quantity</th>
                                                                    
                                                                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> Product Name</th>
                                                                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> Package Type</th>
                                                                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> Net Weight</th>
                                                                    <th><i class="fa fa-bookmark"></i> Quantity In Stock</th>
                                                              
                                                                </tr>
                                                            </thead>
                                                            
                                                            <tbody>
                                                                <c:forEach items="${products}" var="product" varStatus="status">
                                                                    <tr>
                                                                        <td><input type="checkbox" name="checkedRows" value="${product.productCode}" onclick="var input = document.getElementById('<c:out value="${status.count}" />'); if(this.checked){ input.disabled = false; input.focus();}else{input.disabled=true;}"></td>
                                                                        <td><input type="number" name="orderquantity" id = "<c:out value="${status.count}" />"disabled/></td>
                                                                    
                                                                        <td><c:out value="${product.productName}"/></td> 
                                                                        <td><c:out value="${product.packageType}"/></td> 
                                                                        <td><c:out value="${product.netweight}"/></td> 
                                                                        <td><c:out value="${product.quantity}"/></td>
                                                                       
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                        </table>
                                          <div class ="form-group" >
                                            <div class="col-lg-12">
                                                <button data-target="#confirm" data-toggle="modal" type = "button" class="btn btn-round btn-theme center-block">
                                                Proceed
                                                </button>
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
                             <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="confirm" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title">Proceed to Submitting</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p id="message">Is the information entered below correct?</p>
		                      </div>
		                      <div class="modal-footer">
		                          <button id="cancel" data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
		                          <button id="submit" type = "submit" class="btn btn-round btn-theme">
                                                Submit
                                          </button>
		                      </div>
		                  </div>
		              </div>
		          </div>
                          <div aria-hidden="true" aria-labelledby="myModalLabel2" role="dialog" tabindex="-1" id="message2" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title">MESSAGE</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p >${message}</p>
		                      </div>
		                     
		                  </div>
		              </div>
		          </div>
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
  $('#submit').click(function(){
      if($('#datepicker').val()===""){
          $('#confirm').modal('hide');
          $('#datepicker').css({"border-color": "RED"});
       if(!$("input[name='inlineRadioOptions']:checked").val()){
          $('#confirm').modal('hide');
          $('#optionmessage').html("*REQUIRED FIELD").css("color","red").val();
          return false;
         }
          return false;
      }
     
      else{
          $('#create').submit();
          return true;
      }
      
  });
    
     var jsAtt = '${message}';
            if(jsAtt !== ''){
            $(window).load(function(){
            $('#message2').modal('show');
             });    
            }
    
  $(document).ready(function() {
    $('#what').dataTable( {
        "scrollY":        "300px",
        "scrollCollapse": true,
        "paginate" : false,
        "bPaginate": false,
         "order":[[2,"asc"]]
       
    } );
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
