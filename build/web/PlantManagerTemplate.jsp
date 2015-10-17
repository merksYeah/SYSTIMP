<%-- 
    Document   : PlantManagerTemplate
    Created on : 04 11, 15, 2:06:51 PM
    Author     : deathman28
--%>


<!DOCTYPE html>
<html>
     <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	<p class="centered"><a href="profile.html"><img src="assets/img/ui-woah.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">Miguel Mercado</h5>
                  <h5 class="centered">Plant Manager</h5>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-file"></i>
                          <span>Sales Order List</span>
                      </a>
                      <ul class="sub">
                          <li> 
                              <a  href="ToInProcessOrders">
				<i class="fa fa-file-o"></i>
				<span>In Process Orders</span>
				 </a>
                          </li>
                         <li> 
                              <a  href="ToForReorder">
				<i class="fa fa-file-o"></i>
				<span>For Reordering </span>
				 </a>
                          </li>
                           <li> 
                              <a  href="ViewMasterList">
				<i class="fa fa-file-o"></i>
				<span>Master List </span>
				 </a>
                          </li>
                      </ul>
                  </li>
                   <li  class="sub-menu">
                      <a id="purchaseOrders" href="javascript:;" >
                          <i class="fa fa-file"></i>
                          <span>Purchase Order List</span>
                      </a>
                      <ul class="sub">
                          <li> 
                              <a  href="ToReqSlip">
                          <i class="fa fa-file"></i>
                          <span>New Purchase Order</span>
                      </a>
                          </li>
                          <li> 
                              <a  href="ViewReqSlipList">
                          <i class="fa fa-file"></i>
                          <span>Purchase Order List</span>
                      </a>
                          </li>
                          <li> 
                              <a  href="ViewUpdatePOList">
                          <i class="fa fa-file"></i>
                          <span>Update PO Status</span>
                      </a>
                          </li>
                      </ul>
                  </li>
                 
 
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-truck"></i>
                          <span>Stocks</span>
                      </a>
                      <ul class="sub">
                          <li> 
                              <a  href="ToAddProduct">
                          <i class="fa fa-barcode"></i>
                          <span>Add Product</span>
                      </a>
                          </li>
                          <li> 
                              <a  href="ViewProductList">
                          <i class="fa fa-barcode"></i>
                          <span>Product List</span>
                      </a>
                          </li>
                         
                           
                          <li> 
                              <a  href="ViewMonthlyInventoryReport">
				<i class="fa fa-file-o"></i>
				<span>Monthly Inv Report</span>
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

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
     
</html>
