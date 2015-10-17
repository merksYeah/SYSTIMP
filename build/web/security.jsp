<%@page import="java.util.HashMap"%>
<%
//    String login = (String) session.getAttribute("login");
//    if (login == null || !login.equals("true")){
//        response.sendRedirect("login.jsp");
//        return;
//    } 
    
    HashMap<String,Integer> rights = (HashMap<String,Integer>) session.getAttribute("login");
    if(!(rights != null && rights.get(currentApp) != null && rights.get(currentApp).equals(1))){
        response.sendRedirect("index.jsp");
        return;
    }
%>