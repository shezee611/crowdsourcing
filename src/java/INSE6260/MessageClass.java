/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package INSE6260;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Khurram
 */
public class MessageClass {
    
   private DBConnection dbCon;
   private int Id=0;
   private int Sender=0;
   private int Receiver=0;
   private String Subject=null;
   private String Messagetxt=null;
   private int Status=0;
   private String CreatedOn=null;
   
    public int getId() {
        return this.Id;
    }

    public void setId(int name) {
        this.Id = name;
    }

    public int getSender() {
        return this.Sender;
    }

    public void setSender(int name) {
        this.Sender = name;
    }
    public int getReceiver() {
        return this.Receiver;
    }

    public void setReceiver(int name) {
        this.Receiver = name;
    }
    public String getSubject() {
        return this.Subject;
    }

    public void setSubject(String name) {
        this.Subject = name;
    }
    
        public String getMessage() {
        return this.Messagetxt;
    }

    public void setMessage(String name) {
        this.Messagetxt = name;
    }
    
    public int getStatus() {
        return this.Status;
    }

    public void setStatus(int name) {
        this.Status = name;
    }
    public String getCreatedOn() {
        return this.CreatedOn;
    }

    public void setCreatedOn(String name) {
        this.CreatedOn = name;
    }
    
    
   public MessageClass(){
       dbCon = new DBConnection();
   }
   
   
   public ArrayList<MessageClass> select(String str_where){
        
         ArrayList<MessageClass> ml = new ArrayList<MessageClass>();
        String datax=""; 
        try{  
               
               Connection con = dbCon.connect();  
                // Class.forName("com.mysql.jdbc.Driver");  
                //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdsourcing","root","root"); 

                Statement stmt=con.createStatement();  

                ResultSet rs=stmt.executeQuery("select * from messages "+str_where);  
                  
                  MessageClass tmpObj;
                while(rs.next()) {
                    this.Id = rs.getInt("id"); 
                    this.Sender = rs.getInt("sender"); 
                    this.Receiver = rs.getInt("receiver"); 
                    this.Status = rs.getInt("status"); 
		    this.Subject= rs.getString("subject");
                    this.Messagetxt= rs.getString("message");
                    this.CreatedOn= rs.getString("createdon");   
        
                    tmpObj = new MessageClass();
                    tmpObj.setId(this.Id);                    
                    tmpObj.setSender(this.Sender);
                    tmpObj.setReceiver(this.Receiver);
                    tmpObj.setStatus(this.Status);
                    tmpObj.setSubject(this.Subject);
                    tmpObj.setMessage(this.Messagetxt);
                    tmpObj.setCreatedOn(this.CreatedOn);
                    
		              
                
                ml.add(tmpObj);
                       
                }
                con.close();  

                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                }  
   
     return ml; 
    }
     
     
    String insert(int sender, int receiver, String subject,String message ){ 
	
	this.Sender = sender; 
	this.Receiver = receiver;	    
	this.Subject = subject;  
        this.Messagetxt = message;
        this.Status = 0; 
        this.CreatedOn="";
        String datax="";
        
        
         DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        System.out.println(dateFormat.format(date));

         this.CreatedOn = dateFormat.format(date);
         
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
   String str_qry = "INSERT INTO messages (createdon,sender, receiver, subject, message)"
                        + "VALUES ('"+this.CreatedOn+"',"+this.Sender+","+this.Receiver+",'"+this.Subject+"','"+this.Messagetxt+"')";
               stmt.executeUpdate(str_qry);
          
                con.close();
            
           UsersClass uTemp = new UsersClass();     
           this.sendEmail(uTemp.getEmail(this.Receiver),uTemp.getEmail(this.Sender),this.Subject,this.Messagetxt);
                
            datax ="200";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
    
    public String update(int messageid){
       
        this.Id = messageid;
	
	
	
	this.Status = 1;
         String datax=""; 
        try{  
               
               Connection con = dbCon.connect();                
               Statement stmt=con.createStatement();  
               String str_qry = "update messages set status="+this.Status+" where id="+this.Id;
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
               String str_qry = "delete from messages where id="+this.Id;
               stmt.executeUpdate(str_qry);          
               con.close();                 
               datax ="200";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
     
    
    public  Boolean sendEmail(String sendTo,String sendFrom,String subject, String messageText) {
		
        
                Properties props = System.getProperties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", true);
                props.put("mail.smtp.starttls.enable", true);
		props.put("mail.smtp.port", "465");

		Session session = Session.getDefaultInstance(props,null);
		session.setDebug(true);

        
   /*     
    Properties props = new Properties();
    props.put("mail.smtp.user", "shezee611@gmail.com");
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "465");
    props.put("mail.smtp.starttls.enable","true");
    props.put("mail.smtp.debug", "true");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.socketFactory.port", "465");
    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    props.put("mail.smtp.socketFactory.fallback", "false");
    
    Session session = Session.getInstance(props, null);
    session.setDebug(true);
    
   */ 
    
		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(sendFrom));//// here write your address
			message.setRecipient(Message.RecipientType.TO,new InternetAddress(sendTo));
			message.setContent(message,"text/html");
			message.setSubject(subject);
			message.setText(messageText);
			
			Transport transport=session.getTransport("smtp");
			transport.connect("smtp.gmail.com","shezee611", "M2362Ashezee");//here write username and password for the mail
			transport.sendMessage(message, message.getAllRecipients());
			//System.out.println("Done");
			return true;

		} catch (MessagingException e) {
			//throw new RuntimeException(e);
			System.out.println(e);
			return false;
			
		}
	}
    
     
    
}
