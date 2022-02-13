package Buyer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BuyerDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BuyerDAO() {
		
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
	
	public ArrayList<BuyerBean> getList(String buyerId) {
		String SQL = "select * from abc_project.buyer where buyerId = ? order by ordernum desc";
		ArrayList<BuyerBean> list = new ArrayList<BuyerBean>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, buyerId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BuyerBean bb = new BuyerBean();
				bb.setBuyerId(rs.getString(1));
				bb.setOrderNum(rs.getInt(2));
				bb.setProduct(rs.getString(3));
				bb.setPrice(rs.getInt(4));
				bb.setOrderVol(rs.getInt(5));
				bb.setSellerName(rs.getString(6));
				bb.setSellerAddr(rs.getString(7));
				bb.setSellerTel(rs.getString(8));
				bb.setPickDate(rs.getString(9));
				list.add(bb);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
