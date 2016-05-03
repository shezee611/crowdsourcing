<%@ include file="_inc/auth.jsp" %>
<% String str_page="My Invitations"; %>
<%@page import="java.util.ArrayList"%>
  <%@ page import="INSE6260.TasksClass" %>
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
          <div class="row">
            <!-- right column -->
            <div class="col-md-12">
            <div class="box">
            <div class="box-header">
                  <h3 class="box-title">My Invitaions</h3>
                </div>
              <div class="box-body">
              
              
             
                   <% TasksClass objx= new TasksClass();   
		   
                TasksClass tempx;
               ArrayList<TasksClass> alx = objx.select("where id in(select taskid from invitations where workerid in("+Integer.parseInt(session.getAttribute("sess_user_id").toString())+") and acceptStatus=0)");               
              // out.println("<li>size: "+al.size()+"</li>");
			  if(alx.size()==0){ %>
				<div class="item">
                    <p class="message">You have no invitation for any task.</p>
				</div>	  
			  <% }
               else if(alx.size()>0){
               for (int i = 0; i < alx.size(); i++) {
                tempx = new TasksClass();
		         tempx  = alx.get(i);
				 %>
                   <div class="item">
                    <p class="message">
                      <a href="taskdetails.jsp?tid=<%=tempx.getId()%>" class="name">
                        <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> <%=tempx.getPublishedDate()%></small>
                        <%=tempx.getTitle()%>
                      </a>
                      <p><% if(tempx.getDetails().length()>100) out.println(tempx.getDetails().substring(0,250)+"..."); else out.println(tempx.getDetails());%></p>
                    </p>
                    <div class="attachment">
                     <strong>Price:</strong> <%=tempx.getPrice()%>$
                      &nbsp;&nbsp;&nbsp;<strong>Completion Date:</strong> <%=tempx.getExpiredDate()%>
                      &nbsp;&nbsp;&nbsp;<strong>Location:</strong> <%=tempx.getLocation()%>
                      &nbsp;&nbsp;&nbsp;<strong>Expertise:</strong> <%=tempx.getExperties()%>
                      
                      <div class="pull-right">
                        <a href="taskdetails.jsp?tid=<%=tempx.getId()%>"><button class="btn btn-primary btn-sm btn-flat">Full Details</button></a>
                      </div>
                    </div><!-- /.attachment -->
                  </div>
                  <div class="clear"><hr></div>
                  
                 <%  }
               }
		   
		   %> 
           </div>
           </div>
           
                  
                  
            </div><!--/.col (left) -->
            
            
            
          </div>   <!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <%@ include file="_inc/footer.jsp"%>    
     
      <div class="control-sidebar-bg"></div>

    </div><!-- ./wrapper -->

	<%@ include file="_inc/js.jsp"%>
    
    <script>
            $('.remove').click(function(){
				
			if(confirm("Are you sure you wanna delete this item?")){
				var var_e_id = $(this).attr("rel");
            $.post("Expertise",{e_id:var_e_id,process:"del"},function(data){
              // alert($(this).attr("rel"));
                if(data == 200)
                $('#tr_'+var_e_id).fadeOut(1000);
                else
                alert("Error, Please try again.");
            });    
			}
            });
        </script>
        
  </body>
</html>
