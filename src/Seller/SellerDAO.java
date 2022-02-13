package Seller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SellerDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public SellerDAO() {
		
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
	
	public ArrayList<SellerBean> getList(String sellerId) {
		String SQL = "select * from abc_project.seller where sellerId = ? order by ordernum desc";
		ArrayList<SellerBean> list = new ArrayList<SellerBean>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, sellerId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SellerBean sb = new SellerBean();
				sb.setSellerId(rs.getString(1));
				sb.setOrderNum(rs.getInt(2));
				sb.setProduct(rs.getString(3));
				sb.setPrice(rs.getInt(4));
				sb.setOrderVol(rs.getInt(5));
				sb.setBuyerId(rs.getString(6));
				sb.setBuyerName(rs.getString(7));
				sb.setBuyerTel(rs.getString(8));
				sb.setPickDate(rs.getString(9));
				list.add(sb);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
