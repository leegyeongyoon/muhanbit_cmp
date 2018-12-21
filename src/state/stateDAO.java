package state;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class stateDAO {

		private static stateDAO instance;
		
		
		public static stateDAO getInstance() {
			if(instance == null) instance = new stateDAO();
			return instance;
		}
		
		private Connection conn ; 
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		private stateDAO() {
			try {
				  Context init = new InitialContext();
				    DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/leegy");
				    conn = ds.getConnection();
				
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		public void joincategory(statebean statebean) {
			String sql = "INSERT INTO category_tbl(sort,title) VALUES (?,?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, statebean.getSort());
				pstmt.setString(2, statebean.getTitle());
				pstmt.executeUpdate();

			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				try {
				if(pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
					
				}
				}
				catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
				}
			}
		
		
		public statebean selectOne(String sort,String title) {
			String sql = "SELECT sort,title FROM category_tbl WHERE sort = ? AND title = ?";
			statebean statebean = null;
			try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,sort);
			pstmt.setString(2,title);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				statebean = new statebean();
				statebean.setSort(rs.getString(1));
				statebean.setTitle(rs.getString(2));
				
			}
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				try {
				if(pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
					
				}
				}
				catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
				}
			return statebean;
			
		}
		
		public List<statebean> sort_select(String sort) {
			String sql = "SELECT sort,title FROM category_tbl WHERE sort = ?";
			List<statebean> statelist = new ArrayList<statebean>();
			statebean statebean = null;
			try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,sort);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				statebean = new statebean();
				statebean.setSort(rs.getString(1));
				statebean.setTitle(rs.getString(2));
				statelist.add(statebean);
				
				
			}
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				try {
				if(pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
					
				}
				}
				catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
				}
			
			return statelist;
			
		}
		public void delete_state(statebean statebean) {
			String sql = "DELETE FROM category_tbl where sort = ? AND title = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, statebean.getSort());
				pstmt.setString(2, statebean.getTitle());
				pstmt.executeUpdate();

			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				try {
				if(pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
					
				}
				}
				catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
				}
			}
	
		



		
		
		
}
