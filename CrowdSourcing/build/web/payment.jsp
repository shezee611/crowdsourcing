<%@ include file="_inc/auth.jsp" %>
<% String str_page="Task Payment"; %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page import="INSE6260.TasksClass" %>
<%@ page import="INSE6260.UsersClass" %>
<%@ page import="INSE6260.assignedtaskClass" %>
<%@ page import="INSE6260.PaymentClass" %>



<% 
int taskid =Integer.parseInt(request.getParameter("taskid").toString());
int clientid = Integer.parseInt(session.getAttribute("sess_user_id").toString());
int workerid =Integer.parseInt(request.getParameter("workerid").toString());
int task_price=0;

UsersClass obju = new UsersClass();   
			UsersClass tempu;
			ArrayList<UsersClass> alu;
//out.println("Client: "+clientid);					
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
        <section class="invoice">
      <!-- title row -->
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> Crowd Sourcing
            <small class="pull-right">Date: <% Date dNow = new Date( ); out.println(dNow.toString());
			%></small>
          </h2>
        </div>
        <!-- /.col -->
      </div>
      <!-- info row -->
      <div class="row invoice-info">
        <div class="col-sm-4 invoice-col">
          From
          <address>
          <%
		   alu = obju.selectCustomer("where id = "+clientid);
		  
			if(alu.size()>0){ 	 
							
				for (int i = 0; i < alu.size(); i++) {
						tempu = new UsersClass();
						 tempu  = alu.get(i);
						
			

		  %>
            <strong><%=tempu.getfirstname()+ " "+tempu.getlastname()%></strong><br>
            <%=tempu.getlocation()%><br>
            Phone: <%=tempu.getphone()%><br>
            Email: <%=tempu.getusername()%>
            <% 	}
							
			} %>
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
          To
          <address>
          <%
		   alu = obju.selectCustomer("where id = "+workerid);
		  
			if(alu.size()>0){ 	 
							
				for (int i = 0; i < alu.size(); i++) {
						tempu = new UsersClass();
						 tempu  = alu.get(i);
						
			

		  %>
            <strong><%=tempu.getfirstname()+ " "+tempu.getlastname()%></strong><br>
            <%=tempu.getlocation()%><br>
            Phone: <%=tempu.getphone()%><br>
            Email: <%=tempu.getusername()%>
            <% 	}
							
			} %>
          </address>
        </div>
        
        
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped">
            <thead>
            <tr>
              <th>Qty</th>
              <th>Product</th>
              <th>Experties</th>
              <th>Description</th>
              <th>Subtotal</th>
            </tr>
            </thead>
            <tbody>
           
            
              <% TasksClass objx= new TasksClass();   
		       
               TasksClass tempx;
               ArrayList<TasksClass> alx = objx.select("where id="+taskid);               
              // out.println("<li>size: "+al.size()+"</li>");
               if(alx.size()>0){
               for (int i = 0; i < alx.size(); i++) {
                tempx = new TasksClass();
		         tempx  = alx.get(i);
				 task_price = tempx.getPrice();
				
				 %> 
            <tr>
              <td>1</td>
              <td><%=tempx.getTitle()%></td>
              <td><%=tempx.getExperties()%></td>
              <td><%=tempx.getDetails().length()>50?tempx.getDetails().substring(0,50)+"...":tempx.getDetails()%></td>
              <td>$<%=tempx.getPrice()%></td>
            </tr> 
            <% } 
			}%>         
            </tbody>
          </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <div class="row">
        <!-- accepted payments column -->
        
        <%
					PaymentClass objp = new PaymentClass();   
		   
                	PaymentClass tempp;
                	ArrayList<PaymentClass> alp = objp.select("where clientid="+Integer.parseInt(session.getAttribute("sess_user_id").toString()));
					
					String paymentMethod="paypal",cardType="",card_username="",card_password="",card_fullname="";
					int card_expiry_month=0,card_expiry_year=0,paymentoptionid=0;
					//out.println("Payment option size "+session.getAttribute("sess_user_id").toString());
					 if(alp.size()>0){
					   for (int x = 0; x < alp.size(); x++) {
						tempp = new PaymentClass();
						 tempp  = alp.get(x);
						paymentoptionid =  tempp.getId();
						paymentMethod = tempp.getPaymentMethod();
						cardType = tempp.getCardType();
						card_username = tempp.getUsername();
						card_password = tempp.getPassword();
						card_fullname = tempp.getFullName();
						card_expiry_month = tempp.getCardExpiryMonth();
						card_expiry_year = tempp.getCardExpiryYear();
						 
					
					   }
					 }
		
		%>
        <div class="col-xs-6">
          <p class="lead">Payment Methods:</p>
          <% 
		  if(paymentMethod == "paypal"){ %>
          <img src="dist/img/credit/paypal2.png" alt="Paypal">
          <% } else {%>
          <img src="dist/img/credit/<%=cardType%>.png" alt="<%=cardType%>">
         
          <%  } %>
          <div><strong>Account / Card:</strong> <%=card_username%></div>          
		  <div><strong>Password / CVV:</strong> <input type="password" name="cvv" id="cvv"></div><br>

          
          <form id="frm_payment">
          <div class="form-group">
                      <label for="exampleInputFile" style="width:100px;">Rating: </label>                      
                      <select id="dd_rating">
                        <option value="0">0</option>
                        <% for(float rating=0.2f;rating<=1.0f;rating+=0.2f){
							out.println("<option value=\""+rating+"\">"+rating+"</option>");
						}%>
                        
                      </select>
          </div>
          <div class="form-group">
                      <label for="exampleInputFile" style="width:100px;">Comments: </label>                      
                      <textarea id="txt_comments" cols="40" rows="5"></textarea>
          </div>
          
          </form>
         
         
        </div>
        <!-- /.col -->
        <div class="col-xs-6">
          <p class="lead">Amount Due </p>

          <div class="table-responsive">
            <table class="table">
              <tbody>
              <tr>
                <th>Tax</th>
                <td>$0</td>
              </tr>
              <tr>
                <th>Shipping:</th>
                <td>$0</td>
              </tr>
              <tr>
                <th>Total:</th>
                <td>$<%=task_price%></td>
              </tr>
            </tbody></table>
          </div>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- this row will not appear when printing -->
      <div class="row no-print">
        <div class="col-xs-12">          
          <button type="button" class="btn btn-success pull-right" id="btn_payment"><i class="fa fa-credit-card"></i> Submit Payment
          </button> 
          <div id="msg_box"></div>
        </div>
      </div>
    </section>
      </div><!-- /.content-wrapper -->

      <%@ include file="_inc/footer.jsp"%>    
     
      <div class="control-sidebar-bg"></div>

    </div><!-- ./wrapper -->

	<%@ include file="_inc/js.jsp"%>
    
<script type="text/javascript">

	
	$('#btn_payment').click(function(){
		$('#btn_payment').attr("disabled",true);
                $("#msg_box").html("<img src='dist/img/loader.gif'>");
		        if($('#cvv').val()==""){
					alert("Please enter your account Password or CVV .");
					return false;
				}
				if($('#txt_comments').val()==""){
					alert("Please enter comments.");
					return false;
				}				
				
				
				
		if(confirm("Are you sure you want to pay $<%=task_price%> for this task.")){
		$.post("Invitations",{process:"payment",taskid:<%=taskid%>,workerid:<%=workerid%>,amount:<%=task_price%>,comments:$('#txt_comments').val(),rating:$('#dd_rating').val()},function(data){			
			if(data == 200) {
				$('#msg_box').html("Payment and Rating are done successfully.");
				
				}
			});
		}
	});

       
</script>
        
  </body>
</html>
