package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDAO {
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
//	public CommentDTO getComment(int boardID) {
//		CommentDTO commentDTO=null;
//		Connection con=null;
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		try {
//			con=getConnection();
//			
//			String sql="select max(commentID) from comment	 where boardID=?";
//			pstmt=con.prepareStatement(sql);
//			pstmt.setInt(1, boardID);
//			rs=pstmt.executeQuery();
//			
//			int num=0;
//			if(rs.next()) {
//				num=rs.getInt("max(num)")+1;
//			}
//			
//			if(rs.next()) {
//				commentDTO=new CommentDTO();
//				commentDTO.setboardID(rs.getInt("boardID"));
//				commentDTO.setcommentID(rs.getInt("commentID"));
//				commentDTO.setContent(rs.getString("content"));
//				commentDTO.setuserID(rs.getString("userID"));
//				commentDTO.setDelete_YN(rs.getString("delete_YN"));
//				commentDTO.setcommentDate(rs.getTimestamp("commentDate"));
//				commentDTO.setDelete_date(rs.getTimestamp("delete_date"));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
//			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
//			if(con!=null)try { con.close(); }catch(SQLException ex){}
//		}
//		return commentDTO;
//	}
	
	public List getCommentList(int startRow,int pageSize, int boardID) {
		List commentList=new ArrayList();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
		    String sql="select * from comment where boardID=? order by commentID limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs=pstmt.executeQuery();

			while(rs.next()) {
				CommentDTO commentDTO=new CommentDTO();
				commentDTO.setBoardID(rs.getInt("boardID"));
				commentDTO.setUserID(rs.getString("userID"));
				commentDTO.setCommentID(rs.getInt("commentID"));
				commentDTO.setContent(rs.getString("content"));
				commentDTO.setCommetDate(rs.getTimestamp("commentDate"));
				
				commentList.add(commentDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
		return commentList;		
	}
	
	public int getCommentCount(int boardID) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			//1,2 
			con=getConnection();
			//3sql
			String sql="select count(*) from comment where boardID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, boardID);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
		return count;
	}
	
	public void insertComment(CommentDTO commentDTO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="select max(commentID) from comment where boardID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, commentDTO.getBoardID());
			rs=pstmt.executeQuery();
			
			int num=0;
			if(rs.next()) {
				num=rs.getInt("max(commentID)")+1;
			}
			
			//3sql
			sql="insert into comment(boardID,userID,commentID,content,commentDate) values(?,?,?,?,now())";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, commentDTO.getBoardID());
			pstmt.setString(2, commentDTO.getUserID());
			pstmt.setInt(3, num);
			pstmt.setString(4, commentDTO.getContent());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
	}
}
