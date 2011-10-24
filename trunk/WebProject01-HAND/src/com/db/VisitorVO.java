package com.db;
import java.util.*;

public class VisitorVO {
	
	private int no;
	private String name;
	private String homepage;
	private String content;
	private Date regdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
	//insert into p_visitor values(p_visitor_no_seq.nextval,'김준기','www.sfsfswfq.com','형들 보고싶어요',sysdate);

}
