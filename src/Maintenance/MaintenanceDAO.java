package Maintenance;

import state.stateDAO;
import state.statebean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import company.companybean;

public class MaintenanceDAO {

	private static MaintenanceDAO instance;

	public static MaintenanceDAO getInstance() {
		if (instance == null)
			instance = new MaintenanceDAO();
		return instance;
	}

	private Connection conn;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private MaintenanceDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/leegy");
			conn = ds.getConnection();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void insert_Maintenance(Maintenancebean maintenancebean) {
		String sql = "INSERT INTO customer_list_tbl(fk_ca_seq,customer,type,op,content,other,go_date) VALUES (?,?,?,?,?,?,?)";
		try {
			System.out.println(maintenancebean.getFk_ca_seq());
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maintenancebean.getFk_ca_seq());
			pstmt.setString(2, maintenancebean.getCom_name());
			pstmt.setString(3, maintenancebean.getType());
			pstmt.setString(4, maintenancebean.getOp());
			pstmt.setString(5, maintenancebean.getContent());
			pstmt.setString(6, maintenancebean.getOther());
			pstmt.setString(7, maintenancebean.getGo_date());
			pstmt.executeUpdate();

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
	}

	public int selectOne(String sort, String title) {
		String sql = "SELECT seq FROM category_tbl WHERE sort=? && title = ?";
		int data = 0;
		Maintenancebean maintenancebean = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sort);
			pstmt.setString(2, title);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				data = rs.getInt(1);

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
		return data;

	}

	public List<Maintenancebean> selectMaintenanceList(String year, String month, Maintenancebean maintenancebean,String currentPage1) {
		List<Maintenancebean> MaintenanceList = new ArrayList<Maintenancebean>();
		try {
			int request = 0, progress = 0, Complet = 0, visit = 0, remote = 0, flowing_line = 0, mail = 0,
				monthly_Inspection = 0, branch_Inspection = 0, remote_Inspection = 0, neww = 0, add = 0;
			String sql = "";
			String totalsql = "";
			int i = 1;
			String date = year + "-" + month + "%";
			int totalCount = 0;				
			PreparedStatement totalstem = null;
			
			int currentPage = 0; // 현재 페이지
			

			int countList = 0; // 한 페이지에 보여줄 글 수
			int countPage = 0;
			int startPage = 0;
			int endPage = 0;
			int totalPage = 0;
				
			if (maintenancebean.getCom_name() != null) {
				sql = "select c.sort,c.title,l.customer,l.type,l.op,l.content,l.other,l.go_date ,l.customer from category_tbl AS c JOIN customer_list_tbl  AS l ON c.seq = l.fk_ca_seq  WHERE l.customer = ? AND l.go_date LIKE ? ORDER BY l.go_date ASC";
			
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(i, maintenancebean.getCom_name());
				
				i++;
				pstmt.setString(i, date);
			
			} else {
			 	currentPage = 1; // 현재 페이지
				if (currentPage1 != null) {
					currentPage = Integer.parseInt(currentPage1);
				} // 만

				 countList = 10; // 한 페이지에 보여줄 글 수
				 countPage = 5;
			
				 
				 
				totalsql="select count(*) from category_tbl AS c JOIN customer_list_tbl  AS l ON c.seq = l.fk_ca_seq  WHERE  l.go_date LIKE ? ORDER BY l.go_date ASC ";
			    totalstem = conn.prepareStatement(totalsql);
				totalstem.setString(i, date);
				sql = "select c.sort,c.title,l.customer,l.type,l.op,l.content,l.other,l.go_date ,l.customer from category_tbl AS c JOIN customer_list_tbl  AS l ON c.seq = l.fk_ca_seq WHERE l.go_date LIKE ? ORDER BY l.customer,l.go_date ASC  LIMIT ?,?";
				
					pstmt = conn.prepareStatement(sql);
				 	pstmt.setString(1, date);
					pstmt.setInt(2,(currentPage-1)*countList);
					pstmt.setInt(3, countList);
					
			
		        
		        
		   	
					ResultSet totalrs = totalstem.executeQuery();
					
					while (totalrs.next()) {
						totalCount = totalrs.getInt(1);
					} 	
					 startPage = ((currentPage - 1) / 5) * 5 + 1;
					 endPage = startPage + countPage - 1;
					 totalPage = totalCount / countList;
				 
			}	
				
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
			
				switch (rs.getString(4)) {
						case   "요청"    :    request++;      	        		break;
						case   "진행"    :    progress++;     	        		break;
						case   "완료"    :    Complet++;      	        		break;
						case   "방문"    :    visit++;							break;
						case   "원격"    :    remote++;				  			break;
						case   "유선"    :    flowing_line++;						break;
						case   "메일"    :    mail++;								break;
						case   "매월점검" :    monthly_Inspection++;				break;
						case   "분기점검" :    branch_Inspection++; 				break;
						case   "원격점검" :    remote_Inspection++; 				break;
						case   "신규"    :    neww++;								break;
						case   "추가"    :    add++;								break;
				}
				Maintenancebean maintenancebean1 = new Maintenancebean();
				maintenancebean1.setSort(rs.getString(1));
				maintenancebean1.setCa_title(rs.getString(2));
				maintenancebean1.setCom_name(rs.getString(3));
				maintenancebean1.setType(rs.getString(4));
				maintenancebean1.setOp(rs.getString(5));
				maintenancebean1.setContent(rs.getString(6));
				maintenancebean1.setOther(rs.getString(7));
				maintenancebean1.setGo_date(rs.getString(8));
				maintenancebean1.setCom_name(rs.getString(9));
				maintenancebean1.setRequest(request);
				maintenancebean1.setProgress(progress);
				maintenancebean1.setComplet(Complet);
				maintenancebean1.setVisit(visit);
				maintenancebean1.setRemote(remote);
				maintenancebean1.setFlowing_line(flowing_line);
				maintenancebean1.setMail(mail);
				maintenancebean1.setMonthly_Inspection(monthly_Inspection);
				maintenancebean1.setBranch_Inspection(branch_Inspection);
				maintenancebean1.setRemote_Inspection(remote_Inspection);
				maintenancebean1.setNeww(neww);
				maintenancebean1.setAdd(add);
				maintenancebean1.setCountList(countList);
				maintenancebean1.setCountPage(countPage);
				maintenancebean1.setTotalPage(totalPage);
				maintenancebean1.setTotalCount(totalCount);
				maintenancebean1.setCurrentPage(currentPage);
				MaintenanceList.add(maintenancebean1);
				
			}
		} catch (Exception e) {
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

}
