/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package INSE6260;

import java.sql.*;
import java.util.*;

/**
 *
 * @author khurram
 */
public class assignedtaskClass {
    
   private DBConnection dbCon;
   private int Id=0;
   private int Workerid=0;
   private int Taskid=0;
   private float Rating=0;
   private String Comments = null;  
   private int Status=0;
   private int Amount=0;
   
    public int getId() {
        return this.Id;
    }

    public void setId(int name) {
        this.Id = name;
    }

    public int getWorkerid() {
        return this.Workerid;
    }

    public void setWorkerid(int name) {
        this.Workerid = name;
    }

    public int getTaskid() {
        return this.Taskid;
    }

    public void setTaskid(int name) {
        this.Taskid = name;
    }

    public float getRating() {
        return this.Rating;
    }

    public void setRating(float name) {
        this.Rating = name;
    }

    public String getComments() {
        return this.Comments;
    }

    public void setComments(String name) {
        this.Comments = name;
    }    

    public int getStatus() {
        return this.Status;
    }

    public void setStatus(int name) {
        this.Status = name;
    }
    
    public int getAmount() {
        return this.Amount;
    }

    public void setAmount(int name) {
        this.Amount = name;
    }
    
    
   public assignedtaskClass(){
       dbCon = new DBConnection();
   }
   
   
     
     public ArrayList<assignedtaskClass> select(String str_where){
        
        ArrayList<assignedtaskClass> al = new ArrayList<assignedtaskClass>();
        String datax=""; 
        try{  
               
               Connection con = dbCon.connect();  
                // Class.forName("com.mysql.jdbc.Driver");  
                //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdsourcing","root","root"); 

                Statement stmt=con.createStatement();  

                ResultSet rs=stmt.executeQuery("select * from assignedtask "+str_where);  
                  
                  assignedtaskClass tmpObj;
                while(rs.next()) {
                    this.Id= rs.getInt("id"); 
		    this.Workerid= rs.getInt("workerid"); 
		    this.Taskid= rs.getInt("taskid");     
		    this.Rating= rs.getFloat("rating");         
                    this.Comments= rs.getString("comments");
                    this.Status= rs.getInt("status"); 
                    this.Amount= rs.getInt("amount");   
        
                    tmpObj = new assignedtaskClass();
                    tmpObj.setAmount(this.Amount);
                    tmpObj.setStatus(this.Status);
		    tmpObj.setComments(this.Comments);
                    tmpObj.setId(this.Id);
		    tmpObj.setWorkerid(this.Workerid);
		    tmpObj.setTaskid(this.Taskid);
		    tmpObj.setRating(this.Rating);               
                
                al.add(tmpObj);
                       
                }
                con.close();  

                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                }  
   
     return al; 
    }
     
     
    String insert(int status, int amount,int workerid, int taskid, int rating, String comments ){
        this.Status = status; 
	this.Workerid = workerid;
	this.Taskid = taskid; 
	this.Rating = rating;  
        this.Amount = amount;
	this.Comments = comments;  
        
         String datax=""; 
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
   String str_qry = "INSERT INTO assignedtask (status,amount, workerid, taskid, rating, comments)"
                        + "VALUES ("+this.Status+","+this.Amount+","+this.Workerid+","+this.Taskid+","+this.Rating+",'"+this.Comments+"')";
                stmt.executeUpdate(str_qry);
          
                con.close(); 
                
            datax ="200";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
    
    String update(int status, int id, int rating, String comments){
        this.Status = status;
        this.Id = id;       
	this.Rating = rating;
	this.Comments = comments;
       
        String str_fields_values_to_updates="";
       
        
        if(status == 1)
            str_fields_values_to_updates = "status="+this.Status;
        else
            str_fields_values_to_updates = "status="+this.Status+",workerid="+this.Workerid+",rating="+this.Rating+",taskid="+this.Taskid+",comments='"+this.Comments+"',amount="+this.Amount+"";
        
         String datax=""; 
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
               String str_qry = "update categories set "+str_fields_values_to_updates+" where id="+this.Id;
               stmt.executeUpdate(str_qry);
          
                con.close(); 
                
            datax ="success";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
    public int getStatus(int tid,int workerid)
    {
        int status=0;
     ArrayList<assignedtaskClass> alx = new ArrayList<assignedtaskClass>();
     assignedtaskClass tempx;
     alx = this.select("where taskid="+tid+" and workerid="+workerid);
     if(alx.size()>0)
     {
          for (int i = 0; i < alx.size(); i++) {
                   tempx = new assignedtaskClass();
                   tempx  = alx.get(i);               
                   status = tempx.getStatus();
                 } 
     }
      
        return status;
    }
    String updateStatus(int status, int workerid, int taskid){
        this.Status = status;
        this.Workerid = workerid;       
	this.Taskid = taskid;
	String datax=""; 
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
               String str_qry = "update assignedtask set status = "+this.Status+" where workerid="+this.Workerid+" and taskid="+this.Taskid;
               stmt.executeUpdate(str_qry);
          
                con.close(); 
                
            datax ="200";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
    
     String updateCompletion(int status, int workerid, int taskid,float rating,int amount,String comments){
        this.Status = status;
        this.Workerid = workerid;       
	this.Taskid = taskid;
        this.Rating = rating;
        this.Comments = comments;
        this.Amount = amount;
	String datax=""; 
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
               String str_qry = "update assignedtask set status = "+this.Status+", rating="+this.Rating+",comments='"+this.Comments+"',amount="+this.Amount+" where workerid="+this.Workerid+" and taskid="+this.Taskid;
               stmt.executeUpdate(str_qry);
               con.close(); 
               
               // if Number of worker need for the task are equal to numer of people have worked on the task change status of the project.
               ArrayList<assignedtaskClass> al = this.select("where status=2 and taskid="+taskid);
               TasksClass tempTObj = new TasksClass();
               if(al.size()==tempTObj.getNumWorkers(taskid)){
                 tempTObj.updateStatus(taskid, 1);
               }
               
               
               
                
            datax ="200";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
     
    
    
    
    String delete(int id ){
        
        this.Id = id;
        
         String datax=""; 
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
               String str_qry = "delete from assignedtask where id="+this.Id;
               stmt.executeUpdate(str_qry);          
               con.close();                 
               datax ="success";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
    
    
}
