package gboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GboardDAO {

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
	
	// getgboardList() 메서드 정의
	public List getgboardList(int startRow, int pageSize) {
		// 여러명을 저장할 변수 => 자바API 배열 변수
		
		List gboardList=new ArrayList();
		try {
			//1, 2 디비연결 메서드 호출
			con=getConnection();
			String sql="select * from gboard order by num desc limit ?,?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				GboardDTO gboardDTO=new GboardDTO();
				gboardDTO.setNum(rs.getInt("num"));
				gboardDTO.setPass(rs.getString("pass"));
				gboardDTO.setSubject(rs.getString("subject"));
				gboardDTO.setContent(rs.getString("content"));
				gboardDTO.setReadcount(rs.getInt("readcount"));
				gboardDTO.setDate(rs.getTimestamp("date"));
				gboardDTO.setFile(rs.getString("file"));
				// 배열 한칸에 글 정보 저장
				gboardList.add(gboardDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
		return gboardList;		
	}
	
	//	게시판 보이게
	public GboardDTO getgboard(int num) {
		
		GboardDTO gboardDTO=null;
		try {
			//1, 2 디비연결
			con=getConnection();
			//3 sql
			String sql="select * from gboard where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4 실행결과 저장
			rs=pstmt.executeQuery();
			//5 다음행 => 열접근=> gboardDTO객체생성 set값을 저장
			if(rs.next()) {
				gboardDTO=new GboardDTO();
				gboardDTO.setNum(rs.getInt("num"));
				gboardDTO.setPass(rs.getString("pass"));
				gboardDTO.setSubject(rs.getString("subject"));
				gboardDTO.setContent(rs.getString("content"));
				gboardDTO.setFile(rs.getString("file"));
				gboardDTO.setReadcount(rs.getInt("readcount"));
				gboardDTO.setDate(rs.getTimestamp("date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
		return gboardDTO;
	}
	
	// 글 등록
	public void insertgboard(GboardDTO gboardDTO) {
		
		try {
			con=getConnection();
			String sql="select max(num)from gboard";
			pstmt=con.prepareStatement(sql);
			//실행결과 저장
			rs=pstmt.executeQuery();
			
			int num=0;
			
			if(rs.next()){
				num=rs.getInt("max(num)")+1;
			}
			sql="insert into gboard(num,pass,subject,content,file,readcount,date) values(?,?,?,?,?,?,now())";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, gboardDTO.getPass());
			pstmt.setString(3, gboardDTO.getSubject());
			pstmt.setString(4, gboardDTO.getContent());
			pstmt.setString(5, gboardDTO.getFile());
			pstmt.setInt(6, gboardDTO.getReadcount());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
	}
	
	public void updategboard(GboardDTO gboardDTO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="update gboard set subject=?, content=?, file=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, gboardDTO.getSubject());
			pstmt.setString(2, gboardDTO.getContent());
			pstmt.setString(3, gboardDTO.getFile());
			pstmt.setInt(4, gboardDTO.getNum());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
	}
	
	public void deletegboard(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="delete from gboard where num=?";
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
	
	public int getgboardCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from gboard";
			pstmt=con.prepareStatement(sql);
			// 실행결과 저장
			rs=pstmt.executeQuery();
			// 다음 행으로 이동해서 데이터 있으면 열 접근
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
	
	// 조회 수 증가
	public void updateReadCount(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="update gboard set readcount=readcount+1 where num=?";
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
}
