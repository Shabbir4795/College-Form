
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Shabbir
 */
public class NewClass {
    public static void main (String[] args) throws Exception
  {
   Class.forName ("oracle.jdbc.driver.OracleDriver");
   Connection conn = DriverManager.getConnection  ("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");                  
    Statement stmt = conn.createStatement();
   ResultSet rset = stmt.executeQuery("select * from login");
    System.out.println ("hi");
    /*if(rset.next())
        System.out.println("Success");
    else
          System.out.println("ERROR");*/
         while (rset.next()){
           System.out.println ("Col 1"); 
           System.out.println (rset.getString(1));   // Print col 1
           System.out.println ("Col 1"); 
       
         }
    
         System.out.println ("bye");
  }
    }


