<%-- 
    Document   : NewPurchaseOrder
    Created on : 03 8, 15, 9:21:52 AM
    Author     : deathman28
--%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        String currentApp = "/AddProduct";
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
                        <div class ="panel panel-primary">
                    <div class="panel-heading"><h3>ADD PRODUCT</h3></div>
                  <div class="panel-body">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Product Information</h4>
                          <form id="create" action = "AddProduct" class="form-horizontal style-form" method="post"> <div class ="form-group" >
                                <label class="col-lg-2 col-sm-2 control-label">Product Code</label>
                                <div class = col-lg-3>
                                    <input placeholder="Ex.AR99999999" data-mask="aa99999999" name = "productcode" type="text"  class="form-control" rows="1">
                                    <span class="help-block">
                                        "Ex: AR99999999"
                                    </span>
                                </div>
                             </div>
                          <div class="form-group">
                              <label class="col-lg-2 col-sm-2 control-label">Product Name</label>
                                <div class="col-lg-4">
                                    <input type ="text" name ="productname" class="form-control" required>
                                </div>
                          </div>
                           <div class="form-group">
				<label class="col-lg-2 col-sm-2 control-label">Package Type</label>
                                    <div class="col-lg-2">
					<select name ="packagetype" class="form-control" required>
                                          <option value="Bag">Bag</option>
                                          <option value="Drum">Drum</option>
                                          <option value="Container">Container</option>
                                         </select>
                                    </div>
                            </div>
                            <div class ="form-group" >
                                <label class="col-lg-2 col-sm-2 control-label">Initial Stock</label>
                                <div class = col-lg-2>
                                    <input  name ="quantity" type = "number" class="form-control" min="1" required>
                                </div>
                             </div>
                            <div class ="form-group" >
                                <label class="col-lg-2 col-sm-2 control-label">Net Weight Per Package</label>
                                <div class = col-lg-2>
                                   <input type="text" class="form-control" name="netweight" pattern="[0-9]+(\.[0-9][0-9]?)?" required>
                                   <span class="help-block">
                                        "Ex: 0.22,12.33"
                                    </span>
                                </div>
                             </div>
                             <div class ="form-group" >
                                <label class="col-lg-2 col-sm-2 control-label">Minimum Suggested Retail Price</label>
                                <div class = col-lg-2>
                                   <input name ="msrp" class="form-control" type="text" pattern="^\\$?(([1-9](\\d*|\\d{0,2}(,\\d{3})*))|0)(\\.\\d{1,2})?$">
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
                            </div>	   
                    </div>
                    </div><!-- col-lg-12-->      
                    </div><!-- /row -->
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      
  </section>
      <div aria-hidden="true" aria-labelledby="myModalLabel2" role="dialog" tabindex="-1" id="successmodal" class="modal fade">
            <div class="modal-dialog">
		<div class="modal-content">
		    <div class="modal-header">
		       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		       <h4 id="successheader" class="modal-title">MESSAGE</h4>
		    </div>
		    <div class="modal-body">
		       <p id="successmessage"></p>
                    </div>                
		</div>
            </div>
        </div>
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="confirm" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title">Proceed to Submitting</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p id="message">Is the information entered below correct?</p>
                                          <table id = "productPreview" class="table table-bordered table-striped table-condensed">
                                              <thead>
                                              </thead>
                                              <tbody>
                                                  
                                              </tbody>
                                              <tfoot>
                                                  <tr>
                                                      <th>Product Code:</th>
                                                      <th id="pCode">Hello</th>
                                                  </tr>
                                                  <tr>
                                                       <th>Product Name</th>
                                                      <th id="pName"></th>
                                                  </tr>
                                                   <tr>
                                                       <th>Package Type </th>
                                                      <th id="pType"></th>
                                                  </tr>
                                                   <tr>
                                                       <th>Initial Stock </th>
                                                      <th id="initStock"></th>
                                                  </tr>
                                                   <tr>
                                                       <th>Net Weight Per Package </th>
                                                      <th id="netWeight"></th>
                                                  </tr>
                                              </tfoot>
                                          </table>
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
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>	   
    <script src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    <script src="assets/DataTables-1.10.6/media/js/jquery.dataTables.min.js"></script>
            
 <script>
     $(document).ready(function(){
         $("#proceed").click(function(){
             var productCode = $("input[name=productcode]").val();
             var productName = $("input[name=productname]").val();
             var packageType = $("select[name=packagetype]").val();
             var initialStock = $("input[name=quantity]").val();
             var netWeight = $("input[name=netweight]").val();
             $("#pCode").text(productCode);
             $("#pName").text(productName);
             $("#pType").text(packageType);
             $("#initStock").text(initialStock + " " + packageType);
             $("#netWeight").text(netWeight);
             
         });
         
         $("#submit").click(function(){
              var productName = $("input[name=productname]").val();
              alert(productName);
             $.ajax({
            method: "POST",
            url: $("#create").attr('action'),
            data: $("#create").serialize()
            })
            .done(function(  ) {
               $('#confirm').modal('hide'); 
               $('#successheader').text("PRODUCT ADDED SUCCESSFULLY");
               $("#successmessage").text(productName + " added to database!");
               $("#successmodal").modal('show');
               $('#create').trigger("reset");
            });
         });
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
