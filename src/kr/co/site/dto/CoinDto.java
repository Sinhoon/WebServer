package kr.co.site.dto;

public class CoinDto {
	private String name;
	private double price;
	private String time;
	public CoinDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CoinDto(String name, double price, String time) {
		super();
		this.name = name;
		this.price = price;
		this.time = time;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}

}
