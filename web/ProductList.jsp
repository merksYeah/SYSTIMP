<%-- 
    Document   : PurchaseOrderList
    Created on : 04 10, 15, 10:15:56 AM
    Author     : deathman28
--%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
      String currentApp = "/ViewProductList";
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
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                            <div class="panel panel-primary">
                              <div class="panel-heading"><h3>PRODUCT LIST</h3></div>
                  <div class="panel-body">
		   <div class="row mt">
                  <div class="col-md-12">
                          <table id = "what"class="table table-bordered table-striped table-condensed">
                                                        <hr>
                                                            <thead>
                                                                <tr>
                                                                   
                                                                    <th><i class="fa fa-barcode"></i> Product Code</th>
                                                                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> Product Name</th>
                                                                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> Package Type</th>
                                                                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> Net Weight</th>
                                                                    <th><i class="fa fa-bookmark"></i> Quantity In Stock</th>
                                                                    <th><i class="fa fa-bookmark"></i> Reorder Level</th>
                                                                    <th><i class="fa fa-bookmark"></i> Stock Status</th>
                                                                </tr>
                                                            </thead>
                                                            
                                                            <tbody>
                                                                <c:forEach items="${products}" var="product" varStatus="status">
                                                                    <tr>
                                                      
                                                                        <td><c:out value="${product.productCode}"/></td> 
                                                                        <td><c:out value="${product.productName}"/></td> 
                                                                        <td><c:out value="${product.packageType}"/></td> 
                                                                        <td><c:out value="${product.netweight}"/></td> 
                                                                        <td><c:out value="${product.quantity}"/></td>
                                                                        <td><c:out value="${product.reorderlevel}"/></td>
                                                                        <c:choose> 
                                                                        <c:when test="${product.quantity < product.reorderlevel}">
                                                                            <td><span class="label label-danger">REORDER</span></td>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <td><span class="label label-success">SUFFICIENT STOCK</span></td>
                                                                        </c:otherwise>
                                                                        </c:choose>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                        </table>
			
                     
                      	  
                     
					 
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

