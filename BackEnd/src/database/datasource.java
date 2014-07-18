package database;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;


public class datasource {


	public static Connection connect() {
 
		try {
 
			Class.forName("org.postgresql.Driver");
 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		}
 
		Connection connection = null;
 
		try {
 
			connection = DriverManager.getConnection(
					"jdbc:postgresql://127.0.0.1:5432/PrAct", "postgres",
					"Your-Password");												//TODO Passwort eintragen!!! ;)
 
		} catch (SQLException e) {
 
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return null;
		}
		
		return connection;
	}
	
	public static boolean close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
}



