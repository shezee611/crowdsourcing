/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package INSE6260;



import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author khurram
 */
public class Tasks extends HttpServlet {

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
             TasksClass obj = new TasksClass();
             
           if(request.getParameter("process").equals("add")){
             
             String str_name = request.getParameter("txt_name").toString();
             String str_details = request.getParameter("txt_details").toString();
             String str_location = request.getParameter("txt_location").toString();
             String str_expertise = request.getParameter("txt_expertise").toString();
             int catid = Integer.parseInt(request.getParameter("dd_cats").toString());
             int numworkers = Integer.parseInt(request.getParameter("txt_workers").toString());
             int price = Integer.parseInt(request.getParameter("txt_price").toString());
             String startDate= request.getParameter("txt_publish_date")+" 00:00:00";
             String expDate= request.getParameter("txt_completion_date")+" 23:59:59";
             
            
             HttpSession session = request.getSession();
             //out.println("Inside: " +session.getAttribute("sess_user_id").toString()); 
             String result = obj.insert(str_name,str_details,str_location,str_expertise,catid,Integer.parseInt(session.getAttribute("sess_user_id").toString()),numworkers,price,startDate, expDate); 
             out.println(result);
              }
           
              
             if(request.getParameter("process").equals("del")){
               
             int e_id = Integer.parseInt(request.getParameter("e_id").toString());
            
             //out.println("Inside: " +session.getAttribute("sess_user_id").toString()); 
             String result = obj.delete(e_id);              
               //out.println("size: "+al.size());             
                out.println(result);
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
