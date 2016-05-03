<%@ include file="_inc/auth.jsp" %>
<% String str_page="Task Details"; %>
<%@page import="java.util.ArrayList"%>
<%@ page import="INSE6260.TasksClass" %>
<%@ page import="INSE6260.UsersClass" %>
 <%@ page import="INSE6260.assignedtaskClass" %>
<%

String str_location = "";
String str_expertise="";
%>

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
            <div class="col-md-8">
            <div class="box">
            <div class="box-header">
                  <h3 class="box-title">My Task Details</h3>
                </div>
              <div class="box-body">
              
              
              
                   <% TasksClass objx= new TasksClass();   
		   
                TasksClass tempx;
               ArrayList<TasksClass> alx = objx.select("where id="+Integer.parseInt(request.getParameter("tid").toString()));               
              // out.println("<li>size: "+al.size()+"</li>");
               if(alx.size()>0){
               for (int i = 0; i < alx.size(); i++) {
                tempx = new TasksClass();
		         tempx  = alx.get(i);
				 str_location = tempx.getLocation();
				 str_expertise = tempx.getExperties();
				 %>
                   <div class="item">
                    <p class="message">
                     
                        <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> <%=tempx.getPublishedDate()%></small>
                        <h1><%=tempx.getTitle()%></h1>
                      
                      <p><%=tempx.getDetails()%></p>
                    </p>
                    <div class="attachment">
                      <strong>Price:</strong> <%=tempx.getPrice()%>$
                      &nbsp;&nbsp;&nbsp;<strong>Completion Date:</strong> <%=tempx.getExpiredDate()%>
                       &nbsp;&nbsp;&nbsp;<strong>Expertise:</strong> <%=str_expertise%>
                        &nbsp;&nbsp;&nbsp;<strong>Location:</strong> <%=str_location%>
                      
                      <div class="clear" style="clear:both;"></div>
                      <div class="pull-right">
                         <a href="assignedtasks.jsp"><button class="btn btn-primary btn-sm btn-flat">Back</button></a>
                      </div>
                      
                      <input type="hidden" value="<%=tempx.getUid()%>" id="hdd_clientid">
                      
                      
                    </div><!-- /.attachment -->
                  </div>
                  <div class="clear"><hr></div>
                  
                 <%  }
               }
		   
		   %> 
           </div>
           </div>                  
            </div><!--/.col (left) -->
            
            
             <div class="col-md-4">
                <div class="box">
                    <div class="box-header">
                      <h3 class="box-title">Suggested Actions</h3>
                    </div>
                    
                </div>
                
                 
               <% assignedtaskClass atbj= new assignedtaskClass(); 
		   		  ArrayList<assignedtaskClass> atlx = atbj.select("where taskid="+Integer.parseInt(request.getParameter("tid").toString())+" and workerid = "+Integer.parseInt(session.getAttribute("sess_user_id").toString())+"");               
              // out.println("<li>size: "+atlx.size()+"</li>");
			  assignedtaskClass tempat;
			  if(atlx.size()>0){ 
			  int var_task_status = 0;
			  for (int i = 0; i < atlx.size(); i++) {
                tempat = new assignedtaskClass();
		         tempat  = atlx.get(i);
				var_task_status = tempat.getStatus();	
			  }
			  
			  
			  if(var_task_status==0) {
			  %>
				<div class="item">
                    <p class="message">Work is in progress, if you already have completed the task please notify client by pressing "Complete Task" button.</p>
                    <button class="btn btn-primary btn-sm btn-flat" id="btn_complete">Task Completed</button>
				</div>	  
			  <% } // end if status 0
			  else if(var_task_status==1) {
				  out.println("<p class=\"message\"><strong>Completed work:</strong>  System waiting for client payments.</p>");
			  } // end if status = 1
			  
			  else if(var_task_status==1) {
				  out.println("<p class=\"message\"><strong>Completed work:</strong> Client has rated and paid for this.</p>");
			  } // end if status = 2
			  
			  } // end if no record found 
			   else { %>
			  
			   <div id="offer_options">
                <button class="btn btn-primary btn-sm btn-flat" id="btn_accept">Accept Offer</button>
                <button class="btn btn-primary btn-sm btn-flat" id="btn_reject">Reject Offer</button>
                </div>
                <% } %>
                <div id="msg_box"></div>
            </div>     
            
            
            
            
            
          </div>   <!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <%@ include file="_inc/footer.jsp"%>    
     
      <div class="control-sidebar-bg"></div>

    </div><!-- ./wrapper -->

	<%@ include file="_inc/js.jsp"%>
    
    <script>
	
	
	
			
			
			
			$('#btn_accept').click(function(){
			  //alert(checkedValues.join(","));
			  if(confirm("Are you sure you want to accept this offer?")){
			  $.post("Invitations",{process:"acceptreject",status:1,clientid:$("#hdd_clientid").val(),taskid:<%=request.getParameter("tid").toString()%>},function(data){
				  //alert(data);
				  if(data==200){
				  $('#msg_box').html("Offer has been accepted successfully.").fadeOut(2000);
				  $("#offer_options").html("When you complete the work come through assigned work option and change the status to completed work.");
				  $('#btn_reject').attr("disabled",true);
				  $('#btn_accept').attr("disabled",true);
				  }
				  
			  });
			  }
			});
			
			$('#btn_reject').click(function(){
			  //alert(checkedValues.join(","));
			   if(confirm("Are you sure you want to reject this offer?")){
				   
			  $.post("Invitations",{process:"acceptreject",status:2,clientid:$("#hdd_clientid").val(),taskid:<%=request.getParameter("tid").toString()%>},function(data){
				  if(data==200){
				   $('#msg_box').html("Offer has been accepted successfully.").fadeOut(2000);
				   $('#btn_reject').attr("disabled",true);
				   $('#btn_accept').attr("disabled",true);
				  }
			  });
			   }
			});
			
			
			$('#btn_complete').click(function(){
			  //alert(checkedValues.join(","));
			   if(confirm("Are you sure you have completed the work?")){
				   
			  $.post("Invitations",{process:"taskcompleted",status:1,clientid:$("#hdd_clientid").val(),taskid:<%=request.getParameter("tid").toString()%>},function(data){
				  if(data==200){
				   $('#msg_box').html("Task status has been changed successfully.").fadeOut(2000);
				   $('#btn_complete').attr("disabled",true);
				  }
			  });
			   }
			});
			
			
			
			
	//});
        </script>
        
  </body>
</html>
