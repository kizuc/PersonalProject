package oboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardDTO;

public class OboardDAO {
	// 디비연결 메서드
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
	// 새 글 등록
		public void insertBoard(OboardDTO OboardDTO) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try {
				con=getConnection();
				String sql="select max(num)from orderboard";
				pstmt=con.prepareStatement(sql);
				//실행결과 저장
				rs=pstmt.executeQuery();
				
				int num=0;
				if(rs.next()){
					num=rs.getInt("max(num)")+1;
				}
				sql="insert into board(onum,id,onickname,orderdate,oaddress,ofood,onof,opeople,ooption,oetc,odate) values(?,?,?,?,?,?,?,?,?,?,now())";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, OboardDTO.getId());
				pstmt.setString(3, OboardDTO.getNickname());
				pstmt.setString(4, OboardDTO.getFdate());
				pstmt.setString(5, OboardDTO.getFtime());
				pstmt.setString(6, OboardDTO.getFaddress());
				pstmt.setString(7, OboardDTO.getWfood());
				pstmt.setString(8, OboardDTO.getNof());
				pstmt.setString(9, OboardDTO.getPeople());
				pstmt.setString(10, OboardDTO.getOptions());
				pstmt.setString(11, OboardDTO.getEtc());
	
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
