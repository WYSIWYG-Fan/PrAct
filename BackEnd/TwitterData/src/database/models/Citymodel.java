package database.models;

import twitter4j.GeoLocation;

public class CityModel extends DatabaseEntry {

	private String name;
	private String province;
	private GeoLocation location;

	public CityModel(int id, String name, String province, double lat, double lon) {
		super(id);
		this.name = name;
		this.province = province;
		this.location = new GeoLocation(lat, lon);
	}
	
	public String getName() {
		return name;
	}
	
	public String getProvince() {
		return province;
	}
	
	public GeoLocation getLocation() {
		return location;
	}
	
	public double getLon() {
		return location.getLongitude();
	}

	public double getLat() {
		return location.getLatitude();
	}
	
}
