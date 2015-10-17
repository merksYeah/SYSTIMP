<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>

<html>
       <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
     <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="ViewHomePage" class="logo"><b>Chemical Research Products Industrial Sales, Inc.</b></a>
            <!--logo end-->
            
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="Logout">Logout</a></li>
            	</ul>
            </div>
        </header>
      <!--header end-->
        <c:if test="${login['role'] == 1}">
             <%@include file="ClientTemplate.jsp" %>
        </c:if>
        <c:if test="${login['role'] == 2}">
             <%@include file="PlantManagerTemplate.jsp" %>
        </c:if>
         <c:if test="${login['role'] == 3}">
             <%@include file="SalesAgentTemplate.jsp" %>
        </c:if>
       
        
</html>