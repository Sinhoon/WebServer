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
		monthChange.put("Sep", "9");
		monthChange.put("Aug", "8");
		monthChange.put("Jul", "7");
		monthChange.put("Jun", "6");
		monthChange.put("May", "5");
		monthChange.put("Apr", "4");
		monthChange.put("Mar", "3");
		monthChange.put("Feb", "2");
		monthChange.put("Jan", "1");

		output = input.substring(5) + "/" + monthChange.get(input.substring(0, 3)) + "/"
				+ Integer.parseInt(input.substring(3, 5));

		return output;
	}

}
