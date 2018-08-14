package com.test.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class MemDAO {

	public static final int MEM_NONEXIST = 0;
	public static final int MEM_EXIST = 1;
	public static final int MEM_JOIN_SUCCESS = 1;
	public static final int MEM_JOIN_FAIL = 0;
	public static final int MEM_LOGIN_SUCCESS = 1;
	public static final int MEM_LOGIN_NOT = -1;
	public static final int MEM_LOGIN_PW_NOT = 0;
	
	private static MemDAO memIns = new MemDAO();
	

	private MemDAO() {

	}
	
	
	public static MemDAO getInstance() {
		return memIns;
	}
	
	
	public int insertMember(MemDTO mdto) {
		int n = 0;
		
		Connection dbcon = null;
		PreparedStatement pstmt = null;
		
		try {
			dbcon = getConnection();
			pstmt = dbcon.prepareStatement("insert into member1 values(?,?,?,?,?,?)");
			System.out.println(mdto.getId());
			System.out.println(mdto.getPw());
			System.out.println(mdto.getName());
			System.out.println(mdto.getEmail());
			System.out.println(mdto.getAddr());
			System.out.println(mdto.getrDate());
			
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPw());
			pstmt.setString(3, mdto.getName());
			pstmt.setString(4, mdto.getEmail());
			pstmt.setString(5, mdto.getAddr());
			pstmt.setTimestamp(6, mdto.getrDate());
			
			pstmt.executeUpdate();
			
			n = MemDAO.MEM_JOIN_SUCCESS;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				
				if(pstmt != null) pstmt.close();
				if(dbcon != null) dbcon.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return n;
	}
	
	
	
	public int checkId(String id) {
		System.out.println("id 값 : "+id);
		int n = 0 ;
		
		Connection dbcon = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id from member1 where id=?";
			
		try {
				dbcon = getConnection();
				pstmt = dbcon.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					n = MEM_EXIST;
				}else {
					n = MEM_NONEXIST;
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(dbcon != null) dbcon.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
				
		System.out.println("n 입니다 :"+n);
				return n;
		
	}
	
	
	public int memberCheck(String id, String pw) {
		int n =0;
		String rPw;
		
		System.out.println("로그인시 확인하는 id : "+ id);
		
		Connection dbcon = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select pw from member1 where id = ?";
		
		try {
			
			dbcon = getConnection();
			pstmt = dbcon.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rPw = rs.getString("pw");
				System.out.println("데이터 베이스에서 가져오 rPw : "+rPw);
				if(pw.equals(rPw)) {
					n = MEM_LOGIN_SUCCESS;
				}else {
					n = MEM_LOGIN_PW_NOT;
				}
			}else {
				n = MEM_LOGIN_NOT;
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(dbcon != null) dbcon.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				
			}
		}
		return n;
	}
	
	
	public MemDTO getMember(String id) {
		MemDTO mdto = null;
		
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member1 where id = ?";
		
		try {
			dbconn = getConnection();
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mdto = new MemDTO();
				mdto.setId(rs.getString("id"));
				mdto.setPw(rs.getString("pw"));
				mdto.setName(rs.getString("name"));
				mdto.setEmail(rs.getString("email"));
				mdto.setAddr(rs.getString("addr"));
				mdto.setrDate(rs.getTimestamp("rDate"));
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(rs != null) rs.close();
				if(dbconn != null) dbconn.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("전달 성공");
		return mdto;
	}
	
	
	
	
	public int updateMember(MemDTO mdto) {
		int n =0;
		
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		String sql = "update member1 set name=?, addr=?, email=? where id=?";
		
		try {
			
			dbconn = getConnection();
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, mdto.getName());
			pstmt.setString(2, mdto.getAddr());
			pstmt.setString(3, mdto.getEmail());
			pstmt.setString(4, mdto.getId());
			
			n = pstmt.executeUpdate();
	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				
				if(dbconn != null) dbconn.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				
			}
		}
		return n;
	}
	
	
	
	
	
	
	
	
	
	

	private Connection getConnection() {
		Context ctx = null;
		DataSource ds = null;
		Connection dbcon = null;
		
		try {
			ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			dbcon = ds.getConnection();
			
		}catch(Exception e) {
			System.out.println(4);
			e.printStackTrace();
		}
		
		return dbcon;
	}
	

}
