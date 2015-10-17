<%-- 
    Document   : PurchaseOrderList
    Created on : 04 10, 15, 10:15:56 AM
    Author     : deathman28
--%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
      String currentApp = "/ViewReqSlipList";
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
                    <div class="panel-heading"><h3>Update Purchase Order Status</h3></div>
                  <div class="panel-body">
		   <div class="row mt">
                  <div class="col-lg-12">
                       <form id="create" action = "UpdatePurchaseOrderStatus" class="form-horizontal style-form" method="post">
                          <table id = "what" class="table table-bordered table-striped table-condensed">
	                  	  	  <h4><i class="fa fa-angle-right"></i> Orders</h4>
	                  	  	  <hr>
                              <thead>
                              <tr>
                                  <th></th>
                                  <th><i class="fa fa-barcode"></i> P.O.ID</th>
                                  <th><i class="fa fa-calendar"></i> Date Issued</th>
                                  <th><i class=" fa fa-calendar"></i> Specified Delivery Date</th>
                                   <th><i class=" fa fa-calendar"></i> Status</th>
                                  
                              </tr>
                              </thead>
                              <tbody>
                                  <c:forEach items="${orders}" var="PurchaseOrder">
                                   <tr>
                                       <td>
                                            <input  type="radio" name="radios" value="<c:out value="${PurchaseOrder.POID}"/>">
                                          </td>
                                          <td><a href="ShowOrderDetails?orderid=<c:out value="${PurchaseOrder.POID}"/>"><c:out value="${PurchaseOrder.POID}"/></td>
                                          <td><c:out value="${PurchaseOrder.date_issued}"/></td>
                                          <td><c:out value="${PurchaseOrder.order_date}"/></td>
                                         <c:choose>
                                    <c:when test="${PurchaseOrder.status eq 'In Process For Delivery'}">
                                        <td class="status"><span class="label label-info">IN PROCESS FOR DELIVERY</span></td>
                                    </c:when>
                                      
                                   
                                     <c:when test="${PurchaseOrder.status eq 'Pending for Approval'}">
                                        <td class="status"><span class="label label-default">PENDING FOR APPROVAL</span></td>
                                    </c:when>
                                   
                                    </c:choose>
                                          
                                          
                                  </tr>
                                  </c:forEach>
                                  
                            
                              </tbody>
                          </table>
				 <div class="form-group">
				<label class="col-lg-2 col-sm-2 control-label">Status</label>
                                    <div class="col-lg-10">
					<label class="radio-inline">
                                            <input disabled required type="radio" name="inlineRadioOptions" id="inlineRadio1" value="I"> APPROVED
					</label>
					<label class="radio-inline">
                                            <input disabled required type="radio" name="inlineRadioOptions" id="inlineRadio2" value="C"> CANCELED
					</label>
                                        <label class="radio-inline">
                                            <input disabled required type="radio" name="inlineRadioOptions" id="inlineRadio3" value="D"> DELIVERED
					</label>
                                        <span id="optionmessage" class="help-block">
                                        </span>
                                    </div>
                            </div>	 		  
                             <div class ="form-group" >
                            <div class="col-lg-12">
                                  <button id="proceed" data-target="#confirm" data-toggle="modal" type = "button" class="btn btn-round btn-theme center-block">
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
		                          <button id="submit" type = "button" class="btn btn-round btn-theme">
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
		                          <h4 id="msgHeader" class="modal-title">MESSAGE</h4>
		                      </div>
		                      <div  class="modal-body">
		                          <p id ="endMessage"></p>
		                      </div>
		                     
		                  </div>
		              </div>
		          </div>           s
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
        "order": [[ 2, "desc" ]]
        } );
    
            $("#purchaseOrders").addClass("dcjq-parent active");
            $("#purchaseOrders").siblings("ul").show();
            $("#purchaseOrders").siblings("ul").addClass("active");

    $('#what tbody').on('click', 'tr', function(){
        var data = table.row( this ).data();
        var status = $(data[4]).text();
        if( status === 'IN PROCESS FOR DELIVERY'){
            $("#inlineRadio1").attr('disabled',true);
            $("#inlineRadio2").attr('disabled',false);
            $("#inlineRadio3").attr('disabled',false);
        }
        else if(status === 'PENDING FOR APPROVAL'){
            $("#inlineRadio1").attr('disabled',false);
            $("#inlineRadio2").attr('disabled',false);
            $("#inlineRadio3").attr('disabled',true);
        }
    });
     $('#what').on( 'page.dt', function () {
                     $("#inlineRadio1").attr('disabled',true);
                     $("#inlineRadio2").attr('disabled',true);
                     $("#inlineRadio3").attr('disabled',true);
                     $("#create").trigger("reset");
                    } );
                    
     $('#proceed').click(function(){
                 var orderid = $("input[type=radio]:checked").val();
                 var status = $("input[name=inlineRadioOptions]:checked").parent().text();
                    $('#message').text("Update Sales Order: " + orderid +" to " + status);
            });
            
      $('#submit').click(function(){
                  $.ajax({
            method: "POST",
            url: $("#create").attr('action'),
            data: $("#create").serialize()
            })
            .done(function(  ) {
                var status = $("input[name=inlineRadioOptions]:checked").parent().text();
               $('#confirm').modal('hide'); 
               $('#msgHeader').text("SUCCESSFUL");
               $("#endMessage").text("ORDER SUCCESSFULLY UPDATED TO "+ status + "!");
               $("#message2").modal('show');
               if($("input[name=inlineRadioOptions]:checked").val() === 'I'){
                   $("input[type=radio]:checked").parent().siblings(".status").text("In Process For Delivery");
               }
               else{
                var row = table.row($("input[type=radio]:checked").parent().parent());
                row.remove();
                table.draw();
               }
                
               $('#create').trigger("reset");
              
            });
          return true;
             });
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

