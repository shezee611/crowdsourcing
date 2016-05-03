/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package INSE6260;

import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Khurram
 */
public class UsersClassTest {
    
    public UsersClassTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

   
    /**
     * Test of getLogin method, of class UsersClass.
     */
    @Test
    public void testGetLogin() {
        System.out.println("getLogin");
        String u = "shezee611@yahoo.com";
        String p = "khurram";
        UsersClass instance = new UsersClass();
        String expResult = "valid";
        String result = instance.getLogin(u, p);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       
    }

    /**
     * Test of selectCustomer method, of class UsersClass.
     */
    @Test
    public void testSelectCustomer() {
        System.out.println("selectCustomer");
        String str_where = "where id=1";
        UsersClass instance = new UsersClass();
        ArrayList<UsersClass> expResult = new ArrayList<UsersClass>();
        ArrayList<UsersClass> result = instance.selectCustomer(str_where);
        assertNotNull(result);
        // TODO review the generated test code and remove the default call to fail.
       
    }

    /**
     * Test of addUser method, of class UsersClass.
     */
    @Test
    public void testAddUser() {
        System.out.println("addUser");
        String u = "a";
        String p = "b";
        String f = "s";
        String l = "a";
        String ph = "23232";
        String loc = "as";
        String s = "1";
        String hr = "10";
        String usertype = "1";
        String startdate = "2016-04-01";
        String enddate = "2016-04-01";
        UsersClass instance = new UsersClass();
        String expResult = "200";
        String result = instance.addUser(u, p, f, l, ph, loc, s, hr, usertype, startdate, enddate);
        assertNotNull(result);
        // TODO review the generated test code and remove the default call to fail.
       
    }

    /**
     * Test of update method, of class UsersClass.
     */
    @Test
    public void testUpdate() {
        System.out.println("update");
        int uid = 0;
        String u = "a";
        String p = "b";
        String f = "s";
        String l = "a";
        String ph = "23232";
        String loc = "as";
        String s = "1";
        String hr = "10";
        String usertype = "1";
        String startdate = "2016-04-01";
        String enddate = "2016-04-01";
        UsersClass instance = new UsersClass();
        String expResult = "200";
        String result = instance.update(uid, u, p, f, l, ph, loc, s, hr, usertype, startdate, enddate);
        assertNotNull(result);
        // TODO review the generated test code and remove the default call to fail.
       
    }

    /**
     * Test of matchUsers method, of class UsersClass.
     */
    @Test
    public void testMatchUsers() {
        System.out.println("matchUsers");
        String expertise = "sd";
        String location = "sdds";
        String startdate="2016-04-20 00:00:00";
        String enddate="2016-04-10 00:00:00";
        int taskid = 1;
        UsersClass instance = new UsersClass();
        ArrayList<UsersClass> expResult =  new ArrayList<UsersClass>();
        ArrayList<UsersClass> result = instance.matchUsers(expertise, location, taskid,startdate,enddate);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       
    }

    /**
     * Test of getFullName method, of class UsersClass.
     */
    @Test
    public void testGetFullName() {
        System.out.println("getFullName");
        int id = 1;
        UsersClass instance = new UsersClass();
        String expResult = "Khurram Shahzad";
        String result = instance.getFullName(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       
    }

    /**
     * Test of getExpertise method, of class UsersClass.
     */
    @Test
    public void testGetExpertise() {
        System.out.println("getExpertise");
        int userid = 1;
        UsersClass instance = new UsersClass();
        String expResult = "Java";
        String result = instance.getExpertise(userid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       
    }
    
}
