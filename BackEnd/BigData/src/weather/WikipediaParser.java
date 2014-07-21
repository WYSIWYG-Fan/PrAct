package weather;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Vector;

import javax.swing.JOptionPane;
import javax.swing.text.MutableAttributeSet;
import javax.swing.text.html.HTML;
import javax.swing.text.html.HTMLEditorKit;
import javax.swing.text.html.parser.ParserDelegator;

public class WikipediaParser {

	/**
	 * @param args
	 */
	//Beispiel --> Buntspecht
	
	static Vector<String> nochOffen = new Vector<String>();
	static Vector<String> erledigt = new Vector<String>(); //gleiche URLs nicht doppelt aufnehmen
	static boolean finished = false;
	static URL nextUrl = null; //gefundene URLs von Starturl usw.

	
	public static void main(String[] args) {
		URL url;
		URLConnection urlConnection = null;
		try {
			String eingabe = JOptionPane.showInputDialog("Geben Sie bitte den wikipedia-Link ein, bei dem gestartet werden soll");
			final String ergebnis = JOptionPane.showInputDialog("Geben Sie bitte den wikipedia-Link ein, der gesucht werden soll");
			url = new URL(eingabe);
		
			nochOffen.add(url.toString());
			
			System.out.println("hi");
			
			while (finished == false) {
	
				if (nextUrl == null){
					urlConnection = url.openConnection(); //erster Durchlauf
					System.out.println("erste URL");
				}
				else{
					String[] link = new String[50]; 
					link = nochOffen.get(0).split(";");
					URL naechste = new URL(link[0]);
					urlConnection = (naechste).openConnection();
					//System.out.println("1");
				}
				
				
				BufferedReader in = new BufferedReader(new InputStreamReader(urlConnection.getInputStream())); //lade komplette Seite
				
				HTMLEditorKit.ParserCallback callback = new HTMLEditorKit.ParserCallback() {
					
					public void handleStartTag(HTML.Tag t, MutableAttributeSet a, int pos) {
						if( t == HTML.Tag.A) { //filtere Links aus Seite
							
							try {								
								//System.out.println("3. " + t + "; " + a );
								nextUrl = new URL("http://de.wikipedia.org" + a.getAttribute(HTML.Attribute.HREF));
								
								//Link von wikipedia?
								if (nextUrl.toString().contains("http://de.wikipedia.org/wiki/")) {
								
									//Ziel erreicht?
									if (nextUrl.toString().contains(ergebnis)) { //("http://de.wikipedia.org/wiki/Schule")) {
										finished = true;
										System.out.println(nextUrl + ";" + nochOffen.get(0));
										System.out.println("gefunden");
										System.exit(1);									
									}
									
									//System.out.println(nextUrl);								
																		
									//wurde Link schon mal besucht bzw. gerade in to-do Liste aufgenommen?									
									boolean gefunden = false;
									if (erledigt.size() > 0) {
										for (int i = 0; i < erledigt.size(); i++){									
											if (nextUrl.toString().equals(erledigt.get(i))){
												gefunden = true;
												break;
											}
										}
										for (int j = 0; j < nochOffen.size(); j++) {
											if (nextUrl.toString().equals(nochOffen.get(j))){
												gefunden = true;
												break;
											}
										}
										if (gefunden == false) {
											System.out.println("4. " + nextUrl);
											nochOffen.add(nextUrl.toString() + ";" + nochOffen.get(0));												
										}
										gefunden = false;
									}		
									else {
										System.out.println("1. " + nextUrl);
										nochOffen.add(nextUrl.toString() + ";" + nochOffen.get(0));
									}
																
								} //if --> wikipedia Link							
								
							} catch (MalformedURLException e) {
								// TODO Auto-generated catch block
								//e.printStackTrace();
								System.out.println("Fehlerhafte URL");
							}
						} //if --> A
							
					}
				}; //PerserCallback
				//System.out.println("2");
				new ParserDelegator().parse(in, callback, false);
				//System.out.println("5 --> nächster Durchlauf startet gleich");
//				String inputLine;
//				
//				while ((inputLine = in.readLine()) != null)
//					
//					callback = inputLine;
	//				//System.out.println(inputLine);
				
				in.close();
				
				String[] fertig = new String[50]; 
				fertig = nochOffen.get(0).split(";");				
				
				erledigt.add(fertig[0]);
				nochOffen.remove(0);
				 	
				
			} //while
		
			System.out.println("gefunden");
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("Fehlerhafte URL");
		} catch (FileNotFoundException e) {
			System.out.println("URL nicht von wikipedia:" + nextUrl);		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
