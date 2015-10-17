<%-- 
    Document   : SalesAgentTemplate
    Created on : 04 9, 15, 2:52:01 PM
    Author     : deathman28
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <aside>
        <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="ViewHomePage"><img src="assets/img/ui-woah.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">Miguel Mercado</h5>
				   <h5 class="centered">Sales Agent</h5>
    <li class="sub-menu">
                      <a id="pendingOrders" href="javascript:;" >
                          <i class="fa fa-user"></i>
                          <span>Pending Orders</span>
                      </a>
                      <ul class="sub">
					   
                          <li>
							  <a  href="ToPendingClientOrders">
								<i class="fa fa-file-o"></i>
								<span>Pending For Approval SO</span>
							  </a>
						  </li>
                          
               

                      </ul>
                  </li>
                   <li class="sub-menu">
                      <a id="customerOrders" href="javascript:;">
                          <i class="fa fa-user"></i>
                          <span>Customer Orders</span>
                      </a>
                      <ul class="sub">
					   
                          
                           <li>
						  <a  href="ToFilterCustomerSalesOrders ">
						  <i class="fa fa-file-o"></i>
							<span>Sales Order List</span>
						</a>
						</li>
						
            

                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a id="reports" href="javascript:;">
                          <i class="fa fa-user"></i>
                          <span>Reports</span>
                      </a>
                      <ul class="sub">
					   
                          
                           <li>
						  <a  href="ViewMonthlyRevenueReport">
						  <i class="fa fa-file-o"></i>
							<span>Monthly Revenue Report</span>
						</a>
						</li>
						
            

                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a id="deliverySched" href="javascript:;">
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
