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
				doc = Jsoup.connect("http://www.jobkorea.co.kr/top100/").get();
				Elements items = doc.select(".rankList li .co .coTit");
				//System.out.println(items);
				for (int i = 0; i < items.size() ; i++) {
					Element coinElement = items.get(i);
					name = coinElement.child(0).select("a").text();
				     System.out.println(name);
					//name = coinElement.child(0).select("td p a strong").text().replaceAll("[a-zA-Z!]", "");
					//price = Double.parseDouble(coinElement.child(1).text().replaceAll("[원,]", ""));
					//time = format.format(new Date());
					//list.add(new CoinDto(name, price, time));
				}
	

				 //for (CoinDto dto : list) { 
				  //	 dao.insert(dto);
					 //System.out.println(dto.getName());
					 //}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			try {
				Thread.sleep(5000*60);
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
