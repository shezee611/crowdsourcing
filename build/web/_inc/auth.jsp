<%@page language="java" session="true" errorPage="index.jsp"  %>
<%

    String user= null;
    if(session.getAttribute("sess_user_status")==null){
        response.sendRedirect("index.jsp");
    }
    
%>