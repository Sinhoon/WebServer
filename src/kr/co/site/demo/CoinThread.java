package kr.co.site.demo;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import kr.co.site.dao.CoinDao;
import kr.co.site.dto.CoinDto;

public class CoinThread extends Thread {
	private int delay;
	private ArrayList<CoinDto> list;
	private CoinDao dao;
	private SimpleDateFormat format;
	private String time;
	private String name;
	private double price;

	public CoinThread(int delay) {
		super();
		this.delay = delay;
	}

	@Override
	public void run() {
		format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		list = new ArrayList<CoinDto>();
		dao = dao.getInstance();
		while (true) {
			Document doc;
			try {
				doc = Jsoup.connect("https://www.bithumb.com/").get();
				Elements items = doc.select(".coin_list tr");
				for (int i = 0; i < 5; i++) {
					Element coinElement = items.get(i);
					name = coinElement.child(0).select("td p a strong").text().replaceAll("[a-zA-Z!]", "");
					price = Double.parseDouble(coinElement.child(1).text().replaceAll("[¿ø,]", ""));
					time = format.format(new Date());
					list.add(new CoinDto(name, price, time));
				}
				  for (CoinDto dto : list) { dao.insert(dto); }

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			try {
				Thread.sleep(5000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {	
		CoinThread ct = new CoinThread(5000);
		ct.start();
	}
}
