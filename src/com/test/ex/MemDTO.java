package com.test.ex;

import java.sql.Timestamp;

public class MemDTO {
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private String addr;
	private Timestamp rDate;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Timestamp getrDate() {
		return rDate;
	}
	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}
	
//	public MemDTO(String id, String pw, String name, String email, String addr, Timestamp rDate) {
//		this.id = id;
//		this.pw= pw;
//		this.name= name;
//		this.email = email;
//		this.addr = addr;
//		this.rDate = rDate;
//				
//	}
	
	

	
	
}