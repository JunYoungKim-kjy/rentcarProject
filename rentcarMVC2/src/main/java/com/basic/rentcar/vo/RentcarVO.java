package com.basic.rentcar.vo;

public class RentcarVO {

	private int no;
	private String name;
	private int category;
	private int price;
	private int usepeople;
	private int totalQty;
	private String company;
	private String img;
	private String info;
	private String sFileName;
	private String oFileName;
	public RentcarVO() {}
	public RentcarVO(int no, String name, int category, int price, int usepeople, int totalQty, String company,
			String img, String info) {
		super();
		this.no = no;
		this.name = name;
		this.category = category;
		this.price = price;
		this.usepeople = usepeople;
		this.totalQty = totalQty;
		this.company = company;
		this.img = img;
		this.info = info;
	}
	public RentcarVO(String name, int category, int price, int usepeople, int totalQty, String company,
			String img, String info, String sFileName, String oFileName) {
		super();
		this.name = name;
		this.category = category;
		this.price = price;
		this.usepeople = usepeople;
		this.totalQty = totalQty;
		this.company = company;
		this.img = img;
		this.info = info;
		this.sFileName = sFileName;
		this.oFileName = oFileName;
	}
	public String getsFileName() {
		return sFileName;
	}

	public void setsFileName(String sFileName) {
		this.sFileName = sFileName;
	}

	public String getoFileName() {
		return oFileName;
	}

	public void setoFileName(String oFileName) {
		this.oFileName = oFileName;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setUsepeople(int usepeople) {
		this.usepeople = usepeople;
	}
	public void setTotalQty(int totalQty) {
		this.totalQty = totalQty;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getName() {
		return name;
	}
	public int getCategory() {
		return category;
	}
	public int getPrice() {
		return price;
	}
	public int getUsepeople() {
		return usepeople;
	}
	public int getTotalQty() {
		return totalQty;
	}
	public String getCompany() {
		return company;
	}
	public String getImg() {
		return img;
	}
	public String getInfo() {
		return info;
	}
	@Override
	public String toString() {
		return "RentcarVO [no=" + no + ", name=" + name + ", category=" + category + ", price=" + price + ", usepeople="
				+ usepeople + ", totalQty=" + totalQty + ", company=" + company + ", img=" + img + ", info=" + info
				+ "]";
	}
	
}
