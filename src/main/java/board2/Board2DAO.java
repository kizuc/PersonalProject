package board2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.MemberDTO;

public class Board2DAO {
	
	//디비 연결에 필요한 변수 선언
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	
	// 디비연결 메서드
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
	// 디비 자원해제 메서드
	public void closeDB(){
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null)con.close();
		} catch (SQLException e) {
		e.printStackTrace();
		}
		
	}
	
	// 리턴할형 List   getboard2List() 메서드 정의
	public List getboard2List(int startRow, int pageSize) {
		// 여러명을 저장할 변수 => 자바API 배열 변수
		
		List board2List=new ArrayList();
		try {
			//1, 2 디비연결 메서드 호출
			con=getConnection();
			String sql="select * from board2 order by num desc limit ?,?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board2DTO board2DTO=new Board2DTO();
				board2DTO.setNum(rs.getInt("num"));
				board2DTO.setName(rs.getString("name"));
				board2DTO.setPass(rs.getString("pass"));
				board2DTO.setSubject(rs.getString("subject"));
				board2DTO.setContent(rs.getString("content"));
				board2DTO.setFilename1(rs.getString("filename1"));
				board2DTO.setFilename2(rs.getString("filename2"));
				board2DTO.setReadcount(rs.getInt("readcount"));
				board2DTO.setDate(rs.getTimestamp("date"));
				//배열한칸에 글 정보 저장
				board2List.add(board2DTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return board2List;		
	}
	
//	게시판 보이게
	public Board2DTO getboard2(int num) {
		
		Board2DTO board2DTO=null;
		try {
			//1, 2 디비연결
			con=getConnection();
			//3 sql
			String sql="select * from board2 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4 실행결과 저장
			rs=pstmt.executeQuery();
			//5 다음행 => 열접근=> board2DTO객체생성 set값을 저장
			if(rs.next()) {
				board2DTO=new Board2DTO();
				board2DTO.setNum(rs.getInt("num"));
				board2DTO.setName(rs.getString("name"));
				board2DTO.setPass(rs.getString("pass"));
				board2DTO.setSubject(rs.getString("subject"));
				board2DTO.setContent(rs.getString("content"));
				board2DTO.setFilename1(rs.getString("filename1"));
				board2DTO.setFilename2(rs.getString("filename2"));
				board2DTO.setReadcount(rs.getInt("readcount"));
				board2DTO.setDate(rs.getTimestamp("date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return board2DTO;
	}
	
// 게시판 생성
	public void insertboard2(Board2DTO board2DTO) {
		
		try {
			con=getConnection();
			String sql="select max(num)from board2";
			pstmt=con.prepareStatement(sql);
			//실행결과 저장
			rs=pstmt.executeQuery();
			
			int num=0;
			
			if(rs.next()){
				num=rs.getInt("max(num)")+1;
			}
			sql="insert into board2(num,name,pass,subject,content,filename1,filename2,readcount,date) values(?,?,?,?,?,?,?,?,now())";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board2DTO.getName());
			pstmt.setString(3, board2DTO.getPass());
			pstmt.setString(4, board2DTO.getSubject());
			pstmt.setString(5, board2DTO.getContent());
			pstmt.setString(6, board2DTO.getFilename1());
			pstmt.setString(7, board2DTO.getFilename2());
			pstmt.setInt(8, board2DTO.getReadcount());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	public void updateboard2(Board2DTO board2DTO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="update board2 set subject=?, content=?, filname1=?, filname2=?, where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, board2DTO.getSubject());
			pstmt.setString(2, board2DTO.getContent());
			pstmt.setString(3, board2DTO.getFilename1());
			pstmt.setString(4, board2DTO.getFilename2());
			pstmt.setInt(5, board2DTO.getNum());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}	
		}
	}
	
	public void deleteboard2(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="delete from board2 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}	
		}
	}
	
	public int getboard2Count() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			//1,2 
			con=getConnection();
			//3sql
			String sql="select count(*) from board2";
			pstmt=con.prepareStatement(sql);
			//4실행결과 저장
			rs=pstmt.executeQuery();
			//5 다음행으로 이동 데이터 있으면 열 접근
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
	
// 파일 업로드	

}//클래스
