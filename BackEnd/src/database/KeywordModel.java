package database;

public class KeywordModel extends DatabaseEntry {
	
	private String german;
	private String english;
	private String abbrev;
	
	KeywordModel(int id, String german, String english, String abbrev) {
		super(id);
		this.german = german;
		this.english = english;
		this.abbrev = abbrev;
	}

	public String getGerman() {
		return german;
	}

	public void setGerman(String german) {
		this.german = german;
	}

	public String getEnglish() {
		return english;
	}

	public void setEnglish(String english) {
		this.english = english;
	}

	public String getAbbrev() {
		return abbrev;
	}

	public void setAbbrev(String abbrev) {
		this.abbrev = abbrev;
	}

}
