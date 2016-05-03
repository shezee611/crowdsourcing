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
public class ExpertiesClass {
    
   private DBConnection dbCon;
   private int Id=0;
   private String Name = null;  
   private int Userid=0;
   
    public int getId() {
        return this.Id;
    }

    public void setId(int name) {
        this.Id = name;
    }

    public String getName() {
        return this.Name;
    }

    public void setName(String name) {
        this.Name = name;
    }

    public int getUserid() {
        return this.Userid;
    }

    public void setUserid(int name) {
        this.Userid = name;
    }

   

   
    
   
    
   public ExpertiesClass(){
       dbCon = new DBConnection();
   }
   
   
     
     public ArrayList<ExpertiesClass> select(String str_where){
        
         ArrayList<ExpertiesClass> al = new ArrayList<ExpertiesClass>();
        String datax=""; 
        try{  
               
               Connection con = dbCon.connect();  
                // Class.forName("com.mysql.jdbc.Driver");  
                //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdsourcing","root","root"); 

                Statement stmt=con.createStatement();  

                ResultSet rs=stmt.executeQuery("select * from Experties "+str_where);  
                  
                  ExpertiesClass tmpObj;
                while(rs.next()) {
                    this.Id= Integer.parseInt(rs.getString("id"));
		    this.Userid=Integer.parseInt(rs.getString("userid"));        
                    this.Name= rs.getString("name");
                
        
		    tmpObj = new ExpertiesClass();
		    tmpObj.setName(this.Name);
                    tmpObj.setId(this.Id);
		    tmpObj.setUserid(this.Userid);
		               
                
                al.add(tmpObj);
                       
                }
                con.close();  

                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                }  
   
     return al; 
    }
     
     
    String insert(String name, int userid){  
	
	this.Userid = userid; 
	this.Name = name; 	
        
         String datax=""; 
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
   String str_qry = "INSERT INTO experties (name, userid)"
                        + "VALUES ('"+this.Name+"',"+this.Userid+")";
                stmt.executeUpdate(str_qry);
          
                con.close(); 
                
            datax ="200";
                }
                catch(Exception e){ 
                    datax = e.toString();
                }  
   
     return datax; 
        }
    
    String update(String name){
       
	this.Name = name;
         String datax=""; 
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
               String str_qry = "update experties set status="+this.Name+" where id="+this.Id;
               stmt.executeUpdate(str_qry);
          
                con.close(); 
                
            datax ="success";
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
               String str_qry = "delete from experties where id="+this.Id;
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
