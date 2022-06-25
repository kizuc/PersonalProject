package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	// DB 연결 메서드
	public Connection getConnection() throws Exception{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		String dbUrl="jdbc:mysql://localhost:3306/projectdb1?serverTimezone=UTC";
		String dbId="root";
		String dbPass="1234";
		Connection con=DriverManager.getConnection(dbUrl,dbId,dbPass);
		return con;
	}
	
	// 유저 체크 메서드
	public MemberDTO userCheck(String id, String pass) {
		MemberDTO memberDTO=null;
		try {
			// DB 연결
			Connection con=getConnection();
			
			String sql="select * from member where id=? and pass=?";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()){
				// 데이터 있으면 true => 아이디 비밀번호 일치
				// MemberDTO memberDTO 객체생성
				memberDTO=new MemberDTO();
				// set메서드 호출 id, pass, name, date 디비열 저장
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPass(rs.getString("pass"));
				memberDTO.setName(rs.getString("name"));
			} else {
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return memberDTO;
	}
	
	
	
}

