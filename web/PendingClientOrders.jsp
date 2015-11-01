<%-- 
    Document   : PurchaseOrderList
    Created on : 04 10, 15, 10:15:56 AM
    Author     : deathman28
--%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
      String currentApp = "/ToPendingClientOrders";
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
                    <div class="panel-heading"><h3>Pending Client Orders</h3></div>
                  <div class="panel-body">
		   <div class="row mt">
                  <div class="col-md-12">
                      <form id="create" action = "UpdatePendingOrders" class="form-horizontal style-form" method="post">
                          <table id = "what" class="table table-bordered table-striped table-condensed">
	                  	  	  <h4><i class="fa fa-angle-right"></i> Orders</h4>
                                          <hr>
                                          
                                              
                                          </form>
                              <thead>
                              <tr>
                                  <th></th>
                                 
                                  <th><i class="fa fa-barcode"></i> Customer Name</th>
                                  <th><i class="fa fa-barcode"></i> S.O.ID</th>
                                  <th class="hidden-phone"><i class="fa fa-truck"></i> Deliver To</th>
                                  <th><i class="fa fa-calendar"></i> Date Issued</th>
                                  <th><i class=" fa fa-calendar"></i> Order Date</th>
                                     <th><i class="fa fa-barcode"></i>Inventory Status</th>
                                
                          
                              </tr>
                              </thead>
                              <tbody>
                                  <c:forEach items="${orders}" var="SalesOrder">
                                   <tr>
                                     
                                          <td>
                                            <input  required class="radOrder" type="radio" name="radio" value="<c:out value="${SalesOrder.order_id}"/>">
                                          </td>
                                         
                                          <td><c:out value="${SalesOrder.customer_name}"/></td>
                                          <td><a href="ShowOrderDetails?orderid=<c:out value="${SalesOrder.order_id}"/>"><c:out value="${SalesOrder.order_id}"/></td>
                                          <td><c:out value="${SalesOrder.deliver_to}"/></td>
                                          <td><c:out value="${SalesOrder.date_issued}"/></td>
                                          <td><c:out value="${SalesOrder.order_date}"/></td>
                                    <c:choose>
                                    <c:when test="${SalesOrder.stock_status eq 'O'}">
                                        <td class="stockLevel"><span class="label label-danger">INSUFFICIENT STOCK</span></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="stockLevel"><span class="label label-success">SUFFICIENT STOCK</span></td>
                                    </c:otherwise>
                                    </c:choose>
                                 
                                          
                                  </tr>
                                  </c:forEach>
                                  
                            
                              </tbody>
                          </table>
			 <div class="form-group">
				<label class="col-lg-2 col-sm-2 control-label">Status</label>
                                    <div class="col-lg-10">
					<label class="radio-inline">
                                            <input disabled required type="radio" name="inlineRadioOptions" id="inlineRadio1" value="I"> Approve
					</label>
                                        <label class="radio-inline">
                                            <input disabled required type="radio" name="inlineRadioOptions" id="inlineRadio3" value="R"> For Re stocking
					</label>
					<label class="radio-inline">
                                            <input disabled required type="radio" name="inlineRadioOptions" id="inlineRadio2" value="C"> Canceled
					</label>
                                        <span id="optionmessage" class="help-block">
                                        </span>
                                    </div>
                            </div>
                           <div class ="form-group" >
                                <label class="col-lg-2 col-sm-2 control-label">Comments</label>
                                <div class="col-lg-5">
                                    <textarea name = "comments" class="form-control"></textarea>
                                </div>
                             </div>
                          <div class ="form-group" >
                                            <div class="col-lg-12">
                                                <button id="proceed" type = "button" class="btn btn-round btn-theme center-block">
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
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="confirm" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 id="confirmmessage" class="modal-title">MESSAGE</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p class="block-text" id="message"></p>
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
      <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="statusChange" class="modal fade">
		              <div class="modal-dialog">
	x	                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 id="statusheader" class="modal-title">MESSAGE</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p class="block-text" id="statusmessage"></p>
                                          
		                      </div>
                                      
                           
		              </div>
		          </div>
   </div>
      
                             <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="priceModel" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 id="priceTitle" class="modal-title">INPUT PRICE MODEL: ORDER # </h4>
		                      </div>
		                      <div class="modal-body">
                                          <table id = "priceEach"class="table table-bordered table-striped table-condensed">
                                              <thead>
                                                <th>Product</th>
                                                <th>Quantity</th>
                                                <th>Price Each</th>
                                              </thead>
                                              <tbody>
                                                  
                                              </tbody>
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
    <script type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
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
            $("#pendingOrders").addClass("dcjq-parent active");
            $("#pendingOrders").siblings("ul").show();
            $("#pendingOrders").siblings("ul").addClass("active");
              var table = $('#what').DataTable( {
        "order": [[ 2, "desc" ]]
            } );

            $('#what tbody').on('click', 'tr', function(){
             
                var data = table.row( this ).data();
                if($(data[6]).text() === 'SUFFICIENT STOCK'){
                    $("#inlineRadio1").attr('disabled',false);
                    $("#inlineRadio2").attr('disabled',false);
                    $("#inlineRadio3").attr('disabled',true);
                }
                else if($(data[6]).text() === 'INSUFFICIENT STOCK'){
                $("#inlineRadio1").attr('disabled',true);
                $("#inlineRadio2").attr('disabled',false);
                $("#inlineRadio3").attr('disabled',false);
                }
                 });
                 
               $('#what').on( 'page.dt', function () {
                     $("#inlineRadio1").attr('disabled',true);
                     $("#inlineRadio2").attr('disabled',true);
                     $("#inlineRadio3").attr('disabled',true);
                     $("#create").trigger("reset");
                    } );
                    
        $('#proceed').click(function(){
            var orderid = $("input[name=radio]:checked").val();
            var status = $("input[name=inlineRadioOptions]:checked").val();
            if(status === "C"){
                $("#confirm").modal("show");
                $("#confirmmessage").text("CANCELLING: ORDER #" + orderid);
                $("#message").text("Are you sure you want to cancel this order?");
               
            }
            else{
        $.ajax({
            method: "GET",
            url: "LoadPriceModel?orderid=" + orderid,
            dataType:'json'
            })
            .done(function(data){
               $("#priceModel").modal("show");
               $("#priceEach tbody").children().remove();
               $("#priceTitle").text("INPUT PRICE MODEL: ORDER #"+orderid);
               $.each(data, function(index, item) {
                    $("#priceEach tbody").append("<tr><td>"+item.productName+"</td><td>"+item.quantity+" " + item.packageType+ "</td><td><input form='create' name='prices' type='number'></td></tr>")
                                         .append("<input form='create' name='prodCodes' type='hidden' value=" + item.productCode + ">");
                });
            });
            }
         });
         
         $(".update").click(function(){
              $("#confirm").modal("hide");
             var status = $("input[name=inlineRadioOptions]:checked").val();
             var orderid = $("input[name=radio]:checked").val();
             $.ajax({
            method: "POST",
            url: $("#create").attr("action"),
            data:$("#create").serialize()
            })
            .done(function(data){
                $("#statusheader").text("ORDER #" + orderid); 
            if(status === 'I'){
                $("#priceModel").modal("hide");
                 $("#statusmessage").text("ORDER STATUS CHANGED TO APPROVED!");
            }
            else if(status === 'R'){
                $("#priceModel").modal("hide");
                 $("#statusmessage").text("ORDER STATUS CHANGED TO FOR RE STOCKING!");
            }
            else{
                 $("#statusmessage").text("ORDER STATUS CHANGED TO CANCELED!");
            }
           
            var row = table.row($("input[name=radio]:checked").parent().parent());
            row.remove();
            table.draw();   
             $("#create").trigger("reset");
             $("#statusChange").modal("show");
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

