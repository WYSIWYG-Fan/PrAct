package client;

import twitter4j.GeoLocation;
import TwitterAPI.search;

public class client {
	
	public static void main(String[] args) {
		
		search.searchTwitter("#BBQ", 50, new GeoLocation(49.487715, 8.461563));
	}

}
