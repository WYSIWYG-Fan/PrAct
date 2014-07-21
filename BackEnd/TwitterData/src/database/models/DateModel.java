package database.models;

public class DateModel extends DatabaseEntry {
	private int day;
	private int month;
	private int seasonid;

	DateModel(int id, int day, int month, int seasonid) {
		super(id);
		this.day = day;
		this.month = month;
		this.seasonid = seasonid;
	}

	public int getDay() {
		return day;
	}

	public int getMonth() {
		return month;
	}

	public int getSeasonid() {
		return seasonid;
	}

}
