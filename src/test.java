import org.jsoup.nodes.Document;

import java.io.BufferedWriter;
import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class test {
	public static void main(String[] args) {
		

	String name = null;
	Document doc = null;
	Elements items = null;
	try {
		doc = Jsoup.connect("https://coinmarketcap.com/currencies/ethereum/historical-data/?start=20191120&end=20191219").get();
		items = doc.select(".cmc-table__table-wrapper-outer table tbody tr ");
		//System.out.println(items);
		for (int i = 0; i < items.size() ; i++) {
			Element coinElement = items.get(i);
			name = coinElement.child(0).text();	
		}
	
	
	} catch (IOException e) {
	
		e.printStackTrace();
	}

}
}
