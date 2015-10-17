<%-- 
    Document   : inventoryList
    Created on : 03 7, 15, 11:18:56 AM
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
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>CRIPSI</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.6/css/jquery.dataTables.css">

  </head>

	<style>
		#add{margin-left:600px;}
	</style>
  <body>

  <section id="container" >
      <%@include file="LoadTemplate.jsp" %>
  
	  
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
        <section id="main-content">
          <section class="wrapper">
          	<h2><i class="fa fa-angle-right"></i> Inventory List</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
				  
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Inventory</h4>
					    <!--div class="input-group custom-search-form col-md-2">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div-->
                        <div class="row mt">
                          
                  <div class="col-md-12">
                      <div class="content-panel">
                          <form action ="Search" method = "post"><div class="input-group custom-search-form col-md-2">
                                
                                             
                                  <input type="text" class="form-control" placeholder="Search..." name = "productname" >
                                <span class="input-group-btn">
                                <button class="btn btn-default" type ="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div></form>
	                  	  	  <table class="table table-bordered table-striped table-condensed" id='what'>
	                  	  	  <h4><i class="fa fa-angle-right"></i> Products</h4>
                                          
                                          
	                  	  	  <hr>
                              <thead>
                              <tr>
                               
                                  <th><i class="fa fa-barcode"></i> Product ID</th>
                                  <th class="hidden-phone"><i class="fa fa-question-circle"></i> Product Name</th>
                                  <th><i class="fa fa-bookmark"></i> Package</th>
                                  <th><i class=" fa fa-edit"></i> Net Weight</th>
								  <th><i class=" fa fa-edit"></i> Quantity</th>
								  <th><i class=" fa fa-edit"></i> Edit</th>
                                  
                              </tr>
                              </thead>
                              <tbody>
                          <c:forEach items="${products}" var="product">
                             
                                  <tr>
                                        <a href="Search?productCode=<c:out value="${product.productCode}"/>">WHAT</a> 
                                      <td><c:out value="${product.productCode}"/></td> 
                                      <td><c:out value="${product.productName}"/></td> 
                                      <td><c:out value="${product.packageType}"/></td> 
                                      <td><c:out value="${product.netweight}"/></td> 
                                      <td><c:out value="${product.quantity}"/></td> 
                                      <td>
                                      <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                                  </td>
                                      
                                  </tr>
                              </c:forEach>
                            </tbody>
                          </table>      
						  
                      </div><!-- /content-panel -->
					 
                  </div><!-- /col-md-12 -->
				  
              </div><!-- /row ->			   
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
	 
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
     
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
   

    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
 
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.6/js/jquery.dataTables.js"></script>
    <!--script for this page-->
    <script>
        $(document).ready( function () {
    $('#what').DataTable();
    } );
    </script>


  </body>
</html>

