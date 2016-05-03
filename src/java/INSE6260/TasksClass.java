/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package INSE6260;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

/**
 *
 * @author khurram
 */
public class TasksClass {
    
   private DBConnection dbCon;
   private int Id=0;
   private String Title = null; 
   private String Details = null;
   private String Location = null;
   private String Experties = null;
   private int Uid=0;
   private int Catid=0;
   private int Status=0;
   private int NumWorkers =0;
   private int Price = 0;
   private String PublishedDate = null;
   private String ExpiredDate = null;
   
    public int getId() {
        return this.Id;
    }

    public void setId(int name) {
        this.Id = name;
    }
 
    public String getTitle() {
        return this.Title;
    }

    public void setTitle(String name) {
        this.Title = name;
    }    

    public String getDetails() {
        return this.Details;
    }

    public void setDetails(String name) {
        this.Details = name;
    }    

    public String getLocation() {
        return this.Location;
    }

    public void setLocation(String name) {
        this.Location = name;
    }    

    public String getExperties() {
        return this.Experties;
    }

    public void setExperties(String name) {
        this.Experties = name;
    }     

    public int getUid() {
        return this.Uid;
    }

    public void setUid(int name) {
        this.Uid = name;
    }

    public int getCatid() {
        return this.Catid;
    }

    public void setCatid(int name) {
        this.Catid = name;
    }

    public int getStatus() {
        return this.Status;
    }

    public void setStatus(int name) {
        this.Status = name;
    }
    
     public int getNumWorkers() {
        return this.NumWorkers;
    }

    public void setNumWorkers(int name) {
        this.NumWorkers = name;
    }
    
    public int getPrice() {
        return this.Price;
    }

    public void setPrice(int name) {
        this.Price = name;
    }
    
     public String getPublishedDate() {
        return this.PublishedDate;
    }

    public void setPublishedDate(String name) {
        this.PublishedDate = name;
    }
    
    
     public String getExpiredDate() {
        return this.ExpiredDate;
    }

    public void setExpiredDate(String name) {
        this.ExpiredDate = name;
    }
    
    
    
    
    
    
   
    
    
   public TasksClass(){
       dbCon = new DBConnection();
   }
   
   
     
     public ArrayList<TasksClass> select(String str_where){
        
         ArrayList<TasksClass> al = new ArrayList<TasksClass>();
        String datax=""; 
        try{  
               
               Connection con = dbCon.connect();  
                // Class.forName("com.mysql.jdbc.Driver");  
                //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdsourcing","root","root"); 

                Statement stmt=con.createStatement();  

                ResultSet rs=stmt.executeQuery("select * from tasks "+str_where);  
                  
                  TasksClass tmpObj;
                while(rs.next()) {
                    this.Id= rs.getInt("id"); 
		    this.Catid= rs.getInt("catid"); 		                
                    this.Title= rs.getString("title");
		    this.Details= rs.getString("details");
 		    this.Location= rs.getString("location");
	            this.Experties= rs.getString("experties");
                    this.Uid= rs.getInt("uid");
                    this.Status= rs.getInt("status");
                    this.NumWorkers = rs.getInt("numworkers");
                    this.Price = rs.getInt("price");
                    this.ExpiredDate = rs.getString("expireddate");
                    this.PublishedDate = rs.getString("publisheddate");
                     
        
                    tmpObj = new TasksClass();                   
                    tmpObj.setStatus(this.Status);
		    tmpObj.setTitle(this.Title);
                    tmpObj.setId(this.Id);
		    tmpObj.setUid(this.Uid);
		    tmpObj.setDetails(this.Details);
		    tmpObj.setLocation(this.Location);  
		    tmpObj.setExperties(this.Experties);               
                    tmpObj.setCatid(this.Catid);   
                    tmpObj.setNumWorkers(this.NumWorkers);
                    tmpObj.setPrice(this.Price);
                    tmpObj.setExpiredDate(this.ExpiredDate);
                    tmpObj.setPublishedDate(this.PublishedDate);
                             
                
                al.add(tmpObj);
                       
                }
                con.close();  

                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                }  
   
     return al; 
    }
     
     
    String insert(String title, String details, String location, String experties,int catid,int uid,int numworkers,int price, String startDate, String expDate ){
        this.Status = 0;	
	this.Uid = uid; 
	this.Catid = catid; 
	this.Experties = experties;    
	this.Location = location;  
	this.Details = details;  
	this.Title = title;  
        this.NumWorkers = numworkers;
        this.Price = price;
        this.PublishedDate = startDate;
        this.ExpiredDate = expDate;
       
        
        //DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //Date date = new Date();
        //System.out.println(dateFormat.format(date));

        // this.PublishedDate = dateFormat.format(date);
         
         String datax=""; 
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
   String str_qry = "INSERT INTO tasks (status,uid, catid, location, title,details, experties,numworkers,price,publisheddate,expireddate)"
                        + "VALUES ("+this.Status+","+this.Uid+","+this.Catid+",'"+this.Location+"','"+this.Title+"','"+this.Details+"','"+this.Experties+"',"+this.NumWorkers+","+this.Price+",'"+this.PublishedDate+"','"+this.ExpiredDate+"')";
                stmt.executeUpdate(str_qry);
          
                con.close(); 
                
            datax ="200";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
    
    String update(String status,int id, int uid, int catid, String location, String details, String title, String experties, int numworkers,int price, String expDate){
        this.Status = Integer.parseInt(status);
        this.Id = id;
        this.Uid = uid;
	this.Catid = catid;
	this.Location = location; 
	this.Details = details;  
	this.Title = title; 
	this.Experties = experties;
        this.NumWorkers = numworkers;
        this.Price = price;
        this.ExpiredDate = expDate;
       
         String datax=""; 
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
               String str_qry = "update tasks set status="+this.Status+",uid="+this.Uid+",catid="+this.Catid+",location='"+this.Location+"',title='"+this.Title+"',details='"+this.Details+"',experties='"+this.Experties+"',numworkers="+this.NumWorkers+",price="+this.Price+",expirieddate='"+this.ExpiredDate+"' where id="+this.Id;
               stmt.executeUpdate(str_qry);
          
                con.close(); 
                
            datax ="200";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
   
   public int getNumWorkers(int tid){
       
       ArrayList<TasksClass> tl = this.select("where id="+tid);	
       return tl.size();
   } 
    
   public String updateStatus(int tid,int status){
      
        this.Status = status;
        this.Id = tid;
       
       
         String datax=""; 
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
               String str_qry = "update tasks set status="+this.Status+" where id="+this.Id;
               stmt.executeUpdate(str_qry);          
                con.close(); 
                
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
               String str_qry = "delete from tasks where id="+this.Id;
               stmt.executeUpdate(str_qry);          
               con.close();                 
               datax ="200";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
    
    
}
