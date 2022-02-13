package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	UserBean ub = null;
	
	public UserDAO() {
		
		 try { 
			 String dbURL="jdbc:mysql://localhost:3306/abc_project?serverTimezone=UTC&useSSL=false"; 
			 String dbID="root"; 
			 String dbPassword="root";
		     Class.forName("com.mysql.cj.jdbc.Driver"); 
		     conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		 
		    }catch(Exception e) { 
		    	e.printStackTrace(); 
		    	}	 
	}

	
	public UserBean login(String id, String pw) {
		String SQL="select * from abc_project.user where id=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			ub = new UserBean();
			
			if(rs.next()) {
				if(rs.getString(2).equals(pw)) {
					ub.setId(rs.getString(1));
					ub.setPw(rs.getString(2));
					ub.setLevel(rs.getString(8));
					return ub; // 로그인 성공
					
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null)
					conn.close();
				if(pstmt != null)
					pstmt.close();
				if(rs != null)
					rs.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return ub;
    }
	


	 public int join(UserBean user) { 		 
		 
     String SQL ="insert into abc_project.user values(?, ?, ?, ?, ? ,?, ?, ?)"; 
	 try { 
     pstmt = conn.prepareStatement(SQL); 
	 pstmt.setString(1, user.getId());
	 pstmt.setString(2, user.getPw());
	 pstmt.setString(3, user.getName());
	 pstmt.setString(4, user.getbDate()); 
	 pstmt.setString(5, user.getEmail());
	 pstmt.setString(6, user.getTel()); 
	 pstmt.setString(7, user.getDrink());
	 pstmt.setString(8, user.getLevel());
	 return pstmt.executeUpdate();
	 }catch(Exception e) { 
		 e.printStackTrace(); 
		 } 
	 return -1; // 데이터베이스 오류 }

}
}
