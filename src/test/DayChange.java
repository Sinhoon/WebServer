package test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class DayChange {
	public static String change(String input) {
		String output = new String();
		input = input.replaceAll("[, ]", "");
		HashMap<String, String> monthChange = new HashMap<String, String>();
		monthChange.put("Dec", "12");
		monthChange.put("Nov", "11");
		monthChange.put("Oct", "10");
		monthChange.put("Sep", "09");
		monthChange.put("Aug", "08");
		monthChange.put("Jul", "07");
		monthChange.put("Jun", "06");
		monthChange.put("May", "05");
		monthChange.put("Apr", "04");
		monthChange.put("Mar", "03");
		monthChange.put("Feb", "02");
		monthChange.put("Jan", "01");

		output = input.substring(5) + "/" + monthChange.get(input.substring(0, 3)) + "/"
				+ Integer.parseInt(input.substring(3, 5));

		return output;
	}

}
