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

	
	public List<Maintenancebean> selectMaintenanceList(String year , String month) {
		String date = year+"-"+month+"%";
		System.out.println(date);
		String sql = "select c.sort,c.title,l.customer,l.type,l.op,l.content,l.other,l.go_date  from category_tbl AS c JOIN customer_list_tbl  AS l ON c.seq = l.fk_ca_seq WHERE l.go_date LIKE ? ORDER BY l.go_date ASC";
		List<Maintenancebean> MaintenanceList = new ArrayList<Maintenancebean>();
		
		try {
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);	
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
	
	
	public List<Maintenancebean> selectMaintenanceList_where(Maintenancebean maintenancebean) {
		String sql = "select c.sort,c.title,l.customer,l.type,l.op,l.content,l.other,l.go_date  from category_tbl AS c JOIN customer_list_tbl  AS l ON c.seq = l.fk_ca_seq  where customer = ?";
		int request=0 , progress=0 , Complet=0 , visit=0 , remote=0,flowing_line=0,mail=0,monthly_Inspection=0,branch_Inspection=0,remote_Inspection=0,neww=0,add=0;
		List<Maintenancebean> MaintenanceList = new ArrayList<Maintenancebean>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, maintenancebean.getCom_name());
			rs = pstmt.executeQuery();
			rs.last();
			rs.getRow();
			int num = rs.getRow();
			rs = pstmt.executeQuery();
			while (rs.next() ) {
				num = num-1;
				switch(rs.getString(4)) {
				case "요청":request++; 				break;
				case "진행":progress++; 				break;
				case "완료":Complet++; 				break;
				case "방문":visit++; 					break;
				case "원격":remote++; 				break;
				case "유선":flowing_line++; 			break;
				case "메일":mail++; 					break;
				case "매월점검":monthly_Inspection++;	break;
				case "분기점검":branch_Inspection++;  break;
				case "원격점검":remote_Inspection++; 	break;
				case "신규":neww++; 					break;
				case "추가":add++; 					break;
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
