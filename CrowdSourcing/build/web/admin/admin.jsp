<%-- 
    Document   : index
    Created on : Feb 5, 2016, 11:19:20 PM
    Author     : khurram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="_js/jquery.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="Login" method="post">
            <div>Username:</div><div><input type="text" id="username" name="username"></div>
            <div>Password:</div><div><input type="password" id="password" name="password"></div>
             
             <div><input type="button" id="btn_submit" value="Submit"></div>
        </form>
        
        <script>
            $('#btn_submit').click(function(){
            $.post("/CrowdSourcing/Login",{username:$('#username').val(),password:$('#password').val(),process:"login"},function(data){
               // alert(data);
                if(data == 200)
                window.location.href = 'adminwelcome.jsp';
                else
                    alert("Invalid username or password.");
            });    
            });
        </script>
    </body>
</html>
