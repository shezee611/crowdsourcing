<%@ include file="_inc/auth.jsp" %>
<% String str_page="Edit Profile"; %>
<%@page import="java.util.ArrayList"%>
<%@ page import="INSE6260.PaymentClass" %>

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
                  <h3 class="box-title"><%=str_page%></h3>
                </div><!-- /.box-header -->
                
                
                  <% 
					UsersClass obju = new UsersClass();   
		   
                	UsersClass tempu;
                	ArrayList<UsersClass> alu = obju.selectCustomer("where id="+Integer.parseInt(session.getAttribute("sess_user_id").toString()));
					
					 if(alu.size()>0){
					   for (int i = 0; i < alu.size(); i++) {
						tempu = new UsersClass();
						 tempu  = alu.get(i);
						 
				%>	
                
                
               
                <!-- form start-->
                <form role="form" method="post" id="frm_signup" enctype="multipart/form-data">
                  <div class="box-body">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Email address</label>
                      <input type="email" class="form-control" id="txt_username" name="txt_username" placeholder="Enter email" required value="<%=tempu.getusername()%>">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Password</label>
                      <input type="password" class="form-control" id="txt_password" name="txt_password" placeholder="Password" required value="<%=tempu.getpassword()%>">
                    </div>

<div class="form-group">
                      <label for="txt_firstname">Firstname</label>
                      <input type="text" class="form-control" id="txt_firstname" name="txt_firstname" placeholder="First Name" required value="<%=tempu.getfirstname()%>">
                    </div>

<div class="form-group">
                      <label for="lastname">Lastname</label>
                      <input type="text" class="form-control" id="txt_lastname" name="txt_lastname" placeholder="Last Name" required value="<%=tempu.getlastname()%>">
                    </div>


                    
                    <div class="form-group">
                      <label for="txt_phone">Phone</label>
                      <input type="text" class="form-control" id="txt_phone" name="txt_phone" placeholder="Phone" required value="<%=tempu.getphone()%>">
                    </div>
                    
                    <div class="form-group">
                      <label for="txt_location">Location</label>
                      <input type="text" class="form-control" id="txt_location" name="txt_location" placeholder="Location" required value="<%=tempu.getlocation()%>">
                    </div>
                    
                    <div class="form-group" style=" display:none;">
                      <label for="txt_hour_rate">Hourly Rate (CAD)</label>
                      <input type="text" class="form-control" id="txt_hour_rate" name="txt_hour_rate" placeholder="Hourly Rate" required  value="<%=tempu.gethourRate()%>">
                    </div>
                    
                    
                     <div class="form-group">
                     Client Type
                     
                     <% if(tempu.getUserType()== 1) {%> <label for="rad_client">Client</label>
                     <% } else if(tempu.getUserType()== 2) {%>
                      <label for="rad_worker">Worker</label>
                     <% }%>
                     <input type="hidden" name="hdd_user_type" value="<%=tempu.getUserType()%>">
                    </div>
                    
                    <% if(tempu.getUserType()== 1) {
						
					PaymentClass objp = new PaymentClass();   
		   
                	PaymentClass tempp;
                	ArrayList<PaymentClass> alp = objp.select("where clientid="+Integer.parseInt(session.getAttribute("sess_user_id").toString()));
					
					String paymentMethod="paypal",cardType="",card_username="",card_password="",card_fullname="";
					int  card_expiry_month=0,  card_expiry_year=0,paymentoptionid=0;
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
                    <div id="container_payment">
                     <div class="form-group">
                     <input type="hidden" name="hdd_paymentoptionid" value="<%=paymentoptionid%>">
                     Payment Type
                      <label for="rad_client">Paypal</label>
                      <input type="radio" id="rad_paypal"  name="rad_payment_type" value="paypal" <%if(paymentMethod=="paypal") {out.println("checked");}%>>
                      <label for="rad_worker">Credit Card</label>
                      <input type="radio" id="rad_creditcard"  name="rad_payment_type" value="creditcard" <%if(paymentMethod!="paypal"){ out.println("checked");}%>>
                    </div>
                    
                    <div class="form-group" id="div_payment_type" <%if(paymentMethod=="paypal") {out.println("style=\"display:none;\"");}%>>
                    <div class="form-group">
                      <label for="exampleInputFile">Credit Type</label>                      
                          <select name="dd_card_type" id="dd_card_type">
                                    <option value="Visa" <%if(cardType=="Visa") {out.println("selected");}%>>Visa</option>
                                    <option value="Master" <%if(cardType=="Master") {out.println("selected");}%>>Master</option>
                          </select>          
                    </div>
                    <div class="form-group">
                      <label for="exampleInputFile">Full Name</label>                      
                      <input type="text" id="txt_card_fullname"  name="txt_card_fullname" required value="<%=card_fullname%>">             
                    </div>
                    
                    <div class="form-group">
                      <label for="exampleInputFile">Expiry</label>                      
                      <select name="dd_card_expiry_month">
                        <option value="">Month</option>
                        <% for(int months=1;months<13;months++){
							String selectedItem="";
							if(card_expiry_month==months) {selectedItem="selected";}
							out.println("<option value=\""+months+"\" "+selectedItem+">"+months+"</option>");
						}%>
                        
                      </select>
                       <select name="dd_card_expiry_year">
                       <option value="">Year</option>
                        <% for(int year=2016;year<2021;year++){
							String selectedItem="";
							if(card_expiry_year==year) {selectedItem="selected";}
							out.println("<option value=\""+year+"\" "+selectedItem+">"+year+"</option>");
						}%>
                        
                      </select>
                    </div>
                    
                    </div>
                    
                    <div class="form-group">
                      <label for="exampleInputFile" id="div_account">Paypal/Credit Card: </label>
                      <input type="text" id="txt_payment_username"  name="txt_payment_username" required value="<%=card_username%>" maxlength="16">                      
                    </div>
                    
                    <div class="form-group">
                      <label for="exampleInputFile" id="div_password">Password/CVV: </label>
                      <input type="password" id="txt_payment_password"  name="txt_payment_password" required value="<%=card_password%>">                      
                    </div>
                    </div>
                    <% } else { %>
                    
                    <div class="form-group">
                <label>Available From (Date):</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control pull-right" name="txt_start_date" id="txt_start_date"  value="<%=tempu.getStartDate()%>">
                </div>
                <!-- /.input group -->
              </div>
              
               <div class="form-group">
                <label>Available End (Date):</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control pull-right" name="txt_end_date" id="txt_end_date"  value="<%=tempu.getEndDate()%>">
                </div>
                <!-- /.input group -->
              </div>
              
              
                    <% }%>
                   
                  </div><!-- /.box-body -->

                  <div class="box-footer">
                    <button type="button" class="btn btn-primary" id="btn_signup">Submit</button>
                    <input type="hidden" name="process" value="edit">
                    
                    
                    <span id="msgbox"></span>
                  </div>
                  
                  
                  
                </form>
              
              <% } 
					 }%>
              
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

