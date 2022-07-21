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
import javax.xml.stream.events.Comment;

public class CommentDAO {

	// 디비연결 메서드
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
	public List getCommentList(int startRow,int pageSize, int num){
		List commentList=new ArrayList();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from comment where board_id=? order by comment_id limit ?,?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CommentDTO commentDTO=new CommentDTO();
				commentDTO.setUserID(rs.getString("userID"));
				commentDTO.setCommentID(rs.getInt("commentID"));
				commentDTO.setContent(rs.getString("content"));
				commentDTO.setNum(rs.getInt("num"));
				commentDTO.setCommetDate(rs.getTimestamp("commentDate"));
				
				commentList.add(commentDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
		return commentList;
	}
	
	public int getNext() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select commentID FROM comment ORDER BY commentID DESC";
		try {
		
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getInt(1)); // select문에서 첫번째 값
				return rs.getInt(1)+1;  // 현재 인덱스(현재 게시글 개수) +1 반환
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
		return -1;
		
	}
	public int insertComment(CommentDTO commentDTO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			String sql="select max(commentID) from comment where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, commentDTO.getCommentID());
			rs=pstmt.executeQuery();
			
			int num=0;
			if(rs.next()) {
				num=rs.getInt("max(commentID)")+1;
			}
			
			sql="insert into comment values(?,?,?,?,now())";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, commentDTO.getUserID());
			pstmt.setInt(2, commentDTO.getCommentID());
			pstmt.setString(3, commentDTO.getContent());
			pstmt.setInt(4, num);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
		return -1;
	}
	
}
