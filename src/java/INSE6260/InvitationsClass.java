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
public class InvitationsClass {
    
   private DBConnection dbCon;
   private int Id=0;
   private int Clientid=0;
   private int Taskid=0;
   private int Workerid=0;
   private int AcceptStatus=0;
   private String CreatedOn=null;
   
    public int getId() {
        return this.Id;
    }

    public void setId(int name) {
        this.Id = name;
    }

    public int getClientid() {
        return this.Clientid;
    }

    public void setClientid(int name) {
        this.Clientid = name;
    }

    public int getTaskid() {
        return this.Taskid;
    }

    public void setTaskid(int name) {
        this.Taskid = name;
    }

        
    public int getWorkerid() {
        return this.Workerid;
    }

    public void setWorkerid(int name) {
        this.Workerid = name;
    }


    public int getAcceptStatus() {
        return this.AcceptStatus;
    }

    public void setAcceptStatus(int name) {
        this.AcceptStatus = name;
    }
    
    public String getCreatedOn() {
        return this.CreatedOn;
    }

    public void setCreatedOn(String name) {
        this.CreatedOn = name;
    }
    
    
   public InvitationsClass(){
       dbCon = new DBConnection();
   }
   
   
     
     public ArrayList<InvitationsClass> select(String str_where){
        
         ArrayList<InvitationsClass> al = new ArrayList<InvitationsClass>();
        String datax=""; 
        try{  
               
               Connection con = dbCon.connect();  
                // Class.forName("com.mysql.jdbc.Driver");  
                //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdsourcing","root","root"); 

                Statement stmt=con.createStatement();  

                ResultSet rs=stmt.executeQuery("select * from invitations "+str_where);  
                  
                  InvitationsClass tmpObj;
                while(rs.next()) {
                    this.Id= Integer.parseInt(rs.getString("id")); 
		    this.Clientid= Integer.parseInt(rs.getString("clientid")); 
		    this.Taskid= Integer.parseInt(rs.getString("taskid"));		           
                    this.Workerid= Integer.parseInt(rs.getString("workerid"));
		    this.AcceptStatus= Integer.parseInt(rs.getString("acceptStatus")); 
                    this.CreatedOn= rs.getString("createdon");   
        
                    tmpObj = new InvitationsClass();
                    tmpObj.setCreatedOn(this.CreatedOn);
                    tmpObj.setId(this.Id);
		    tmpObj.setClientid(this.Clientid);
		    tmpObj.setTaskid(this.Taskid);		    
		    tmpObj.setWorkerid(this.Workerid); 
		    tmpObj.setAcceptStatus(this.AcceptStatus);             
                
                al.add(tmpObj);
                       
                }
                con.close();  

                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                }  
   
     return al; 
    }
     
     
    String insert(int userid, int taskid, int to ){ 
	
	this.Clientid = userid; 
	this.Taskid = taskid;	    
	this.Workerid = to;  
        this.AcceptStatus = 0; 
        this.CreatedOn="";
        String datax=""; 
        
         DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        System.out.println(dateFormat.format(date));

         this.CreatedOn = dateFormat.format(date);
         
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
   String str_qry = "INSERT INTO invitations (createdon,clientid, taskid, workerid, acceptStatus)"
                        + "VALUES ('"+this.CreatedOn+"',"+this.Clientid+","+this.Taskid+","+this.Workerid+", "+this.AcceptStatus+")";
               stmt.executeUpdate(str_qry);
          
                con.close(); 
                
            datax ="200";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
    
    String update(int userid, int taskid, int acceptStatus){
       
        this.Workerid = userid;
	this.Taskid = taskid;
	
	
	this.AcceptStatus = acceptStatus;
         String datax=""; 
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
               String str_qry = "update invitations set acceptStatus="+this.AcceptStatus+" where taskid="+this.Taskid+" and workerid="+this.Workerid;
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
               String str_qry = "delete from invitations where id="+this.Id;
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
