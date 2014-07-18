package TwitterAPI;

import java.sql.Connection;

import database.datasource;

import twitter4j.GeoLocation;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

public class search {

	public static boolean searchTwitter(Connection con, String txt_query, double radius,
			GeoLocation location) {

//		Connection con = datasource.connect();

		if (con != null) {

			//Authenticate via OAuth
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
			
			//Create Twitter query with given arguements
			Query query = new Query(txt_query);
			query.count(100);
			query.setGeoCode(location, radius, Query.KILOMETERS);
			QueryResult result;
			
			try {
				result = twitter.search(query);
				for (Status status : result.getTweets()) {
					System.out.println("@" + status.getUser().getScreenName()
							+ ":" + status.getText());
				}
			} catch (TwitterException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("catch clause");
			}

			
			return true;
			
		} else
			return false;
	}

}
