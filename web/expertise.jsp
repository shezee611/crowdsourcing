<%@ include file="_inc/auth.jsp" %>
<% String str_page="Expertise"; %>
<%@page import="java.util.ArrayList"%>
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
            <div class="box">
            <div class="box-header">
                  <h3 class="box-title">My Expertise</h3>
                </div>
              <div class="box-body">
              <!-- Horizontal Form -->
              <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap"><div class="row"><div class="col-sm-6"></div><div class="col-sm-6"></div></div><div class="row"><div class="col-sm-12"><table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                    <thead>
                      <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column descending" aria-sort="ascending">No.</th><th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Name</th><th>Action</th></tr>
                    </thead>
                    <tbody>
                    
                     
                        
                         <%@ page import="INSE6260.ExpertiesClass" %>
         
		   <%		   
		   ExpertiesClass objx= new ExpertiesClass();   
		   
                ExpertiesClass tempx;
               ArrayList<ExpertiesClass> alx = objx.select(" where userid="+session.getAttribute("sess_user_id"));               
              // out.println("<li>size: "+al.size()+"</li>");
               if(alx.size()>0){
               for (int i = 0; i < alx.size(); i++) {
                tempx = new ExpertiesClass();
		         tempx  = alx.get(i);
               // out.print(" <br> "+i+" : "+temp.getfirstname()+" "+temp.getlastname());
               // out.print(" <br> "+i+" : "+temp.getfirstname());
              
              
	      out.println("<tr role=\"row\" id=\"tr_"+tempx.getId()+"\" class=\"even\"><td class=\"sorting_1\">"+(i+1)+"</td><td>"+tempx.getName()+"</td><td><a href=\"#\" class=\"remove\" rel=\""+tempx.getId()+"\"><i class=\"fa fa-remove\"></i></a></td></tr>");
			   }
               }
		   
		   %>
                        
                                                                
                      </tbody>
                  </table></div></div></div></div></div>
                  
                  
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
