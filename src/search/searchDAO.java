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

	public List<Maintenancebean> search_select_ma(searchbean searchbean, String currentPage1) {
		String sql = "";
		String sqlend = "ORDER BY l.customer,l.go_date ASC LIMIT ?,?";
		String totalsqlend = "ORDER BY l.customer,l.go_date ASC ";
		String totalsql = "";
		List<Maintenancebean> MaintenanceList = new ArrayList<Maintenancebean>();

		try {
			int totalCount = 0;
			totalsql = "select count(*) from category_tbl AS c JOIN customer_list_tbl  AS l ON c.seq = l.fk_ca_seq WHERE ";
			sql = "select c.sort,c.title,l.customer,l.type,l.op,l.content,l.other,l.go_date  from category_tbl AS c JOIN customer_list_tbl  AS l ON c.seq = l.fk_ca_seq WHERE ";
			int request = 0, progress = 0, Complet = 0, visit = 0, remote = 0, flowing_line = 0, mail = 0,
					monthly_Inspection = 0, branch_Inspection = 0, remote_Inspection = 0, neww = 0, add = 0;
			switch (searchbean.getTitle()) {
			case "go_date":
				sql += "l.go_date LIKE  ? " + sqlend;
				totalsql += "l.go_date LIKE  ? " + totalsqlend;
				break;
			case "sort":
				sql += "c.sort LIKE     ? " + sqlend;
				totalsql += "c.sort LIKE  ? " + totalsqlend;
				break;
			case "type":
				sql += "l.type LIKE     ? " + sqlend;
				totalsql += "l.type LIKE  ? " + totalsqlend;
				break;
			case "title":
				sql += "c.title LIKE    ? " + sqlend;
				totalsql += "c.title LIKE  ? " + totalsqlend;
				break;
			case "content":
				sql += "l.content LIKE  ? " + sqlend;
				totalsql += "l.content LIKE  ? " + totalsqlend;
				break;
			case "op":
				sql += "l.op LIKE       ? " + sqlend;
				totalsql += "l.io LIKE  ? " + totalsqlend;
				break;
			case "customer":
				sql += "l.customer LIKE ? " + sqlend;
				totalsql += "l.customer LIKE  ? " + totalsqlend;
				break;
			}

			PreparedStatement totalstem = conn.prepareStatement(totalsql);
			totalstem.setString(1, "%" + searchbean.getSearch_data() + "%");
			ResultSet totalrs = totalstem.executeQuery();

			while (totalrs.next()) {
				totalCount = totalrs.getInt(1);
			}

			int currentPage = 1; // 현재 페이지
			if (currentPage1 != null) {
				currentPage = Integer.parseInt(currentPage1);
			} // 만

			int countList = 10; // 한 페이지에 보여줄 글 수
			int countPage = 5;
			int startPage = ((currentPage - 1) / 5) * 5 + 1;
			int endPage = startPage + countPage - 1;
			int totalPage = totalCount / countList;

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchbean.getSearch_data() + "%");
			pstmt.setInt(2,(currentPage-1)*countList);
	        pstmt.setInt(3, countList);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				switch (rs.getString(4)) {
				case "요청":
					request++;
					break;
				case "진행":
					progress++;
					break;
				case "완료":
					Complet++;
					break;
				case "방문":
					visit++;
					break;
				case "원격":
					remote++;
					break;
				case "유선":
					flowing_line++;
					break;
				case "메일":
					mail++;
					break;
				case "매월점검":
					monthly_Inspection++;
					break;
				case "분기점검":
					branch_Inspection++;
					break;
				case "원격점검":
					remote_Inspection++;
					break;
				case "신규":
					neww++;
					break;
				case "추가":
					add++;
					break;

				}
				Maintenancebean maintenancebean = new Maintenancebean();
				maintenancebean.setSort(rs.getString(1));
				maintenancebean.setCa_title(rs.getString(2));
				maintenancebean.setCom_name(rs.getString(3));
				maintenancebean.setType(rs.getString(4));
				maintenancebean.setOp(rs.getString(5));
				maintenancebean.setContent(rs.getString(6));
				maintenancebean.setOther(rs.getString(7));
				maintenancebean.setGo_date(rs.getString(8));

				maintenancebean.setRequest(request);
				maintenancebean.setProgress(progress);
				maintenancebean.setComplet(Complet);
				maintenancebean.setVisit(visit);
				maintenancebean.setRemote(remote);
				maintenancebean.setFlowing_line(flowing_line);
				maintenancebean.setMail(mail);
				maintenancebean.setMonthly_Inspection(monthly_Inspection);
				maintenancebean.setBranch_Inspection(branch_Inspection);
				maintenancebean.setRemote_Inspection(remote_Inspection);
				maintenancebean.setNeww(neww);
				maintenancebean.setAdd(add);
				maintenancebean.setCountList(countList);
				maintenancebean.setCountPage(countPage);
				maintenancebean.setTotalPage(totalPage);
				maintenancebean.setTotalCount(totalCount);
				maintenancebean.setCurrentPage(currentPage);
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

	public List<companybean> search_select_cu(searchbean searchbean, String currentPage1) {
		String sql = "";
		String sqlend = "ORDER BY l.customer,l.go_date ASC LIMIT ?,?";
		String totalsqlend = "ORDER BY l.customer,l.go_date ASC ";
		String totalsql = "";

		List<companybean> companyList = new ArrayList<companybean>();

		try {
			int totalCount = 0;
			sql = "select name,manager,phone,email,address from customer_tbl WHERE ";
			totalsql = "select count(*) from customer_tbl WHERE ";
			switch (searchbean.getTitle()) {
			case "name":
				sql += "name LIKE  ? " + sqlend;
				totalsql += "name LIKE  ? " + totalsqlend;
				break;
			case "manager":
				sql += "manager  LIKE ?" + sqlend;
				totalsql += "manager LIKE  ? " + totalsqlend;
				break;
			case "phone":
				sql += "phone      LIKE ?" + sqlend;
				totalsql += "phone LIKE  ? " + totalsqlend;
				break;
			case "email":
				sql += "email       LIKE ?" + sqlend;
				totalsql += "email LIKE  ? " + totalsqlend;
				break;
			case "address":
				sql += "address     LIKE ?" + sqlend;
				totalsql += "address LIKE  ? " + totalsqlend;
				break;

			}
			PreparedStatement totalstem = conn.prepareStatement(totalsql);
			totalstem.setString(1, "%" + searchbean.getSearch_data() + "%");
			
			ResultSet totalrs = totalstem.executeQuery();
			
			while (totalrs.next()) {
				totalCount = totalrs.getInt(1);
			}

			int currentPage = 1; // 현재 페이지
			if (currentPage1 != null) {
				currentPage = Integer.parseInt(currentPage1);
			} // 만

			int countList = 10; // 한 페이지에 보여줄 글 수
			int countPage = 5;
			int startPage = ((currentPage - 1) / 5) * 5 + 1;
			int endPage = startPage + countPage - 1;
			int totalPage = totalCount / countList;

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchbean.getSearch_data() + "%");
			pstmt.setInt(2,(currentPage-1)*countList);
	        pstmt.setInt(3, countList);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				companybean companybean = new companybean();
				companybean.setName(rs.getString(1));
				companybean.setManager(rs.getString(2));
				companybean.setPhone(rs.getString(3));
				companybean.setEmail(rs.getString(4));
				companybean.setAddress(rs.getString(5));
				companybean.setCountList(countList);
				companybean.setCountPage(countPage);
				companybean.setTotalPage(totalPage);
				companybean.setTotalCount(totalCount);
				companybean.setCurrentPage(currentPage);
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
