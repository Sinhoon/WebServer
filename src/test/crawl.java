package test;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;



public class crawl {
	   public static void main(String[] args) {
			SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
			String time ;
	        try {            
	            Document doc = Jsoup.connect("https://www.bithumb.com/").get();        
	            Elements items = doc.select(".coin_list tr");

	            for (int i = 0; i < 5; i++) {
					Element coinElement = items.get(i);
					System.out.println(coinElement.child(0).select("td p a strong").text().replaceAll("[a-zA-Z!]", ""));
					System.out.println(coinElement.child(1).text().replaceAll("[¿ø,]", ""));
					time = format.format(new Date());
					System.out.println(time);
				}           
	        } catch (Exception e) {e.printStackTrace();}
	    }

}
