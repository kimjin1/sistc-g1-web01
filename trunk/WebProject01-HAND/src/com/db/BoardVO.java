package com.db;
import java.util.*;
public class BoardVO {
	
	 	private int no;
	    private String name;
	    private String email;
	    private String homepage;
	    private String subject;
	   
	    private String content;
	    private String id;
	    private Date regdate;
	  
	    private int readnum;
	    private int groupid;
	    private int groupstep;
	    private int grouplevel;
	    private int rootno;
	    private int depth;
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
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getHomepage() {
			return homepage;
		}
		public void setHomepage(String homepage) {
			this.homepage = homepage;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		public int getReadnum() {
			return readnum;
		}
		public void setReadnum(int readnum) {
			this.readnum = readnum;
		}
		public int getGroupid() {
			return groupid;
		}
		public void setGroupid(int groupid) {
			this.groupid = groupid;
		}
		public int getGroupstep() {
			return groupstep;
		}
		public void setGroupstep(int groupstep) {
			this.groupstep = groupstep;
		}
		public int getGrouplevel() {
			return grouplevel;
		}
		public void setGrouplevel(int grouplevel) {
			this.grouplevel = grouplevel;
		}
		public int getRootno() {
			return rootno;
		}
		public void setRootno(int rootno) {
			this.rootno = rootno;
		}
		public int getDepth() {
			return depth;
		}
		public void setDepth(int depth) {
			this.depth = depth;
		}
	    
	    
}
