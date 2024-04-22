package src;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connectionDB{
     public static Connection getCon()
    {   
        Connection con=null;
        try{
         Class.forName("com.mysql.cj.jdbc.Driver");
         con =DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping_cart?useSSL=false","root","root");
        
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
         return con;
    }
}

