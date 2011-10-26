package com.db;
import java.util.*;

public class PhotoVO {
	private int picture_seq;
	private String name;
	private String content;
	private String path;
	private int plag;
	public int getPicture_seq() {
		return picture_seq;
	}
	public void setPicture_seq(int picture_seq) {
		this.picture_seq = picture_seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getPlag() {
		return plag;
	}
	public void setPlag(int plag) {
		this.plag = plag;
	}
	
	
}
