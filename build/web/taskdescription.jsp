<%@ include file="_inc/auth.jsp" %>
<% String str_page="Task Description"; %>
<%@page import="java.util.ArrayList"%>
<%@ page import="INSE6260.TasksClass" %>
<%@ page import="INSE6260.UsersClass" %>
<%@ page import="INSE6260.InvitationsClass" %>
<%@ page import="INSE6260.assignedtaskClass" %>

<%
String str_location = "";
String str_expertise="";
int db_worker_needed=0;
int db_task_id=0;
int invited_workers=0;
String db_start_date="";
String db_end_date="";
int clientid=0;


/*InvitationsClass obji= new InvitationsClass();  		   
ArrayList<InvitationsClass> ali = obji.select("where clientid="+Integer.parseInt(session.getAttribute("sess_user_id").toString())+" and acceptStatus<>2");               
invited_workers = ali.size();
*/
				   
				   
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
               ArrayList<TasksClass> alx = objx.select("where uid="+Integer.parseInt(session.getAttribute("sess_user_id").toString())+" and status=0");               
              // out.println("<li>size: "+al.size()+"</li>");
               if(alx.size()>0){
               for (int i = 0; i < alx.size(); i++) {
                tempx = new TasksClass();
		         tempx  = alx.get(i);
				 db_task_id = tempx.getId();
				 str_location = tempx.getLocation();
				 str_expertise = tempx.getExperties();
				 db_worker_needed = tempx.getNumWorkers();
				 db_start_date = tempx.getPublishedDate();
				 db_end_date = tempx.getExpiredDate();
				 
				 
				 InvitationsClass obji= new InvitationsClass();  		   
ArrayList<InvitationsClass> ali = obji.select("where clientid="+Integer.parseInt(session.getAttribute("sess_user_id").toString())+" and acceptStatus<>2 and taskid="+db_task_id);               
invited_workers = ali.size();

				 
				 %>
                   <div class="item">
                    <p class="message">
                     
                        <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> <%=tempx.getPublishedDate()%></small>
                        <h1><%=tempx.getTitle()%></h1>
                      
                      <p><%=tempx.getDetails()%></p>
                    </p>
                    <div class="attachment">
                      <strong>Workers Needed:</strong> <span id="span_worker_needed"><%=tempx.getNumWorkers()-invited_workers%></span>
                      &nbsp;&nbsp;&nbsp;<strong>Price:</strong> <%=tempx.getPrice()%>$
                      &nbsp;&nbsp;&nbsp;<strong>Completion Date:</strong> <%=tempx.getExpiredDate()%>
                       &nbsp;&nbsp;&nbsp;<strong>Expertise:</strong> <%=str_expertise%>
                        &nbsp;&nbsp;&nbsp;<strong>Location:</strong> <%=str_location%>
                      
                                         
                      
                      <div class="clear" style="clear:both;"></div>
                      <div class="pull-right" id="container_optional_buttons" style="display:none;">
                         <button class="btn btn-primary btn-sm btn-flat" id="btn_send_invitations">Send Invitation</button>
                         <span id="err_msg"></span>
                      </div>
                       <div class="clear" style="clear:both;"></div>
                      
                    </div><!-- /.attachment -->
                  </div>
                  <div class="clear"><hr></div>
                   <input type="hidden" name="hdd_taskid" id="hdd_taskid" value="<%=db_task_id%>">
                  
                 <%  }
               }
			   else {
				   
				   out.println("<div>No active task found.</div>");
			   }
		   
		   %> 
           </div>
           </div>  
           
            <% 
					UsersClass objw = new UsersClass();   
		   
                	UsersClass tempw;
                	ArrayList<UsersClass> alw = objw.selectCustomer("where id IN (SELECT workerid FROM assignedtask WHERE taskid = "+db_task_id+" AND STATUS <>2)");
			  
			  if(alw.size()>0){				  
						 
				%>	
                
           <div>
                <div class="box">
                    <div class="box-header">
                      <h3 class="box-title">Work Status</h3>
                    </div>                    
                </div>
                
                 
               <%
			    for (int i = 0; i < alw.size(); i++) {
						tempw = new UsersClass();
						 tempw  = alw.get(i);
				
				assignedtaskClass atcObj = new assignedtaskClass();
				int wStatus = atcObj.getStatus(db_task_id,tempw.getId());
				
				String workStatusData="";
				if(wStatus == 0)
				workStatusData="Work in Progress...";
				else if(wStatus == 1)
				workStatusData="Work Completed<a href=\"payment.jsp?taskid="+db_task_id+"&workerid="+tempw.getId()+"\"><button class=\"btn btn bg-navy pull-right\" id=\"btn_pay\">Pay and Rate</button></a>";
				else if(wStatus == 2)
				workStatusData="Work Completed, Rated and Paid";
			   %>
               
               <div class="col-md-6">
                <div class="box box-widget widget-user-2">
            <!-- Add the bg color to the header using any of the bg-* classes -->
            <div class="widget-user-header bg-aqua-active"">
              <div class="widget-user-image">
                <img class="img-circle" src="dist/img/<%=tempw.getId()%>.jpg" style="width:40px;" alt="User Avatar">
              </div>
              <!-- /.widget-user-image -->
              <h5 class="widget-user-username"><%=tempw.getfirstname()%></h5>
              <h5 class="widget-user-desc"><%=workStatusData%></h5>
              <div style="clear:both;"></div>
            </div>            
          </div>
            </div>
             <%  } %>
            </div>
             <%  } %>
             
                             
            </div><!--/.col (left) -->
            
            <% if(db_task_id>0){%>
             <div class="col-md-4">
                <div class="box">
                    <div class="box-header">
                      <h3 class="box-title">Suggested Workers</h3>
                    </div>                    
                </div>
                
                <% 	
				//out.println("invited_workers" +invited_workers);
               if(invited_workers>=db_worker_needed){
				   out.println("<div> You already have a invited the desired number of workers. Please wait untill you are done with that.</div>");
			   }
			   else {
				   
				   
				  // out.println("Start Date: "+db_start_date+" - End Date: "+db_end_date);
				   %>
                   
                   
                <form>
                <% 
					UsersClass obju = new UsersClass();   
		   
                	UsersClass tempu;
                	ArrayList<UsersClass> alu = obju.matchUsers2(str_expertise,str_location,db_task_id,db_start_date,db_end_date);
					
					//out.println("Size: "+str_expertise);
					 if(alu.size()==0){
						 out.println("No user found for Location: "+str_location +" Expertise: "+str_expertise);
					 }
					 if(alu.size()>0){
					   for (int i = 0; i < alu.size(); i++) {
						tempu = new UsersClass();
						 tempu  = alu.get(i);
						 
				%>	
                
                <div class="box box-widget widget-user">
                <!-- Add the bg color to the header using any of the bg-* classes -->
                <div class="widget-user-header bg-aqua-active">
                
					 
						 
				
                  <h3 class="widget-user-username"><input type="checkbox" class="selected_worker" name="chk_select_worker" value="<%=tempu.getId()%>"> <%=tempu.getfirstname()+" "+tempu.getlastname()%></h3>
                  <h5 class="widget-user-desc"><%=tempu.getExpertise(tempu.getId())%></h5>
                 
                  
                </div>
                <div class="widget-user-image">
                  <img class="img-circle" src="dist/img/<%=tempu.getId()%>.jpg" alt="User Avatar" style="height:90px;">
                </div>
                
                <%
				int db_amount=0;
				int db_num_of_project=0;
				float db_rating=0.5f;
				String str_starts="";
				int solid_stars=0, half_stars=0,empty_stars=0,stars=0;
		        assignedtaskClass tempa;
				assignedtaskClass obja= new assignedtaskClass();  		   
				ArrayList<assignedtaskClass> ala = obja.select("where workerid="+tempu.getId()+" and status=2");            
				if(ala.size()>0){
					
					   for (int ii = 0; ii < ala.size(); ii++) {
						tempa = new assignedtaskClass();
						tempa  = ala.get(ii);
						db_num_of_project++;
						db_amount+=tempa.getAmount();
						db_rating+=tempa.getRating();
					   }
					 
					
				}
				
				
				  	   db_rating = (db_rating/(db_num_of_project+1))*10;
					   solid_stars = (int)db_rating/2;					  
					   if((int)db_rating%2>0)   half_stars=1;					  
					   
					   empty_stars = 5-solid_stars-half_stars;
					   for(stars=1;stars<=solid_stars;stars++)
					   {					   
						   str_starts += "<i class=\"fa fa-star\"></i>";  
						   
					   }
					     for(stars=1;stars<=half_stars;stars++)
					   {					   
						   str_starts += "<i class=\"fa fa-star-half-o\"></i>";  
						   
					   }
					   
					   for(stars=1;stars<=empty_stars;stars++)
					   {					   
						   str_starts += "<i class=\"fa fa-star-o\"></i>";  
						   
					   }
					   
					   
	
				%>
                <div class="box-footer">
                  <div class="row">
                    <div class="col-sm-4 border-right">
                      <div class="description-block">
                        <h5 class="description-header"><%=db_num_of_project%></h5>
                        <span class="description-text">Projects</span>
                      </div><!-- /.description-block -->
                    </div><!-- /.col -->
                    <div class="col-sm-4 border-right">
                      <div class="description-block">
                        <h5 class="description-header"><%=db_amount%>$</h5>
                        <span class="description-text">Earning</span>
                      </div><!-- /.description-block -->
                    </div><!-- /.col -->
                    <div class="col-sm-4">
                      <div class="description-block">
                        <h5 class="description-header"><%=str_starts%><% //=empty_stars%></h5>
                        <span class="description-text">Rating</span>
                      </div><!-- /.description-block -->
                    </div><!-- /.col -->
                  </div><!-- /.row -->
                </div>
              </div>
              <%
					   }
					 }
				%>
                </form>
                
                <% } %>
            </div>     
           
           <% } %>
             
			 
			 
			 
			
             
            
            
            
            
          </div>   <!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <%@ include file="_inc/footer.jsp"%>    
     
      <div class="control-sidebar-bg"></div>

    </div><!-- ./wrapper -->

	<%@ include file="_inc/js.jsp"%>
    
    <script>
	
	//$(function(){
	var checkedValues=null;
	
			$(".selected_worker").change(function(){
				
				checkedValues = $('input:checkbox:checked').map(function() {
   				 return this.value;
				}).get();
				
				if($("#span_worker_needed").html()==checkedValues.length){
				//alert(checkedValues.join(","));
				$("#container_optional_buttons").show();
				}
				else if($("#span_worker_needed").html()<checkedValues.length){
					$(this).prop( "checked", false );
				alert("You cannot select more than "+$("#span_worker_needed").html()+" worker(s).");
				
				
				}
				else{
				$("#container_optional_buttons").hide();	
				}

			});
			
			
			$('#btn_send_invitations').click(function(){
			  //alert(checkedValues.join(","));
			  $.post("Invitations",{process:"sendinvitations",str_workers:checkedValues.join(","),taskid:$('#hdd_taskid').val()},function(data){
				  //alert(data);
				  if(data==200){
				  $('#err_msg').html("Invitations has been sent successfully.");
				  $('#btn_send_invitations').attr("disabled", true);
				  }
			  });
				
			});
	//});
        </script>
        
  </body>
</html>
