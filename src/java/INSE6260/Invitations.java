/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package INSE6260;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author khurram
 */
public class Invitations extends HttpServlet {

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
           InvitationsClass obj = new InvitationsClass();
           MessageClass mObj= new MessageClass();
            UsersClass uTemp = new UsersClass();
            HttpSession session = request.getSession();
            int sess_uid = Integer.parseInt(session.getAttribute("sess_user_id").toString());
              
            if(request.getParameter("process").equals("sendinvitations"))
            {
                
             // List<String> lsWorkers =  Arrays.asList(request.getParameter("str_workers").split("\\s,\\s*"));
              String str_workers = request.getParameter("str_workers").toString();
              List<String> list = new ArrayList<String>(Arrays.asList(str_workers.split(",")));
              int taskid =  Integer.parseInt(request.getParameter("taskid").toString());
             
              
             
              int x=0; 
              String var_response="";
              while(x<list.size()){
              int workerID = Integer.parseInt(list.get(x));
              var_response =  obj.insert(sess_uid, taskid,workerID);
              
              // Code to send messages 
              String subject="Job Offer";
              String message = "Dear Worker,<br><br>Your recieved an offer of a work task by a client "+uTemp.getFullName(sess_uid)+ ". Please look at your invitations and respond accordinly.";
              
              var_response = mObj.insert(sess_uid,workerID, subject, message);
              
              
              x++;
              }
               
               if(list.size()==x)
               out.println(var_response);
                
                
            }
            
             if(request.getParameter("process").equals("acceptreject"))
            {
              String message="",subject="";  
              int taskid =  Integer.parseInt(request.getParameter("taskid").toString());           
              int status =  Integer.parseInt(request.getParameter("status").toString());     
              int clientid =  Integer.parseInt(request.getParameter("clientid").toString());
             
              
               String var_response =  obj.update(sess_uid,taskid,status);
               
               
              if(status==1){          
                           
              assignedtaskClass atObj= new assignedtaskClass();              
              atObj.insert(0,0,sess_uid,taskid,0,"");  
              
              subject="Offer Accepted";
              message = "Dear Client,<br>Your offer for work task has been accepted by worker "+uTemp.getFullName(sess_uid); 
             
              mObj.insert(sess_uid,clientid, subject, message);
              
              
                      
              }
              else if(status == 2)
              {
                  subject="Offer Rejected";
                  message = "Dear Client,<br><br>Your offer for work task has been rejected by worker "+uTemp.getFullName(sess_uid);
                  mObj.insert(sess_uid,clientid, subject, message);
              }
                  
               out.println(var_response);
               
              
                
            }
             
             
             
          if(request.getParameter("process").equals("taskcompleted"))
            {
              String message="",subject="";  
              int taskid =  Integer.parseInt(request.getParameter("taskid").toString());           
              int status =  Integer.parseInt(request.getParameter("status").toString());     
              int clientid =  Integer.parseInt(request.getParameter("clientid").toString());
              
              String str_response="";
              assignedtaskClass atObj = new assignedtaskClass();
              str_response = atObj.updateStatus(status, sess_uid, taskid);
              
                  subject="Task has been completed";
                  message = "Dear Client,<br>Your task has been completed by worker "+uTemp.getFullName(sess_uid);
                  str_response = mObj.insert(sess_uid,clientid, subject, message);
                  
              out.println(str_response);    
            }
          
          if(request.getParameter("process").equals("payment"))
            {
              String message="",subject="";  
              int taskid =  Integer.parseInt(request.getParameter("taskid").toString()); 
              int workerid =  Integer.parseInt(request.getParameter("workerid").toString());
              float rating =  Float.parseFloat(request.getParameter("rating").toString());
              String comments =  request.getParameter("comments").toString();
              int amount = Integer.parseInt(request.getParameter("amount").toString());
              int status =  2;     
              
              
              String str_response="";
              assignedtaskClass atObj = new assignedtaskClass();
              str_response = atObj.updateCompletion(status, workerid, taskid, rating,amount, comments);
              
                  subject="Task has been rated and paid";
                  message = "Dear Worker,<br><br>Your have been paid for a task by client "+uTemp.getFullName(sess_uid);
                  str_response = mObj.insert(sess_uid, workerid,subject, message);
                  
              out.println(str_response);    
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
