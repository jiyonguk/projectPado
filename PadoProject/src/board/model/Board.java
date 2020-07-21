package board.model;

import java.util.Date;

public class Board {
	
	private int bidx;
	private String bid;
	private String bphoto;
	private String bmessage;
	private String baddr;
	private Date regdate;
	
	public Board() {
	}

	public Board(int bidx, String bid, String bphoto, String bmessage, String baddr, Date regdate) {
		super();
		this.bidx = bidx;
		this.bid = bid;
		this.bphoto = bphoto;
		this.bmessage = bmessage;
		this.baddr = baddr;
		this.regdate = regdate;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getBphoto() {
		return bphoto;
	}

	public void setBphoto(String bphoto) {
		this.bphoto = bphoto;
	}

	public String getBmessage() {
		return bmessage;
	}

	public void setBmessage(String bmessage) {
		this.bmessage = bmessage;
	}

	public String getBaddr() {
		return baddr;
	}

	public void setBaddr(String baddr) {
		this.baddr = baddr;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Board [bidx=" + bidx + ", bid=" + bid + ", bphoto=" + bphoto + ", bmessage=" + bmessage + ", baddr="
				+ baddr + ", regdate=" + regdate + "]";
	}
	
	
	
	
}
