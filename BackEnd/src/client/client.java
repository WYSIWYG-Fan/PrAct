package client;

import java.sql.Connection;
import java.util.ArrayList;

import database.DatabaseEntry;
import database.KeywordModel;
import database.datasource;
import database.loadData;
import twitter4j.GeoLocation;
import TwitterAPI.search;

public class client {

	public static void main(String[] args) {

		Connection con = datasource.connect();
		ArrayList<KeywordModel> keywords = loadData.load(con, new String(
				"TweetKeywords"), "KeywordModel");

		
		//Get Twitter Entries
		for (int i = 0; i < keywords.size(); i++) {
			if (keywords.get(i).getGerman().length() > 0)
				search.searchTwitter(con, keywords.get(i).getGerman(), 50,
						new GeoLocation(49.487715, 8.461563));
			if (keywords.get(i).getEnglish().length() > 0)
				search.searchTwitter(con, keywords.get(i).getEnglish(), 50,
						new GeoLocation(49.487715, 8.461563));
			if (keywords.get(i).getAbbrev().length() > 0)
				search.searchTwitter(con, keywords.get(i).getAbbrev(), 50,
						new GeoLocation(49.487715, 8.461563));
		}
	}

}
