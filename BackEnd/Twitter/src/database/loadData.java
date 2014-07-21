package database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import database.models.CityModel;
import database.models.DateModel;
import database.models.KeywordModel;

public class loadData {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static ArrayList load(Connection con, String table, String model,
			String condition) {
		ArrayList result = null;
		try {
			Statement st = con.createStatement();
			String s = "SELECT * from TweetKeywords"
					+ (condition.length() > 0 ? (" where " + condition + ";")
							: ";");
			ResultSet rs = st.executeQuery(s);

			// Get applicant Model, fill ArrayList
			switch (model) {
			case "KeywordModel":
				result = new ArrayList<KeywordModel>();
				while (rs.next()) {
					result.add(new KeywordModel(Integer.parseInt(rs.getArray(1)
							.toString()), rs.getArray(2).toString(), rs
							.getArray(3).toString(), rs.getArray(4).toString()));
				}
				break;
			case "CityModel":
				result = new ArrayList<CityModel>();
				while (rs.next()) {
					result.add(new CityModel(Integer.parseInt(rs.getArray(1)
							.toString()), rs.getArray(2).toString(), rs
							.getArray(3).toString(), Double.parseDouble(rs
							.getArray(4).toString()), Double.parseDouble(rs
							.getArray(5).toString())));
				}
				break;
			case "DateModel":
				result = new ArrayList<DateModel>();
				while (rs.next()) {
					result.add(new DateModel(Integer.parseInt(rs.getArray(1)
							.toString()), Integer.parseInt(rs.getArray(2)
							.toString()), Integer.parseInt(rs.getArray(3)
							.toString()), Integer.parseInt(rs.getArray(4)
							.toString())));
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