package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDAO {

	// 디비연결 메서드
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
	// 댓글 입력
	public int insertComment(CommentDTO commentDTO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1, 2 ��񿬰�
			con=getConnection();
			
			String sql="select max(comment_id) from comment where board_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, commentDTO.getBoard_id());
			rs=pstmt.executeQuery();
			
			int num=0;
			if(rs.next()) {
				num=rs.getInt("max(comment_id)")+1;
			}
		
			sql = "insert into comment(board_id,comment_id,comment_date,comment_text)";
			sql += "values(?,?,?,?,now(),?,?)";
		
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, commentDTO.getBoard_id());
			pstmt.setInt(2, num);
//			pstmt.setString(3, commentDTO.getContent());
//			pstmt.setString(4, commentDTO.getComment_date());
//			return getNext();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
}
