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
public class CategoryClass {
    
   private DBConnection dbCon;
   private String Name = null;   
   private int Id=0;
   private int Status=0;
   private String ClassName=null;
   
    public String getName() {
        return this.Name;
    }

    public void setName(String name) {
        this.Name = name;
    }
    
     public int getId() {
        return this.Id;
    }

    public void setId(int name) {
        this.Id = name;
    }
    
    public int getStatus() {
        return this.Status;
    }

    public void setStatus(int name) {
        this.Status = name;
    }
    
    public String getClassName() {
        return this.ClassName;
    }

    public void setClassName(String name) {
        this.ClassName = name;
    }
    
    
   public CategoryClass(){
       dbCon = new DBConnection();
   }
   
   
     
     public ArrayList<CategoryClass> select(String str_where){
        
         ArrayList<CategoryClass> al = new ArrayList<CategoryClass>();
        String datax=""; 
        try{  
               
               Connection con = dbCon.connect();  
                // Class.forName("com.mysql.jdbc.Driver");  
                //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdsourcing","root","root"); 

                Statement stmt=con.createStatement();  

                ResultSet rs=stmt.executeQuery("select * from categories "+str_where);  
                  
                  CategoryClass tmpObj;
                while(rs.next()) {
                    this.Id= Integer.parseInt(rs.getString("id"));   
                    this.Name = rs.getString("name");
                    this.Status= Integer.parseInt(rs.getString("status")); 
                    this.ClassName= rs.getString("class");   
        
                    tmpObj = new CategoryClass();
                    tmpObj.setName(this.Name);
                    tmpObj.setClassName(this.ClassName);
                    tmpObj.setStatus(this.Status);
                    tmpObj.setId(this.Id);
                
                
                al.add(tmpObj);
                       
                }
                con.close();  

                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                }  
   
     return al; 
    }
     
     
    String insert(String name, String status, String classname ){
        this.Name = name;
        this.Status = Integer.parseInt(status);         
        
         String datax=""; 
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
String str_qry = "INSERT INTO categories (name,status,class)"
                        + "VALUES ('"+this.Name+"',"+this.Status+",'"+this.ClassName+"')";
                stmt.executeUpdate(str_qry);
          
                con.close(); 
                
            datax ="success";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
    
    String update(String name, String status, int id ){
        this.Name = name;
        this.Status = Integer.parseInt(status);
        this.Id = id;
        
         String datax=""; 
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
               String str_qry = "update categories set name='"+this.Name+"',status="+this.Status+",class='"+this.ClassName+"' where id="+this.Id;
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
               String str_qry = "delete from categories where id="+this.Id;
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
