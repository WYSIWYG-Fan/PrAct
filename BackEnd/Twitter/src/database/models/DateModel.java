package database.models;

public class DateModel extends DatabaseEntry {

	private int day;
	private int month; 
	private int seasonID;
	
	public DateModel(int id, int day, int month, int seasonID) {
		super(id);
		this.day = day;
		this.month = month;
		this.seasonID = seasonID;
	}

	public int getDay() {
		return day;
	}

	public int getMonth() {
		return month;
	}

	public int getSeasonID() {
		return seasonID;
	}

}
