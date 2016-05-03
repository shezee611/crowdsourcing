<%@ include file="_inc/auth.jsp" %>
<% String str_page="Add Expertise"; %>
<%@ page import="INSE6260.TasksClass" %>
<%@ page import="INSE6260.CategoryClass" %>

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
              <!-- Horizontal Form -->
              <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Add New Task</h3>
                </div><!-- /.box-header -->
                
                 <% TasksClass objx= new TasksClass();   
		   
                TasksClass tempx;
               ArrayList<TasksClass> alx = objx.select("where uid="+Integer.parseInt(session.getAttribute("sess_user_id").toString())+" and status=0");               
              // out.println("<li>size: "+al.size()+"</li>");
               if(alx.size()>0){
				   out.println("<div> You already have a project listed. Please wait untill you are done with that.</div>");
			   }
			   else {
				   %>
                <!-- form start-->
                <form class="form-horizontal" id="frm_task" method="post">
                  <div class="box-body">
                    <div class="form-group">
                      <label for="title" class="col-sm-2 control-label">Name</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="txt_name" name="txt_name" placeholder="Task title" required>
                      </div>
                    </div>
                     <div class="form-group">
                      <label for="Details" class="col-sm-2 control-label">Details</label>
                      <div class="col-sm-10">
                        <textarea class="form-control" rows="7" id="txt_details" name="txt_details" placeholder="Task Details" required></textarea>
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label for="Location" class="col-sm-2 control-label">Location</label>
                      <div class="col-sm-10">
                        <input type="text"  class="form-control" id="txt_location" name="txt_location" placeholder="Task Location" required>
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label for="Expertise" class="col-sm-2 control-label">Expertise</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="txt_expertise" name="txt_expertise" placeholder="Task Expertise" required>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label for="Workers" class="col-sm-2 control-label">Number of Workers</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="txt_workers" name="txt_workers" placeholder="Task Workers" required value="1">
                      </div>
                    </div>
                    
                    
                     <div class="form-group">
                      <label for="username" class="col-sm-2 control-label">Category</label>
                      <div class="col-sm-10">
                        <select class="form-control" id="dd_cats" name="dd_cats">
                          <option value="">-- Select a category --</option>
                         
         
							   <%		   
                               CategoryClass obj= new CategoryClass();                               
                                   ArrayList<CategoryClass> al = obj.select("");               
                                  // out.println("<li>size: "+al.size()+"</li>");
								   CategoryClass temp;
                                   if(al.size()>0){
									   for (int i = 0; i < al.size(); i++) {
										 temp = new CategoryClass();
										 temp  = al.get(i);                                   
										 out.println("<option value='"+temp.getId()+"'>"+temp.getName()+"</option>");
									   }
                                   }
                               
                               %>
           
                        </select>
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label for="Price" class="col-sm-2 control-label">Price</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="txt_price" name="txt_price" placeholder="Task Price" required>
                      </div>
                    </div>
                    
                    
                    
                     <div class="form-group">
                      <label for="Published Date" class="col-sm-2 control-label">Start Date</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="txt_publish_date" name="txt_publish_date" placeholder="Task Start Date" required>
                      </div>
                    </div>
                    
                    
                    
                   <div class="form-group">
                      <label for="Completion Date" class="col-sm-2 control-label">End Date</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="txt_completion_date" name="txt_completion_date" placeholder="Task End Date" required>
                      </div>
                    </div>
                   
                   
                   
                    
                  </div><!-- /.box-body -->
                  <div class="box-footer">
                    
                    <button type="button" class="btn btn-info pull-right" id="btn_submit">Save</button>
                    <span id="msg_box"></span>
                    <input type="hidden" name="process" value="add">
                  </div><!-- /.box-footer -->
                  <div id="loader_box"></div>
                  <div class="alert-error"></div>
                </form>
                <% } %>
              </div>
            </div><!--/.col (left) -->
            
            <!-- colom on right -->
            
            <!-- end colom right-->
            
          </div>   <!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <%@ include file="_inc/footer.jsp"%>    
     
      <div class="control-sidebar-bg"></div>

    </div><!-- ./wrapper -->

	<%@ include file="_inc/js.jsp"%>
      
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  
<script>

    $( "#txt_publish_date, #txt_completion_date" ).datepicker({dateFormat: "yy-mm-dd"});

  
	//$(function(){
	
	//$('#txt_publish_date').datepicker();
	//$('#txt_completion_date').datepicker();
		
	
            $('#btn_submit').click(function(){
				
				if($('#txt_name').val()==""){
					alert("Please enter task title.");
					return false;
				}
				if($('#txt_details').val()==""){
					alert("Please enter task details.");
					return false;
				}
				
				if($('#txt_location').val()==""){
					alert("Please enter work location.");
					return false;
				}
				
				
				if($('#txt_expertise').val()==""){
					alert("Please enter an experty of the task you are looking for.");
					return false;
				}				
				
				if($('#txt_workers').val()==""){
					alert("Please enter number of worker you needed.");
					return false;
				}
				if($('#txt_price').val()==""){
					alert("Please enter amount/price for the task.");
					return false;
				}
				
				if($('#txt_publish_date').val()==""){
					alert("Please select task start date.");
					return false;
				}
				
				if($('#txt_completion_date').val()==""){
					alert("Please select task end date.");
					return false;
				}
				
				
				
				$('#msg_box').html("");
            $.post("Tasks",$('#frm_task').serialize(),function(data){
               // alert(data);
                if(data == 200){
                $('#msg_box').html("Your task has been added successfully.");
				//$('#txt_name').val("");
                                window.location.href="taskdescription.jsp";
                                
				}
                else
                 $('#msg_box').html("Error, Please try again.").addClass("error");
            });    
            });
	//});		
</script>
        
  </body>
</html>
