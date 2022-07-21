package oboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board2.Board2DTO;

public class OboardDAO {
	
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
	
	// 새 글 등록
		public void insertOboard(OboardDTO OboardDTO) {
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
				sql="insert into orderboard(num,id,nickname,odate,oaddress,food,people,nof,ooption,etc,date) values(?,?,?,?,?,?,?,?,?,?,now())";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, OboardDTO.getId());
				pstmt.setString(3, OboardDTO.getNickname());
				pstmt.setString(4, OboardDTO.getFdate());
				pstmt.setString(5, OboardDTO.getFaddress());
				pstmt.setString(6, OboardDTO.getWfood());
				pstmt.setString(7, OboardDTO.getPeople());
				pstmt.setString(8, OboardDTO.getNof());
				pstmt.setString(9, OboardDTO.getOoption());
				pstmt.setString(10, OboardDTO.getEtc());
	
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs!=null)try { rs.close(); }catch(SQLException ex){}
				if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
				if(con!=null)try { con.close(); }catch(SQLException ex){}	
			}
		}
		
		// getorderboardList() 메서드 정의
		public List getOboardList(int startRow, int pageSize) {
			// 여러명을 저장할 변수 => 자바API 배열 변수
			
			List oboardList=new ArrayList();
			try {
				//1, 2 디비연결 메서드 호출
				con=getConnection();
				String sql="select * from orderboard order by num desc limit ?,?";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				
				rs=pstmt.executeQuery();
				while(rs.next()) {
					OboardDTO oboardDTO=new OboardDTO();
					oboardDTO.setNum(rs.getInt("num"));
					oboardDTO.setId(rs.getString("id"));
					oboardDTO.setNickname(rs.getString("nickname"));
					oboardDTO.setFdate(rs.getString("odate"));
					oboardDTO.setFaddress(rs.getString("oaddress"));
					oboardDTO.setWfood(rs.getString("food"));
					oboardDTO.setPeople(rs.getString("people"));
					oboardDTO.setNof(rs.getString("nof"));
					oboardDTO.setOoption(rs.getString("ooption"));
					oboardDTO.setEtc(rs.getString("etc"));
					oboardDTO.setDate(rs.getTimestamp("date"));
					// 배열 한칸에 글 정보 저장
					oboardList.add(oboardDTO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null)try { rs.close(); }catch(SQLException ex){}
				if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
				if(con!=null)try { con.close(); }catch(SQLException ex){}
			}
			return oboardList;		
		}
		
		//	게시판 보이게
		public OboardDTO getOboard(int num) {
			
			OboardDTO oboardDTO=null;
			try {
				//1, 2 디비연결
				con=getConnection();
				//3 sql
				String sql="select * from orderboard where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				//4 실행결과 저장
				rs=pstmt.executeQuery();
				//5 다음행 => 열접근=> oboardDTO객체생성 set값을 저장
				if(rs.next()) {
					oboardDTO=new OboardDTO();
					oboardDTO.setNum(rs.getInt("num"));
					oboardDTO.setId(rs.getString("id"));
					oboardDTO.setNickname(rs.getString("nickname"));
					oboardDTO.setFdate(rs.getString("fdate"));
					oboardDTO.setFaddress(rs.getString("faddress"));
					oboardDTO.setWfood(rs.getString("wfood"));
					oboardDTO.setPeople(rs.getString("people"));
					oboardDTO.setNof(rs.getString("nof"));
					oboardDTO.setOoption(rs.getString("ooption"));
					oboardDTO.setEtc(rs.getString("etc"));
					oboardDTO.setDate(rs.getTimestamp("date"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs!=null)try { rs.close(); }catch(SQLException ex){}
				if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
				if(con!=null)try { con.close(); }catch(SQLException ex){}
			}
			return oboardDTO;
		}
		
		public void updateOboard(OboardDTO oboardDTO) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=getConnection();
				String sql="update orderboard set nickname=?, fdate=?, faddress=?, wfood=?, people=?, nof=?, ooption=?, etc=? where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, oboardDTO.getNickname());
				pstmt.setString(2, oboardDTO.getFdate());
				pstmt.setString(3, oboardDTO.getFaddress());
				pstmt.setString(4, oboardDTO.getWfood());
				pstmt.setString(5, oboardDTO.getPeople());
				pstmt.setString(6, oboardDTO.getNof());
				pstmt.setString(7, oboardDTO.getOoption());
				pstmt.setString(8, oboardDTO.getEtc());
				
				pstmt.setInt(9, oboardDTO.getNum());
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs!=null)try { rs.close(); }catch(SQLException ex){}
				if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
				if(con!=null)try { con.close(); }catch(SQLException ex){}
			}
		}
		
		public void deleteOboard(int num) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=getConnection();
				String sql="delete from orderboard where num=?";
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
		
		public int getOboardCount() {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				con=getConnection();
				String sql="select count(*) from orderboard";
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
		
		// 검색 기능
		public List getOboardList1(String search, int startRow,int pageSize) {
			// 여러명을 저장할 변수 => 자바API 배열 변수
			List oboardList=new ArrayList();
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try {
				//1, 2 디비연결 메서드 호출
				con=getConnection();
				String sql = "select * from orderboard where oaddress like ? or food like ? order by num desc limit ?,?";
				
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setString(2, "%"+search+"%");
				pstmt.setInt(3, startRow-1);
				pstmt.setInt(4, pageSize);
				// 4단계 sql구문을 실행=> 실행 결과 저장(select) 
				rs=pstmt.executeQuery();
				// 5단계 결과를 가지고 출력하거나 배열변수 저장(select)
				// 데이터 있으면 true => 열접근
				while(rs.next()) {
					OboardDTO oboardDTO=new OboardDTO();
					oboardDTO.setNum(rs.getInt("num"));
					oboardDTO.setId(rs.getString("id"));
					oboardDTO.setNickname(rs.getString("nickname"));
					oboardDTO.setFdate(rs.getString("odate"));
					oboardDTO.setFaddress(rs.getString("oaddress"));
					oboardDTO.setWfood(rs.getString("food"));
					oboardDTO.setPeople(rs.getString("people"));
					oboardDTO.setNof(rs.getString("nof"));
					oboardDTO.setOoption(rs.getString("ooption"));
					oboardDTO.setEtc(rs.getString("etc"));
					oboardDTO.setDate(rs.getTimestamp("date"));
					
					//배열한칸에 글 정보 저장
					oboardList.add(oboardDTO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null)try { rs.close(); }catch(SQLException ex){}
				if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
				if(con!=null)try { con.close(); }catch(SQLException ex){}
			}
			System.out.println(oboardList.size());// 검색해온 글 전체 갯수
			return oboardList;
			
		}
		
}
