<%-- 
    Document   : SalesAgentTemplate
    Created on : 04 9, 15, 1:21:45 PM
    Author     : deathman28
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html> 
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="ViewHomePage"><img src="assets/img/ui-woah.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">Miguel Mercado</h5>
				   <h5 class="centered">Client</h5>
              	  	
                  
				   <li class="sub-menu">
                      <a href="javascript:;">
                          <i class="fa fa-user"></i>
                          <span>Order Creation</span>
                      </a>
                      <ul class="sub">
					 
                          <li>
							  <a  href="ToSalesOrder">
								<i class="fa fa-file-o"></i>
								<span>New Sales Order</span>
							  </a>
						  </li>
                          
						
                      </ul>
                  </li>
                   <li class="sub-menu">
                      <a href="javascript:;">
                          <i class="fa fa-user"></i>
                          <span>Order Lists</span>
                      </a>
                      <ul class="sub">
					
                        <li>
						  <a  href="ToList">
						  <i class="fa fa-file-o"></i>
							<span>Sales Order List</span>
						</a>
						</li>
                      </ul>
                  </li>
                   <li class="sub-menu">
                      <a href="javascript:;">
                          <i class="fa fa-calendar"></i>
                          <span>Delivery Schedule</span>
                      </a>
                      <ul class="sub">
					
                        <li>
						  <a  href="ViewDeliverySchedule">
						  <i class="fa fa-calendar"></i>
							<span>View Calendar</span>
						</a>
						</li>
                      </ul>
                  </li>
                  </aside>
     
              </html>