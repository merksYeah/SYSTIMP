<%-- 
    Document   : PurchaseOrderList
    Created on : 04 10, 15, 10:15:56 AM
    Author     : deathman28
--%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
      String currentApp = "/ToForReorder";
%>
<%@include file="security.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    

    <title>CRIPSI</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
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
                    <div class="panel-heading"><h3>Orders being Processed For Re Stocking</h3></div>
                  <div class="panel-body">
		   <div class="row mt">
                  <div class="col-md-12">
                      <form id="create" action = "UpdateDeliveryDate" class="form-horizontal style-form" method="post">
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
                                  <th><i class=" fa fa-calendar"></i> Specified Date of Delivery</th>
                                
                          
                              </tr>
                              </thead>
                              <tbody>
                                  <c:forEach items="${orders}" var="SalesOrder">
                                   <tr>
                                          <td>
                                            <input  type="radio" name="radio" value="<c:out value="${SalesOrder.order_id}"/>">
                                            <input type ="hidden" name ="code" value="I">
                                          </td>
                                          <td><a href="ShowOrderDetails?orderid=<c:out value="${SalesOrder.order_id}"/>"><c:out value="${SalesOrder.order_id}"/></td>
                                          <td><c:out value="${SalesOrder.deliver_to}"/></td>
                                          <td><c:out value="${SalesOrder.date_issued}"/></td>
                                          <td><c:out value="${SalesOrder.order_date}"/></td>
                                       
                                 
                                          
                                  </tr>
                                  </c:forEach>
                                  
                            
                              </tbody>
                          </table>
			  <div class="form-group">
				<label class="col-lg-2 col-sm-2 control-label">Status</label>
                                    <div class="col-lg-10">
					<label class="radio-inline">
                                            <input required type="radio" name="inlineRadioOptions" id="inlineRadio1" value="A"> Update Delivery Date
					</label>
					<label class="radio-inline">
                                            <input required type="radio" name="inlineRadioOptions" id="inlineRadio2" value="C"> Cancel Order
					</label>
                                        <span id="optionmessage" class="help-block">
                                        </span>
                                    </div>
                            </div>	 
                         <div class ="form-group" >
                            <div class="col-lg-12">
                                  <button id="proceed"  type = "button" class="btn btn-round btn-theme center-block">
                                                Proceed
                                   </button>
                            </div>
                           </div>		
                      </form>
                      	  
                     
					 
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
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="statusMessage" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 id="endHeader"class="modal-title">MESSAGE</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p class="block-text" id="endMessage"></p>
		                      </div>
                                      
		                      <div class="modal-footer">
		                          <button id="cancel" data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
		                          <button id="submit" type = "button" class="update btn btn-round btn-theme">
                                                Submit
                                          </button>
		                      </div>
		              </div>
		          </div>
   </div>
      <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="doneModal" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 id="doneHeader"class="modal-title">MESSAGE</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p class="block-text" id="doneMessage"></p>
		                      </div>
                                      
		                      <div class="modal-footer">
		                          <button id="cancel" data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
		                          <button id="submit" type = "button" class="update btn btn-round btn-theme">
                                                Submit
                                          </button>
		                      </div>
		              </div>
		          </div>
   </div>
    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="deliveryDate" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 id="deliveryTitle" class="modal-title"></h4>
		                      </div>
		                      <div class="modal-body">
                                          <table id = "deliveryTable"class="table table-bordered table-striped table-condensed">
                                              <thead>
                                              </thead>
                                              <tfooter>
                                                  <th>New Delivery Date</th>
                                                  <th><input  form ="create" name ="orderdate" id = "datepicker" type = "input" class="form-control" rows="1"  required></th>
                                              </tfooter>
                                          </table>
		                      </div>
		                      <div class="modal-footer">
		                          <button id="cancel" data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
		                          <button id="submit" type = "button" class="update btn btn-round btn-theme">
                                                Submit
                                          </button>
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
        $(document).ready( function () {
    var table =  $('#what').DataTable( {
        "order": [[ 3, "desc" ]]
    } );
    $('#datepicker').datepicker({
		minDate: 0,						
        beforeShowDay: noSunday
      });

      function noSunday(date){
          var day = date.getDay();
                      return [(day > 0 && day < 6), ''];
      }; 
        $("#proceed").click(function(){
            var action = $("input[name=inlineRadioOptions]:checked").val();
            var orderId = $("input[name=radio]:checked").val();
            if(action === 'A'){
                $("#deliveryTitle").text("INPUT NEW DELIVERY DATE: ORDER# " + orderId);
                 $("#deliveryDate").modal("show");
            }
            else{
                $("#endHeader").text("CANCELLING: ORDER# " + orderId);
                $("#endMessage").text("Are you sure you want to cancel order " + orderId + "?");
                $("#statusMessage").modal("show");
            }
        });
        
        $(".update").click(function(){
             var action = $("input[name=inlineRadioOptions]:checked").val();
             var orderId = $("input[name=radio]:checked").val();
             $.ajax({
            method: "POST",
            url: $("#create").attr('action'),
            data: $("#create").serialize()
            })
            .done(function(  ) {
                if(action === 'C'){
                    $("#statusMessage").modal("hide");
                    $("#doneHeader").text("CANCELLING: ORDER# " + orderId);
                    $("#donedMessage").text("Are you sure you want to cancel order " + orderId + "?");
                    $("#doneModal").modal("show");
                }
                else{
                    $("#deliveryTitle").modal("hide");
                    $("#doneHeader").text("UPDATED DELIVERY DATE: ORDER# " + orderId);
                    $("#doneMessage").text("Successfully updated delivery date of order#" + orderId + " and is now in process for delivery");
                     $("#doneModal").modal("show");
                }
               
            });
        });
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

