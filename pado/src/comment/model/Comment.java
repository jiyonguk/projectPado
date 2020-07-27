package comment.model;

import java.util.Date;

public class Comment {
   private int cidx;
   private String mid;
   private int bidx;
   private String cmessage;
   private Date regdate;
   
   public Comment() {
   }

   public Comment(int cidx, String mid, int bidx, String cmessage, Date regdate) {
	this.cidx = cidx;
	this.mid = mid;
	this.bidx = bidx;
	this.cmessage = cmessage;
	this.regdate = regdate;
}

public int getCidx() {
	return cidx;
}

public void setCidx(int cidx) {
	this.cidx = cidx;
}

public String getMid() {
	return mid;
}

public void setMid(String mid) {
	this.mid = mid;
}

public int getBidx() {
	return bidx;
}

public void setBidx(int bidx) {
	this.bidx = bidx;
}

public String getCmessage() {
	return cmessage;
}

public void setCmessage(String cmessage) {
	this.cmessage = cmessage;
}

public Date getRegdate() {
	return regdate;
}

public void setRegdate(Date regdate) {
	this.regdate = regdate;
}

@Override
public String toString() {
	return "Comment [cidx=" + cidx + ", mid=" + mid + ", bidx=" + bidx + ", cmessage=" + cmessage + ", regdate="
			+ regdate + "]";
}
   
   

   
}