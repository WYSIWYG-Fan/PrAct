package twitter;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import twitter4j.GeoLocation;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

public class search {

	public static boolean searchTwitter(Connection con, String txt_query,
			int keywordid, double radius, GeoLocation location, boolean saveData, String datebegin, String dateend) {

		// Connection con = datasource.connect();

		if (con != null) {

			// Authenticate via OAuth
			ConfigurationBuilder cb = new ConfigurationBuilder();
			cb.setDebugEnabled(true)
					.setOAuthConsumerKey("xYKZF67JQPrMt7oyb1FCzDDRA")
					.setOAuthConsumerSecret(
							"n4JBPSEfEBlU7AhctiOxGAORomqc3wRfL6HF4O7TZMtat2AkXT")
					.setOAuthAccessToken(
							"2654718439-fLgL391bnHqRzHgWAZz8rwODghlIoE50ATO0Tpj")
					.setOAuthAccessTokenSecret(
							"VfKjACzwhgPMkL3o8fUOurABWKnqBzeusEKbkaoRqsEON");

			// The factory instance is re-useable and thread safe.
			TwitterFactory tf = new TwitterFactory(cb.build());
			Twitter twitter = tf.getInstance();

			// Create Twitter query with given arguments
			Query query = new Query(txt_query);
			query.count(100);
			query.setSince(datebegin);
			query.setUntil(dateend);
			query.setGeoCode(location, radius, Query.KILOMETERS);
			QueryResult result;

			try {
				result = twitter.search(query);
				if (saveData && result != null) {
					search.saveTwitterData(con, result, keywordid, location);
				} else {
					for (Status status : result.getTweets()) {
						System.out.println("@"
								+ status.getUser().getScreenName() + ":"
								+ status.getText());
					}
				}
			} catch (TwitterException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return true;

		} else
			return false;
	}

	@SuppressWarnings("deprecation")
	private static boolean saveTwitterData(Connection con, QueryResult result,
			int keywordid, GeoLocation location) {
		Statement st;
		for (Status status : result.getTweets()) {
			try {
				st = con.createStatement();
				
				// insert data into databases

				// check whether date is already available
				String sSelectDate = "SELECT date_id from DateDimension where day ="
						+ status.getCreatedAt().getDay()
						+ " and month = "
						+ status.getCreatedAt().getMonth() + ";";
				ResultSet rs = st.executeQuery(sSelectDate);
				int dateid;

				if (rs.next()) {
					//get existant dateID
					dateid = Integer.parseInt(rs.getArray(1).toString());
				}
				else {
					
					// to simplify the statements, winter is defined to be from
					// beginnings January to end of March, Spring: April - June,
					// Autumn: July - September, Winter: October- December
					int season = 0;
					switch (status.getCreatedAt().getMonth()) {
					case 1:
						season = 4;
						break;
					case 2:
						season = 4;
						break;
					case 3:
						season = 4;
						break;
					case 4:
						season = 1;
						break;
					case 5:
						season = 1;
						break;
					case 6:
						season = 1;
						break;
					case 7:
						season = 2;
						break;
					case 8:
						season = 2;
						break;
					case 9:
						season = 2;
						break;
					case 10:
						season = 3;
						break;
					case 11:
						season = 3;
						break;
					case 12:
						season = 3;
						break;
					default:
						break;
					}
					
					//insert Date into database, get dateID
					String sInsertDate = "INSERT INTO datedimension (day, month, season_id) values("
							+ status.getCreatedAt().getDay()
							+ ", "
							+ status.getCreatedAt().getMonth()
							+ ", "
							+ season
							+ ");";
					st.execute(sInsertDate);

					sSelectDate = "SELECT date_id from DateDimension where day ="
							+ status.getCreatedAt().getDay()
							+ " and month = "
							+ status.getCreatedAt().getMonth() + ";";
					rs = st.executeQuery(sSelectDate);
					rs.next();
					dateid = Integer.parseInt(rs.getArray(1).toString());
				};

				String text = status.getText();
				text.replaceAll("'", " ");
				text.replaceAll("\"", "");
				String sInsertTweet = "INSERT INTO twitterdata (keyword_id, date_id, latitude, longitude, content) values("
						+ keywordid
						+ ", "
						+ dateid
						+ ", "
						+ (status.getGeoLocation() == null ? location
								.getLatitude() : status.getGeoLocation()
								.getLatitude())
						+ ", "
						+ (status.getGeoLocation() == null ? location
								.getLongitude() : status.getGeoLocation()
								.getLongitude())
						+ ", "
						+ "'"
						+ text
						+ "'"
						+ ");";
				System.out.println(sInsertTweet);
				st.execute(sInsertTweet);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return false;
	}
}
