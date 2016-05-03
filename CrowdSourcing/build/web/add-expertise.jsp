<%@ include file="_inc/auth.jsp" %>
<% String str_page="Add Expertise"; %>
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
            <div class="col-md-6">
              <!-- Horizontal Form -->
              <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Add New Expertise</h3>
                </div><!-- /.box-header -->
                <!-- form start-->
                <form class="form-horizontal" method="post">
                  <div class="box-body">
                    <div class="form-group">
                      <label for="username" class="col-sm-2 control-label">Name</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="txt_name" name="txt_name" placeholder="Expertise Name">
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
    
    <script>
            $('#btn_submit').click(function(){
				if($('#txt_name').val()==""){
					alert("Please enter experties name.");
					return false;
				}
				
				$('#msg_box').html("");
            $.post("Expertise",{txt_name:$('#txt_name').val(),process:"add"},function(data){
               // alert(data);
                if(data == 200){
				
				
                $('#msg_box').html("Your expertise has been added successfully.");
				$('#txt_name').val("");
				}
                else
                 $('#msg_box').html("Error, Please try again.").addClass("error");
            });    
            });
        </script>
        
  </body>
</html>
