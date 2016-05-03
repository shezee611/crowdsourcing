/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package INSE6260;

/**
 *
 * @author khurram
 */
import java.sql.*;

public class Admin {
    
    String Username = null;
    String Password = null;
    
    Admin(String u, String p)
    {
        this.Username = u;
        this.Password = p;
    }
    
    String getLogin(){
        String datax=""; 
        try{  
                Class.forName("com.mysql.jdbc.Driver");  

                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/crowdsourcing","root","root");  

                //here sonoo is database name, root is username and password  

                Statement stmt=con.createStatement();  

                ResultSet rs=stmt.executeQuery("select * from admin");  

                while(rs.next())  
                if(rs.getString("username").equals(this.Username) && rs.getString("password").equals(this.Password)){
                datax = "valid";
                
                }
                else
                datax = "invalid";    

                con.close();  

                }
        catch(Exception e){ 
                    datax = e.toString();
                }  
   
     return datax; 
    }
    
}
