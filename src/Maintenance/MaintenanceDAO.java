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
		String sql = "INSERT INTO customer_list_tbl(fk_ca_seq,customer,type,op,content,other) VALUES (?,?,?,?,?,?)";
		try {
			System.out.println(maintenancebean.getFk_ca_seq());
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maintenancebean.getFk_ca_seq());
			pstmt.setString(2, maintenancebean.getCom_name());
			pstmt.setString(3, maintenancebean.getType());
			pstmt.setString(4, maintenancebean.getOp());
			pstmt.setString(5, maintenancebean.getContent());
			pstmt.setString(6, maintenancebean.getOther());
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

}
