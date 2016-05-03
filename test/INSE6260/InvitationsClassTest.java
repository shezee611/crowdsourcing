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
public class InvitationsClassTest {
    
    public InvitationsClassTest() {
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
     * Test of select method, of class InvitationsClass.
     */
    @Test
    public void testSelect() {
        System.out.println("select");
        String str_where = " where id=1";
        InvitationsClass instance = new InvitationsClass();
        ArrayList<InvitationsClass> expResult = new ArrayList<InvitationsClass>();
        //expResult.add("200");
        ArrayList<InvitationsClass> result = instance.select(str_where);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       
    }

    /**
     * Test of insert method, of class InvitationsClass.
     */
    @Test
    public void testInsert() {
        System.out.println("insert");
        int userid = 1;
        int taskid = 2;
        int to = 3;
        InvitationsClass instance = new InvitationsClass();
        String expResult = "200";
        String result = instance.insert(userid, taskid, to);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       
    }

    /**
     * Test of update method, of class InvitationsClass.
     */
    @Test
    public void testUpdate() {
        System.out.println("update");
        int userid = 1;
        int taskid = 2;
        int acceptStatus = 1;
        InvitationsClass instance = new InvitationsClass();
        String expResult = "200";
        String result = instance.update(userid, taskid, acceptStatus);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        
    }

    /**
     * Test of delete method, of class InvitationsClass.
     */
    @Test
    public void testDelete() {
        System.out.println("delete");
        int id = 1;
        InvitationsClass instance = new InvitationsClass();
        String expResult = "200";
        String result = instance.delete(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       
    }
    
}
