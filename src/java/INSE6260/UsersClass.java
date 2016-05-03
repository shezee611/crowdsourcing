/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package INSE6260;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

/**
 *
 * @author khurram
 */
public class UsersClass {
   private DBConnection dbCon;
   private int Id=0;
   private String Username = null;
   private String Password = null;
   public String firstname = null;
   private String lastname = null;
   private String phone = null;
   private String location = null;
   private int status=0;
   private int hourRate=0;
   private String pic= null;
   private int UserType = 0;
   private String StartDate=null;
   private String EndDate=null;
   private String CreatedOn=null;
   
   public int getId() {
        return this.Id;
    }

    public void setId(int name) {
        this.Id = name;
    }
    
    public String getusername() {
        return this.Username;
    }

    public void setusername(String name) {
        this.Username = name;
    }
    
     public String getpassword() {
        return this.Password;
    }

    public void setpassword(String name) {
        this.Password = name;
    }
    
    public String getfirstname() {
        return this.firstname;
    }

    public void setfirstname(String name) {
        this.firstname = name;
    }

    public String getlastname() {
        return this.lastname;
    }

    public void setlastname(String name) {
        this.lastname = name;
    }
    public String getphone() {
        return this.phone;
    }

    public void setphone(String name) {
        this.phone = name;
    }
    
    public String getlocation() {
        return this.location;
    }

    public void setlocation(String name) {
        this.location = name;
    }
    
    public int getstatus() {
        return this.status;
    }

    public void setstatus(int name) {
        this.status = name ;
    }
    
    public int gethourRate() {
        return this.hourRate;
    }

    public void sethourRate(int name) {
        this.hourRate = name ;
    }
    
    public String getPhoto() {
        return this.pic;
    }

    public void setPhoto(String name) {
        this.pic = name ;
    }
    
    public int getUserType() {
        return this.UserType;
    }

    public void setUserType(int name) {
        this.UserType = name ;
    }
    
   public String getStartDate() {
        return this.StartDate;
    }

    public void setStartDate(String name) {
        this.StartDate = name ;
    }
    
    public String getEndDate() {
        return this.EndDate;
    }

    public void setEndDate(String name) {
        this.EndDate = name ;
    }
    
    public String getCreatedOn() {
        return this.CreatedOn;
    }

    public void setCreatedOn(String name) {
        this.CreatedOn = name ;
    }
    
    
    
   public UsersClass(){
       dbCon = new DBConnection();
   }
   
    
     String getLogin(String u, String p){
         this.Username = u;
        this.Password = p;
        
        String datax=""; 
        try{  
               
                Connection con = dbCon.connect();                
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("select * from users where username='"+this.Username+"'");  
              
                while(rs.next()) {
                
                 //datax = "U: "+rs.getString("username") +"P: "+rs.getString("password");
               if(rs.getString("password").equals(this.Password))
                datax = "valid";
                
                else
                    datax = "invalid";    
                 }
                con.close();  

                }
        catch(Exception e){ 
                    datax = e.toString();
                }  
   
     return datax; 
    }
     
