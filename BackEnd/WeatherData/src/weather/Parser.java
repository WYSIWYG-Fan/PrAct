package weather;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.AbstractMap;
import java.util.ArrayList;

public class Parser {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		BufferedReader br;
		
		String fileName = "Stuttgart";
		
		try {
			br = new BufferedReader(new FileReader("C:/Users/D056909/BigData/src/weather/" + fileName + ".txt"));
			String[][] weatherData = new String[365][100];
			String[][] insert = new String[365][100];
			int counter = 0;

			String line = null;
			try {
				while ((line = br.readLine()) != null) {
					weatherData[counter] = line.split(" ");
					counter++;
					//.add(new AbstractMap.SimpleEntry<Integer, String>(i++, line));
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			counter = 0;
			for (int i = 0; i < weatherData.length; i++){
				for (int j = 0; j < weatherData[i].length; j++) {
					if (!(weatherData[i][j].equals("")) && !(weatherData[i][j].equals(" ")) && (weatherData[i][j] != (" "))){
								insert[i][counter] = weatherData[i][j];
								//System.out.println("i = " + i + ", counter = " + counter + ": " + insert[i][counter]);
								counter++;
					}
				}
				counter = 0;
			}
			
			for (int i = 0; i < insert.length; i++){
				System.out.println(fileName + ", " + insert[i][1] + ", " + insert[i][5] + ", " + insert[i][9]
						 + ", " + insert[i][10] + ", " + insert[i][11] + ", " + insert[i][12]);
			}
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}


	}

}
