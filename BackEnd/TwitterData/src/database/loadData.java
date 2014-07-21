package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import database.models.Citymodel;
import database.models.DateModel;
import database.models.KeywordModel;

import twitter4j.Status;

public class loadData {

	public static ArrayList load(Connection con, String table, String model) {
		ArrayList result = null;
		try {
			Statement st = con.createStatement();
			String s = "SELECT * from TweetKeywords;";
			ResultSet rs = st.executeQuery(s);

			// Get applicant Model, fill ArrayList
			switch (model) {
			case "KeywordModel":
				result = new ArrayList<KeywordModel>();
				while (rs.next() == true) {
					result.add(new KeywordModel(Integer.parseInt(rs.getArray(1)
							.toString()), rs.getArray(2).toString(), rs
							.getArray(3).toString(), rs.getArray(4).toString()));
				}
				break;
				
			case "CityModel":
				result = new ArrayList<Citymodel>();
				while (rs.next() == true) {
					result.add(new Citymodel(Integer.parseInt(rs.getArray(1)
							.toString()), rs.getArray(2).toString(), Double.parseDouble(rs
							.getArray(3).toString()), Double.parseDouble(rs.getArray(4).toString())));
				}
				break;
				
			default:
				break;
			}
			st.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
