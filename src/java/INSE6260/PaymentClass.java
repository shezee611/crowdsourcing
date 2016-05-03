/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package INSE6260;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


/**
 *
 * @author Khurram
 */
public class PaymentClass {
    
    
   private DBConnection dbCon;
   private int Id=0;
   private String PaymentMethod=null;  
   private String CardType=null;
   private String Username=null;   
   private String Password=null;
   private int ClientId=0;
   private String FullName=null;
   private int CardExpiryMonth=0;
   private int CardExpiryYear=0;
   
   
    public int getId() {
        return this.Id;
    }

    public void setId(int name) {
        this.Id = name;
    }

    
    public String getPaymentMethod() {
        return this.PaymentMethod;
    }

    public void setPaymentMethod(String name) {
        this.PaymentMethod = name;
    }
    
    
    public String getCardType() {
        return this.CardType;
    }

    public void setCardType(String name) {
        this.CardType = name;
    }
    
    
    public String getUsername() {
        return this.Username;
    }

    public void setUsername(String name) {
        this.Username = name;
    }
    
    
    public String getPassword() {
        return this.Password;
    }

    public void setPassword(String name) {
        this.Password = name;
    }
    
     public void setClientId(int name) {
        this.ClientId = name;
    }
    
   public int getClientId(){
       return this.ClientId;
   }
   
   public PaymentClass(){
       dbCon = new DBConnection();
   }
  public String getFullName() {
        return this.FullName;
    }

    public void setFullName(String name) {
        this.FullName = name;
    }
    
    public int getCardExpiryMonth() {
        return this.CardExpiryMonth;
    }

    public void setCardExpiryMonth(int name) {
        this.CardExpiryMonth = name;
    }
    public int getCardExpiryYear() {
        return this.CardExpiryYear;
    }

    public void setCardExpiryYear(int name) {
        this.CardExpiryYear = name;
    }
   
   
   
   
   public ArrayList<PaymentClass> select(String str_where){
        
         ArrayList<PaymentClass> pl = new ArrayList<PaymentClass>();
        String datax=""; 
        try{  
               
               Connection con = dbCon.connect();  
                // Class.forName("com.mysql.jdbc.Driver");  
                //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdsourcing","root","root"); 

                Statement stmt=con.createStatement();  

                ResultSet rs=stmt.executeQuery("select * from paymentaccounts "+str_where);  
                  
                  PaymentClass tmpObj;
                while(rs.next()) {
                    this.Id = rs.getInt("id");                     
		    this.PaymentMethod= rs.getString("paymentmethod");
                    this.CardType= rs.getString("cardtype");
                    this.Username= rs.getString("username"); 
                    this.Password= rs.getString("password"); 
                    this.FullName= rs.getString("fullname"); 
                    this.CardExpiryMonth= rs.getInt("cardexpirymonth"); 
                    this.CardExpiryYear= rs.getInt("cardexpiryyear"); 
        
                    tmpObj = new PaymentClass();
                    tmpObj.setId(this.Id);                    
                    tmpObj.setPaymentMethod(this.PaymentMethod);
                    tmpObj.setCardType(this.CardType);
                    tmpObj.setUsername(this.Username);
                    tmpObj.setPassword(this.Password);
                    tmpObj.setFullName(this.FullName);
                    tmpObj.setCardExpiryMonth(this.CardExpiryMonth);
                    tmpObj.setCardExpiryYear(this.CardExpiryYear);
                    
		              
                
                pl.add(tmpObj);
                       
                }
                con.close();  

                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                }  
   
     return pl; 
    }
     
     
    String insert(String pm, String ct, String user,String pass,String fullname, int cardexpirymonth, int cardexpiryyear,int clientid){ 
	
	this.PaymentMethod = pm; 
	this.CardType = ct;	    
	this.Username = user;  
        this.Password = pass;
        this.ClientId = clientid;
         this.FullName = fullname;
        this.CardExpiryYear = cardexpiryyear;
        this.CardExpiryMonth = cardexpirymonth;
        
        String datax=""; 
        
       
         
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
   String str_qry = "INSERT INTO paymentaccounts (paymentmethod,cardtype, username, password,fullname,cardexpirymonth,cardexpiryyear,clientid)"
                        + "VALUES ('"+this.PaymentMethod+"','"+this.CardType+"','"+this.Username+"','"+this.Password+"','"+this.FullName+"',"+this.CardExpiryMonth+","+this.CardExpiryYear+","+this.ClientId+")";
               stmt.executeUpdate(str_qry);
          
                con.close(); 
                
            datax ="200";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
   
    
      String update(String pm, String ct, String user,String pass,String fullname, int cardexpirymonth, int cardexpiryyear,int pid){ 
	
	this.PaymentMethod = pm; 
	this.CardType = ct;	    
	this.Username = user;  
        this.Password = pass;        
        this.FullName = fullname;
        this.CardExpiryYear = cardexpiryyear;
        this.CardExpiryMonth = cardexpirymonth;
        this.Id = pid;
        
        String datax=""; 
        
       
         
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
   String str_qry = "update paymentaccounts set "
                        + " paymentmethod='"+this.PaymentMethod+"',cardtype='"+this.CardType+"',username='"+this.Username+"',password='"+this.Password+"',fullname='"+this.FullName+"',cardexpirymonth="+this.CardExpiryMonth+",cardexpiryyear="+this.CardExpiryYear+" where id="+this.Id+"";
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
