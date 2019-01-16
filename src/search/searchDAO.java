package search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import search.searchbean;
import search.searchDAO;
import Maintenance.Maintenancebean;
import company.*;
import search.searchbean;

public class searchDAO {

	private static searchDAO instance;

	public static searchDAO getInstance() {
		if (instance == null)
			instance = new searchDAO();
		return instance;
	}

	private Connection conn;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private searchDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/leegy");
			conn = ds.getConnection();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	

	public List<Maintenancebean> search_select_ma(searchbean searchbean) {
		String sql = "";
		String sqlend = "ORDER BY l.customer,l.go_date ASC";
		int data = 0;
		List<Maintenancebean> MaintenanceList = new ArrayList<Maintenancebean>();
		
		try {
				
				sql = "select c.sort,c.title,l.customer,l.type,l.op,l.content,l.other,l.go_date  from category_tbl AS c JOIN customer_list_tbl  AS l ON c.seq = l.fk_ca_seq WHERE ";
				switch(searchbean.getTitle()) {
				case "go_date":  sql += "l.go_date LIKE  ? "+sqlend; break; 
				case "sort":     sql += "c.sort LIKE     ? "+sqlend; break;
				case "type":     sql += "l.type LIKE     ? "+sqlend; break;
				case "title":    sql += "c.title LIKE    ? "+sqlend; break;
				case "content":  sql += "l.content LIKE  ? "+sqlend; break;
				case "op":       sql += "l.op LIKE       ? "+sqlend; break;
				case "customer": sql += "l.customer LIKE ? "+sqlend; break;
				}
				System.out.println(sql);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,"%"+ searchbean.getSearch_data()+"%");
				rs = pstmt.executeQuery();
				while (rs.next()) {
					
					Maintenancebean maintenancebean = new Maintenancebean();
					maintenancebean.setSort(rs.getString(1));
					maintenancebean.setCa_title(rs.getString(2));
					maintenancebean.setCom_name(rs.getString(3));
					maintenancebean.setType(rs.getString(4));
					maintenancebean.setOp(rs.getString(5));
					maintenancebean.setContent(rs.getString(6));
					maintenancebean.setOther(rs.getString(7));
					maintenancebean.setGo_date(rs.getString(8));
					MaintenanceList.add(maintenancebean);


				}	
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();

				}
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		return MaintenanceList;
		}
	
	public List<companybean> search_select_cu(searchbean searchbean) {
		String sql = "";
		String sqlend = "ORDER BY name ASC";
		int data = 0;
		List<companybean> companyList = new ArrayList<companybean>();
		
		try {
				
				sql = "select name,manager,phone,email,address from customer_tbl WHERE ";
				switch(searchbean.getTitle()) {
				case "name":  sql += "name LIKE  ? "+sqlend; break; 
				case "manager":     sql += "manager =     LIKE "+sqlend; break;
				case "phone":     sql += "phone =     LIKE "+sqlend; break;
				case "email":    sql += "email =    LIKE "+sqlend; break;
				case "address":  sql += "address =  LIKE "+sqlend; break;
				
				}
				System.out.println(sql);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,"%"+ searchbean.getSearch_data() +"%");
				rs = pstmt.executeQuery();
				while (rs.next()) {                     
					
					companybean companybean= new companybean();
					companybean.setName(rs.getString(1));
					companybean.setManager(rs.getString(2));
					companybean.setPhone(rs.getString(3));
					companybean.setEmail(rs.getString(4));
					companybean.setAddress(rs.getString(5));
					companyList.add(companybean);


				}	
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();

				}
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		return companyList;
		}
	
	


}
