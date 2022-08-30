package oboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JjimDAO {
	// 디비연결 메서드
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	

	public List getBoardList(String userID, int pageNumber){
		List list = new ArrayList();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql = "SELECT * FROM orderboard WHERE num = (select num"
					+ " from jjim where userID = ?) ORDER BY bbsID DESC LIMIT 10"; 
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OboardDTO oboardDTO = new OboardDTO();
				oboardDTO.setNum(rs.getInt(1));
				oboardDTO.setId(rs.getString(2));
				oboardDTO.setNickname(rs.getString(3));
				oboardDTO.setFdate(rs.getString(4));
				oboardDTO.setFaddress(rs.getString(5));
				oboardDTO.setWfood(rs.getString(6));
				oboardDTO.setNof(rs.getString(7));
				oboardDTO.setOoption(rs.getString(8));
				oboardDTO.setEtc(rs.getString(8));
				oboardDTO.setDate(rs.getTimestamp(8));
				list.add(oboardDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}

	
	public int insertJjim(String userID, int bbsID) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql = "INSERT INTO jjim(bbsID, userID, date) VALUES(?,?,now())";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, bbsID);
			pstmt.setString(2, userID);
			pstmt.executeUpdate();
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public List getJjim(String userID, int bbsID) {
		List list = new ArrayList();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql = "SELECT * FROM jjim WHERE userID = ? AND bbsID = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,  userID);
			pstmt.setInt(2,  bbsID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JjimDTO jjimDTO = new JjimDTO();
				jjimDTO.setBbsID(rs.getInt("userID"));
				jjimDTO.setUserID(rs.getString("bbsID"));
				jjimDTO.setDate(rs.getTimestamp("date"));
				
				list.add(jjimDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int deleteJjim(String userID,int bbsID) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql = "DELETE FROM jjim WHERE bbsID = ? AND userID = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bbsID);
			pstmt.setString(2, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
}
