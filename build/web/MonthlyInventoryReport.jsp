<%-- 
    Document   : ClientHomePage
    Created on : 10 10, 15, 9:02:37 AM
    Author     : deathman28
--%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>MONTHLY INVENTORY REPORT</title>
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css"/> 
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">
        <link href="assets/js/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
         <link rel="stylesheet" type="text/css" href="assets/DataTables-1.10.6/media/css/jquery.dataTables.min.css">
    </head>
    <body>
         <%@include file="LoadTemplate.jsp"%>
         <section id="main-content">
          <section class="wrapper">
             
                  <div class="panel panel-primary">
                      <div class="panel-heading"><h3>MONTHLY REPORT</h3></div>
                                <div class="panel-body">
               <div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
                      <div class="row mtbox">
                          <div class="panel panel-primary">
                              <div class="panel-heading">Monthly Inventory Report</div>
                                <div class="panel-body">
                                    <table id = "orders" class="table table-bordered table-striped table-condensed">                 
                              <thead>
                              <tr>
                                  <th><i class="fa fa-barcode"></i> Product Name</th>
                                  <th><i class="fa fa-barcode"></i> Amount of Products that went in</th>
                                  <th><i class="fa fa-barcode"></i> Amount of Products that went out</th>
                              </tr>
                              </thead>
                              <tbody> 
                                  <c:forEach items="${products}" var="Product">
                                      <tr>
                                           <td><c:out value="${Product.productName}"/></td>  
                                           <td><c:out value="${Product.quantity}"/> <c:out value="${Product.packageType}"/></td>
                                           <td><c:out value="${Product.fulfilledQuantity}"/>  <c:out value="${Product.packageType}"/></td>
                                      </tr>
                                      
                                  </c:forEach>
                              </tbody>
                          </table>
                                </div>
                          </div>
                      </div>
                      </div>
                                </div>
                  </div>
          </section>
      </section>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
	 
  <script src="assets/js/fullcalendar/fullcalendar.min.js"></script>  

    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    <script src="assets/DataTables-1.10.6/media/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    <script>
            $(document).ready(function() {
                 var table = $('#orders').dataTable();
             });
        </script>
    </body>
    
</html>
