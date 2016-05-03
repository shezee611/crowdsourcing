<%-- 
    Document   : welcome
    Created on : Feb 6, 2016, 3:07:06 AM
    Author     : khurram
--%>
<%
    String user= null;
    if(session.getAttribute("sess_admin_status")==null){
        response.sendRedirect("admin.jsp");
    }
    else
    {
        user =(String) session.getAttribute("sess_username");
        
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome <%=user%> to Dashboard!</h1>
    </body>
</html>
