package com.db;
import java.util.*;
public class ReplyVO {
	private int no;
	private String id;
	private int rootno;
	private String content;
	private Date regdate;
	private int flag;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRootno() {
		return rootno;
	}
	public void setRootno(int rootno) {
		this.rootno = rootno;
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
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return no+"|"+id+"|"+rootno+"|"+content+"|"+regdate+"|"+flag;
	}
	
	
}
