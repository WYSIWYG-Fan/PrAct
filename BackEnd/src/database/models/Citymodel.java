package database.models;

public class Citymodel extends DatabaseEntry {
	
	private String name;
	private GeoLocation location;

	public Citymodel(int id, String name, double lat, double lon) {
		super(id);
		this.name = name;
		this.location = new GeoLocation(lat, lon);
	}

	public String getName() {
		return name;
	}

	public GeoLocation getLocation() {
		return location;
	}
	
	

}
