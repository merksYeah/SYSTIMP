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
          	<h3><i class="fa fa-angle-right"></i> Show Customer Sales Orders</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
                    <div class="col-lg-9">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Report Filter</h4>
                          <form action = "GenerateReport" class="form-horizontal style-form" method="post"> 
                            
                              <div class ="form-group" >
                               <label class="col-lg-2 col-sm-2 control-label">Month</label>
                                    <div class="col-lg-3">
					 <select  name ="month" class="form-control" required>
                                             <option value="January">January</option>
                                              <option value="February">February</option>
                                               <option value="March">March</option>
                                                <option value="April">April</option>
                                                 <option value="May">May</option>
                                                  <option value="June">June</option>
                                                   <option value="July">July</option>
                                                    <option value="August">August</option>
                                                     <option value="September">September</option>
                                                      <option value="October">October</option>
                                                      <option value="November">November</option>
                                                       <option value="December">December</option>
                                         </select>
                                    </div>
                              </div>
                                <div class ="form-group" >
                               <label class="col-lg-2 col-sm-2 control-label">Year</label>
                                    <div class="col-lg-3">
					 <select  name ="year" class="form-control" required>
                                          <script>
                                            var myDate = new Date();
                                            var year = myDate.getFullYear();
                                            for(var i = 2000; i < year+1; i++){
                                                    document.write('<option value="'+i+'">'+i+'</option>');
                                            }
                                            </script>
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
