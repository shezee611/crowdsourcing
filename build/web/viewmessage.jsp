<%@ include file="_inc/auth.jsp" %>
<% String str_page="View Message"; %>
<%@page import="java.util.ArrayList"%>
<%@ page import="INSE6260.MessageClass" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Crowd Sourcing | Dashboard</title>  
   <%@ include file="_inc/inc.jsp" %>
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

      
       <%@ include file="_inc/nav.jsp"%>        
      <!-- Left side column. contains the logo and sidebar -->
      <%@ include file="_inc/main_sidebar.jsp"%>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">

      <%@ include file="_inc/breadcrumb.jsp"%>
       

        <!-- Main content -->
        <section class="content">
      <!-- title row -->
      <% 
	  
int mid = Integer.parseInt(request.getParameter("id").toString());
String str_qry = "";
if(mid>0)
str_qry = "where id="+mid+" order by createdon desc";
else
str_qry = "where receiver="+Integer.parseInt(session.getAttribute("sess_user_id").toString())+" order by createdon desc";

//out.println("Message ID: "+str_qry);
mlx = mobjx.select(str_qry);               
if(mlx.size()>0){
	 for (int i = 0; i < mlx.size(); i++) {
					tempm = new MessageClass();
					tempm  = mlx.get(i);
					mobjx.update(tempm.getId());
					UsersClass UObj = new UsersClass();
%>


     <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Read Message</h3>             
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-read-info">
                <h3><%=tempm.getSubject()%></h3>
                <h5>From: <%=UObj.getFullName(tempm.getSender())%>
                  <span class="mailbox-read-time pull-right"><%=tempm.getCreatedOn()%></span></h5>
              </div>
              <!-- /.mailbox-read-info -->
              
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
                <%=tempm.getMessage()%>
              </div>
              <!-- /.mailbox-read-message -->
            </div>
            <!-- /.box-body -->
           
          </div>
          <!-- /. box -->
        </div>
        <div style="clear:both"></div>
        
     <%					 
	 }
}
%>   
    </section>
      </div><!-- /.content-wrapper -->

      <%@ include file="_inc/footer.jsp"%>    
     
      <div class="control-sidebar-bg"></div>

    </div><!-- ./wrapper -->

	<%@ include file="_inc/js.jsp"%>
    
<script type="text/javascript">
    
</script>
        
  </body>
</html>
