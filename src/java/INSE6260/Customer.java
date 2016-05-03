/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package INSE6260;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author khurram
 */
public class Customer extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           //out.println(request.getParameter("process"));
            UsersClass ob_user = new UsersClass();
            if(request.getParameter("process").equals("login")){
                
            String str_username = request.getParameter("username").toString();
            String str_password = request.getParameter("password").toString();
           // out.println(str_username);
           // out.println(str_password);
           /*
           // out.println(ob_user.getLogin());
                if(ob_user.getLogin(str_username,str_password).equals("valid")){
                HttpSession session = request.getSession();
                session.setAttribute("sess_username",str_username);
                session.setAttribute("sess_user_status", "login");
                out.println("200");
                }
                else{
                    out.println("201");
                }
              */
           
               UsersClass temp;
               ArrayList<UsersClass> al = ob_user.selectCustomer("where username='"+str_username+"' and password='"+str_password+"'");               
               //out.println("size: "+al.size());
               if(al.size()>0){
               for (int i = 0; i < al.size(); i++) {
                temp = new UsersClass();
		temp  = al.get(i);
               // out.print(" <br> "+i+" : "+temp.getfirstname()+" "+temp.getlastname());
               // out.print(" <br> "+i+" : "+temp.getfirstname());
               HttpSession session = request.getSession();
               session.setAttribute("sess_username",temp.getfirstname()+" "+temp.getlastname());
               session.setAttribute("sess_photo",temp.getId()+".jpg");
               session.setAttribute("sess_user_id",temp.getId());
               session.setAttribute("sess_user_type",temp.getUserType());
               session.setAttribute("sess_user_status", "login");               
               session.setAttribute("sess_user_createdon",temp.getCreatedOn());
        
		}
               
                out.println("200");
                }
                else{
                    out.println("201");
                }
               


           }
            
          if(request.getParameter("process").equals("logout")){
             request.getSession().invalidate();
             response.sendRedirect(request.getContextPath() + "/index.jsp");
         }
         
          if(request.getParameter("process").equals("checkuser")){
                
            String str_username = request.getParameter("txt_username").toString();
            
               ArrayList<UsersClass> al = ob_user.selectCustomer("where username='"+str_username+"'");               
               //out.println(str_username+ " has size: "+al.size());
               if(al.size()>0){                    
                out.println("200");
                }
                else{
                    out.println("201");
                }
               


           }
          
         if(request.getParameter("process").equals("signup")){
            // out.println(request.getParameter("process"));
             try{
             String str_username = request.getParameter("txt_username").toString();
             String str_password = request.getParameter("txt_password").toString();
             String str_firstname = request.getParameter("txt_firstname").toString();
             String str_lastname = request.getParameter("txt_lastname").toString();
             String str_phone = request.getParameter("txt_phone").toString();
             String str_location = request.getParameter("txt_location").toString();
            // String str_status =  request.getParameter("txt_status").toString();
             String str_hourRate =  request.getParameter("txt_hour_rate").toString();
             String str_usertype =  request.getParameter("rad_user_type").toString();
             
              //file_photo
             
              
               String var_response =  ob_user.addUser(str_username, str_password, str_firstname, str_lastname, str_phone, str_location, "1", str_hourRate,str_usertype,"","");
              // out.println(var_response);
              // Save paymenet details if user type is 1
             
               if(var_response.equals("success"))
                   out.println("200");
                else
                   out.println("201");
             }
             catch(Exception e){
                 out.println(e.toString());
              
             }
                   
               
         }
         
           if(request.getParameter("process").equals("edit")){
            // out.println(request.getParameter("process"));
             try{
             
             String str_username = request.getParameter("txt_username").toString();
             String str_password = request.getParameter("txt_password").toString();
             String str_firstname = request.getParameter("txt_firstname").toString();
             String str_lastname = request.getParameter("txt_lastname").toString();
             String str_phone = request.getParameter("txt_phone").toString();
             String str_location = request.getParameter("txt_location").toString();
            // String str_status =  request.getParameter("txt_status").toString();
             String str_hourRate =  request.getParameter("txt_hour_rate").toString();
             String str_usertype =  request.getParameter("hdd_user_type").toString();
             HttpSession session = request.getSession();
             int sess_uid = Integer.parseInt(session.getAttribute("sess_user_id").toString());
             
             String str_startdate="2000-10-10",str_enddate="2000-10-10";
             
             if(str_usertype.equals("2"))
             {
                str_startdate = request.getParameter("txt_start_date").toString();
                str_enddate = request.getParameter("txt_end_date").toString();
             }
              //file_photo
             
              
               String var_response =  ob_user.update(sess_uid,str_username, str_password, str_firstname, str_lastname, str_phone, str_location, "1", str_hourRate,str_usertype,str_startdate,str_enddate);
              // out.println(var_response);
              // Save paymenet details if user type is 1
              
              if(Integer.parseInt(str_usertype)==1){
                
                    String payment_type = request.getParameter("rad_payment_type").toString();            
                    String card_type =  request.getParameter("dd_card_type").toString();
                    String payment_username =  request.getParameter("txt_payment_username").toString();
                    String payment_password = request.getParameter("txt_payment_username").toString();     
                    String card_fullname = request.getParameter("txt_card_fullname").toString();
                    int card_expiry_month = Integer.parseInt(request.getParameter("dd_card_expiry_month").toString());
                    int card_expiry_year = Integer.parseInt(request.getParameter("dd_card_expiry_year").toString());
                    int paymentoptionid = Integer.parseInt(request.getParameter("hdd_paymentoptionid").toString());
                   
                    
                    PaymentClass pobj = new PaymentClass();
                    if(paymentoptionid==0){
                    var_response =  pobj.insert(payment_type, card_type, payment_username, payment_password,card_fullname, card_expiry_month, card_expiry_year, sess_uid);
                    }
                    else {
                        var_response =  pobj.update(payment_type, card_type, payment_username, payment_password,card_fullname, card_expiry_month, card_expiry_year, paymentoptionid);
                    }
                        
                    
                    //var_response =  pobj.insert(payment_type, card_type, payment_username, payment_password, sess_uid, card_fullname, card_expiry_month, card_expiry_year);
                
              
              
              
              }
                out.println(var_response);
             }
             catch(Exception e){
                 out.println(e.toString());
              
             }
                   
               
         }
           
          if(request.getParameter("process").equals("getcustomer")){
              
              UsersClass temp;
               ArrayList<UsersClass> al = ob_user.selectCustomer("where id>1");
               //out.println("size: "+al.size());
               
               for (int i = 0; i < al.size(); i++) {
                temp = new UsersClass();
		temp  = al.get(i);
                out.print(" <br> "+i+" : "+temp.getfirstname()+" "+temp.getlastname());
               // out.print(" <br> "+i+" : "+temp.getfirstname());
                 
		}

              
          } 
            
            
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