     public ArrayList<UsersClass> selectCustomer(String str_where){
        
         ArrayList<UsersClass> al = new ArrayList<UsersClass>();
        String datax=""; 
        try{  
               
               Connection con = dbCon.connect();  
                // Class.forName("com.mysql.jdbc.Driver");  
                //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdsourcing","root","root"); 

                Statement stmt=con.createStatement();  
                String qry = "select * from users "+str_where;
                ResultSet rs=stmt.executeQuery(qry);  
                
                   UsersClass tmpObj;
                while(rs.next()) {
                    
                    this.Id = rs.getInt("id");
                    this.Username = rs.getString("username");
                    this.Password = rs.getString("password");
                    this.firstname= rs.getString("firstname");
                    this.lastname= rs.getString("lastname");
                    this.phone= rs.getString("phone");
                    this.location= rs.getString("location");;
                    this.status= rs.getInt("status");
                    this.hourRate=rs.getInt("hourRate");
                    this.pic= rs.getString("pic");
                    this.UserType = rs.getInt("usertype");
                    if(this.UserType==2){
                    this.StartDate= rs.getDate("startdate").toString();
                    this.EndDate= rs.getDate("enddate").toString();
                    }
                    
                    this.CreatedOn= rs.getDate("createdon").toString();
                    
                tmpObj = new UsersClass();
                tmpObj.setId(this.Id);
                tmpObj.setusername(this.Username);
                tmpObj.setpassword(this.Password);
                tmpObj.setfirstname(this.firstname);
                tmpObj.setlastname(this.lastname);
                tmpObj.setphone(this.phone);
                tmpObj.setlocation(this.location);
                tmpObj.setstatus(this.status);
                tmpObj.sethourRate(this.hourRate);
                tmpObj.setPhoto(this.pic);
                tmpObj.setUserType(this.UserType);
                tmpObj.setStartDate(this.StartDate);
                tmpObj.setEndDate(this.EndDate);
                tmpObj.setCreatedOn(this.CreatedOn);
                
                al.add(tmpObj);
                       
                }
                con.close();  

                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                }  
   
     return al; 
    }
     
     
    String addUser(String u, String p, String f, String l, String ph, String loc, String s, String hr, String usertype,String startdate, String enddate ){
        this.Username = u;
        this.Password = p; 
        this.firstname= f;
        this.lastname= l;
        this.phone= ph;
        this.location= loc;
        this.status= Integer.parseInt(s);
        this.hourRate=Integer.parseInt(hr);
        this.UserType = Integer.parseInt(usertype);
        this.StartDate = "2016-01-01 00:00:00";
        this.EndDate = "2020-01-01 00:00:00";
        this.CreatedOn = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        
       
        
         String datax=""; 
        try{  
               
               Connection con = dbCon.connect();  
                // Class.forName("com.mysql.jdbc.Driver");  
                //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdsourcing","root","root"); 

                Statement stmt=con.createStatement();  
String str_qry = "INSERT INTO users (username, password, firstname, lastname, phone, location, status, hourRate,usertype,startdate,enddate,createdon)"
                        + "VALUES ('"+this.Username+"', '"+this.Password+"','"+this.firstname+"', '"+this.lastname+"', '"+this.phone+"', '"+this.location+"',"+this.status+","+this.hourRate+","+this.UserType+",'"+this.StartDate+"','"+this.EndDate+"','"+this.CreatedOn+"')";
                stmt.executeUpdate(str_qry);
          
                con.close();          
              
            datax ="success";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
     String update(int uid,String u, String p, String f, String l, String ph, String loc, String s, String hr, String usertype,String startdate, String enddate ){
        this.Id = uid;
        this.Username = u;
        this.Password = p; 
        this.firstname= f;
        this.lastname= l;
        this.phone= ph;
        this.location= loc;
        this.status= Integer.parseInt(s);
        this.hourRate=Integer.parseInt(hr);
        this.UserType = Integer.parseInt(usertype);
        this.StartDate = startdate;
        this.EndDate = enddate;
       
        
       
        
         String datax=""; 
        try{  
               
               Connection con = dbCon.connect();  
                // Class.forName("com.mysql.jdbc.Driver");  
                //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdsourcing","root","root"); 

                Statement stmt=con.createStatement();  
                String str_qry = "update users set username='"+this.Username+"',password='"+this.Password+"',firstname='"+this.firstname+"',lastname='"+this.lastname+"',phone='"+this.phone+"',location='"+this.location+"',hourRate="+this.hourRate+",startdate='"+this.StartDate+"',enddate='"+this.EndDate+"' where id="+this.Id;
                stmt.executeUpdate(str_qry);
          
                con.close(); 
                
            datax ="200";
                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                    
                }  
   
     return datax; 
        }
   public ArrayList<UsersClass> matchUsers(String expertise, String location, int taskid,String startdate, String enddate){
        
        ArrayList<UsersClass> al = new ArrayList<UsersClass>();
        //al = this.selectCustomer(" where startdate<='"+startdate+"' AND enddate>='"+enddate+"' and status = 1 and usertype =2 and location='"+location+"' and id in(select userid from experties where name='"+expertise+"') and id not in(select workerid from invitations where taskid= "+taskid+" )");   
        al = this.selectCustomer(" where startdate<='"+startdate+"' AND enddate>='"+enddate+"' and status = 1 and usertype =2 and location='"+location+"' and id in(select userid from experties where name='"+expertise+"') and id not in(select workerid from invitations where taskid= "+taskid+" )");   
   
      return al; 
    }
    public ArrayList<UsersClass> matchUsers2(String expertise, String location, int taskid,String startdate, String enddate){
    
         ArrayList<UsersClass> al = new ArrayList<UsersClass>();
        String datax=""; 
        try{  
               
               Connection con = dbCon.connect();  
                // Class.forName("com.mysql.jdbc.Driver");  
                //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdsourcing","root","root"); 

                Statement stmt=con.createStatement();  
                String qry = "SELECT u.* FROM users u INNER JOIN (SELECT sum(assignedtask.amount) as earnedtotal, users.id as userid " +
                "FROM users LEFT JOIN assignedtask ON assignedtask.workerid=users.id GROUP BY users.id) tots ON tots.userid= u.ID "+
                "where u.startdate<='"+startdate+"' AND u.enddate>='"+enddate+"' and u.usertype =2 and u.location='"+location+"' and u.id in(select userid from experties where name='"+expertise+"') and u.id not in(select workerid from invitations where taskid= "+taskid+" ) ORDER BY tots.earnedtotal desc";

                ResultSet rs=stmt.executeQuery(qry);  
                
                   UsersClass tmpObj;
                while(rs.next()) {
                    
                    this.Id = rs.getInt("id");
                    this.Username = rs.getString("username");
                    this.Password = rs.getString("password");
                    this.firstname= rs.getString("firstname");
                    this.lastname= rs.getString("lastname");
                    this.phone= rs.getString("phone");
                    this.location= rs.getString("location");;
                    this.status= rs.getInt("status");
                    this.hourRate=rs.getInt("hourRate");
                    this.pic= rs.getString("pic");
                    this.UserType = rs.getInt("usertype");
                    if(this.UserType==2){
                    this.StartDate= rs.getDate("startdate").toString();
                    this.EndDate= rs.getDate("enddate").toString();
                    }
                    
                    this.CreatedOn= rs.getDate("createdon").toString();
                    
                tmpObj = new UsersClass();
                tmpObj.setId(this.Id);
                tmpObj.setusername(this.Username);
                tmpObj.setpassword(this.Password);
                tmpObj.setfirstname(this.firstname);
                tmpObj.setlastname(this.lastname);
                tmpObj.setphone(this.phone);
                tmpObj.setlocation(this.location);
                tmpObj.setstatus(this.status);
                tmpObj.sethourRate(this.hourRate);
                tmpObj.setPhoto(this.pic);
                tmpObj.setUserType(this.UserType);
                tmpObj.setStartDate(this.StartDate);
                tmpObj.setEndDate(this.EndDate);
                tmpObj.setCreatedOn(this.CreatedOn);
                
                al.add(tmpObj);
                       
                }
                con.close();  

                }
        catch(Exception e){ 
                    datax = e.toString();
                    
                }  
   
     return al; 
        
    }
   public String getFullName(int id)
   {
       String name=null;
       ArrayList<UsersClass> al = new ArrayList<UsersClass>();
       al = this.selectCustomer("where id ="+id);
       UsersClass tempu;
       if(al.size()>0){
                for (int i = 0; i < al.size(); i++) {
                   tempu = new UsersClass();
                   tempu  = al.get(i);               
                   name = tempu.getfirstname()+" "+tempu.getlastname();
                   
                }
       }
       return name;
   }
    public String getEmail(int id)
   {
       String name=null;
       ArrayList<UsersClass> al = new ArrayList<UsersClass>();
       al = this.selectCustomer("where id ="+id);
       UsersClass tempu;
       if(al.size()>0){
                for (int i = 0; i < al.size(); i++) {
                   tempu = new UsersClass();
                   tempu  = al.get(i);               
                   name = tempu.getusername();
                   
                }
       }
       return name;
   }
    
   public String getExpertise(int userid)
   {
   String expertise="";
   
   ExpertiesClass objx= new ExpertiesClass();   
		   
               ExpertiesClass tempx;
               List<String> namesList = new ArrayList<String>();
               ArrayList<ExpertiesClass> alx = objx.select(" where userid='"+userid+"'");  
               
              // out.println("<li>size: "+al.size()+"</li>");
               if(alx.size()>0){
                for (int i = 0; i < alx.size(); i++) {
                   tempx = new ExpertiesClass();
                   tempx  = alx.get(i);               
                   namesList.add(tempx.getName());
                 } 
                expertise = String.join(", ",namesList);
                
               }
                //al = this.selectCustomer(" where id in("+sqlFormatedList(idsList)+")");
                
                
   return expertise;
       
   }
   
  
   
}
