<%-- 
    Document   : welcome
    Created on : Feb 6, 2016, 3:07:06 AM
    Author     : khurram
--%>
<%
    String user= null;
    if(session.getAttribute("sess_admin_status")==null){
        response.sendRedirect("index.jsp");
    }
    
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Crowd Sourcing Admin | Dashboard</title>  
   <%@ include file="../_inc/inc.jsp" %>
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

      <header class="main-header">

        <!-- Logo -->
        <a href="index2.html" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>A</b></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Admin</b></span>
        </a>

        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
        <div>Welcome <%=(String) session.getAttribute("sess_username")%> to Admin Panel</div>
          <!-- Sidebar toggle button-->
          
          <!-- Navbar Right Menu -->
         

        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <%@ include file="../_inc/admin_sidebar.jsp"%>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Dashboard
            <small>Version 2.0</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <!-- Info boxes -->
          <div class="row">
           
          </div><!-- /.row -->

          <!-- /.row -->

          <!-- Main row -->
          <!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <%@ include file="../_inc/footer.jsp"%>

      
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>

    </div><!-- ./wrapper -->
	<%@ include file="../_inc/js.jsp"%>

  </body>
</html>
