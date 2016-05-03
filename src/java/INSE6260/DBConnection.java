/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package INSE6260;
import java.sql.*;

/**
 *
 * @author khurram
 */
public class DBConnection {
    
    DBConnection(){
    
    }
    Connection connect(){
         Connection con=null;
    try{  
                
        Class.forName("com.mysql.jdbc.Driver");  
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdsourcing","root",""); 
                
      }
     catch(Exception e){ 
                    con=null;
      } 
    return con;
                
    }
}
