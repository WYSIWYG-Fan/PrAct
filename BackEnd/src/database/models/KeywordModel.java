package database.models;


public class KeywordModel extends DatabaseEntry {
	
	private String german;
	private String english;
	private String abbrev;
	
	public KeywordModel(int id, String german, String english, String abbrev) {
		super(id);
		this.german = german;
		this.english = english;
		this.abbrev = abbrev;
	}

	public String getGerman() {
		return german;
	}

	public String getEnglish() {
		return english;
	}

	public String getAbbrev() {
		return abbrev;
	}

}