$("#txt_start_date, #txt_end_date" ).datepicker({dateFormat: "yy-mm-dd"});

  

	
			$('#rad_client').click(function(data){
				$("#container_payment").show();
			});
			$('#rad_worker').click(function(data){
				$("#container_payment").hide();
			});
			
			$('#rad_paypal').click(function(data){
				$("#div_payment_type").hide();
				$("#div_account").html("Paypal Username: ");
				$("#div_password").html("Paypal Password: ");
			});
			
			$('#rad_creditcard').click(function(data){
				$("#div_payment_type").show();
				$("#div_account").html("Credit Card #: ");
				$("#div_password").html("CVV: ");
			});
	
	
	
				$('#btn_signup').click(function(){       
               	
				if($('#txt_username').val()==""){
					alert("Please enter email as your username.");
					return false;
				}
				if($('#txt_password').val()==""){
					alert("Please enter passowrd.");
					return false;
				}
				
				if($('#txt_firstname').val()==""){
					alert("Please enter your firstname.");
					return false;
				}
				if($('#txt_lastname').val()==""){
					alert("Please enter your lastname.");
					return false;
				}
				if($('#txt_phone').val()==""){
					alert("Please enter your phone.");
					return false;
				}
				if($('#txt_location').val()==""){
					alert("Please enter your location.");
					return false;
				}
						
				
				$.post("Customer",$('#frm_signup').serialize(),function(data){					
				  //alert(data);	
				   if(data == 200){
               			$('#msgbox').html("User has been updated successfully.");
						$('#btn_signup').attr("disabled",true);			
				   }
				
				});
			});
			
			
	
</script>
        
  </body>
</html>
