package com.basic.rentcar.vo;

public class JoinCarViewVO {
	private int reserveSeq;
	private int no; // car no 
	private String id;
	private String name;
	private String userName;
	private int price;
	private String img;
	private int qty;
	private int dday;
	private String rday;
	private int usein;
	private int usewifi;
	private int useseat;
	private int usenavi;
	private String sFileName;
	private String oFileName;
	
	
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
	public int getReserveSeq() {
		return reserveSeq;
	}
	public void setReserveSeq(int reserveSeq) {
		this.reserveSeq = reserveSeq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
	public String getRday() {
		return rday;
	}
	public void setRday(String rday) {
		this.rday = rday;
	}
	public int getUsein() {
		return usein;
	}
	public void setUsein(int usein) {
		this.usein = usein;
	}
	public int getUsewifi() {
		return usewifi;
	}
	public void setUsewifi(int usewifi) {
		this.usewifi = usewifi;
	}
	public int getUseseat() {
		return useseat;
	}
	public void setUseseat(int useseat) {
		this.useseat = useseat;
	}
	public int getUsenavi() {
		return usenavi;
	}
	public void setUsenavi(int usenavi) {
		this.usenavi = usenavi;
	}
	@Override
	public String toString() {
		return "CarViewVO [reserveSeq=" + reserveSeq + ", no=" + no + ", name=" + name + ", price=" + price + ", img="
				+ img + ", qty=" + qty + ", dday=" + dday + ", rday=" + rday + ", usein=" + usein + ", usewifi="
				+ usewifi + ", useseat=" + useseat + ", usenavi=" + usenavi + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
}
