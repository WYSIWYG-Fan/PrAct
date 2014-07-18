package database.models;

public class TwitterModel extends DatabaseEntry{
	
	private int keywordID;
	private int dateID;
	private double lat;
	private double lon;
	private String content;

	public TwitterModel(int id, int keywordID, int dateID, double lat, double lon, String content) {
		super(id);
		this.keywordID = keywordID;
		this.dateID = dateID;
		this.lat = lat;
		this.lon = lon;
		this.content = content;
	}

	public int getKeywordID() {
		return keywordID;
	}

	public int getDateID() {
		return dateID;
	}

	public double getLat() {
		return lat;
	}

	public double getLon() {
		return lon;
	}

	public String getContent() {
		return content;
	}

}
