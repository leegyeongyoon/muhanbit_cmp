package company;

import state.stateDAO;
import paging_bean.pagingbean;
import state.statebean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class companyDAO {

	private static companyDAO instance;

	public static companyDAO getInstance() {
		if (instance == null)
			instance = new companyDAO();
		return instance;
	}

	private Connection conn;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private companyDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/leegy");
			conn = ds.getConnection();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void insert_company(companybean companybean) {
		String sql = "INSERT INTO customer_tbl(name,manager,phone,address,email) VALUES (?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, companybean.getName());
			pstmt.setString(2, companybean.getManager());
			pstmt.setString(3, companybean.getPhone());
			pstmt.setString(4, companybean.getAddress());
			pstmt.setString(5, companybean.getEmail());
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

	public companybean selectOne(String name) {
		String sql = "SELECT name FROM customer_tbl WHERE name=?";
		companybean companybean = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				companybean = new companybean();
				companybean.setName(rs.getString(1));

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
		return companybean;

	}

	public List<companybean> selectAll(String currentPage1) {
		  int totalCount = 0;
	     String totalsql = "SELECT count(*)  from customer_tbl";
         
		String sql = "SELECT name,address,manager,phone,email FROM customer_tbl LIMIT ?, ?";
		List<companybean> companyList = new ArrayList<companybean>();
			
		try {
			
			 PreparedStatement totalstem = conn.prepareStatement(totalsql);
	         ResultSet totalrs = totalstem.executeQuery();
	         
	         while(totalrs.next()){
	            totalCount = totalrs.getInt(1);
	         }
	         
	         int currentPage = 1; // 현재 페이지
	            if(currentPage1 != null){
	               currentPage =Integer.parseInt(currentPage1);
	            }// 만
	         
	         int countList = 10; // 한 페이지에 보여줄 글 수
	         int countPage = 5;
	         int startPage = ((currentPage -1) /5) *5 +1;
	         int endPage = startPage+countPage-1;
	         int totalPage = totalCount/countList;
	         
	       
	        
	         
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,(currentPage-1)*countList);
	        pstmt.setInt(2, countList);
	        
	        
			rs = pstmt.executeQuery();
			while (rs.next()) {
				companybean companybean = new companybean();
				companybean.setName(rs.getString(1));
				companybean.setAddress(rs.getString(2));
				companybean.setManager(rs.getString(3));
				companybean.setPhone(rs.getString(4));
				companybean.setEmail(rs.getString(5));
				companybean.setCountList(countList);
				companybean.setCountPage(countPage);
				companybean.setTotalPage(totalPage);
				companybean.setTotalCount(totalCount);
				companybean.setCurrentPage(currentPage);
				companyList.add(companybean);
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
		return companyList;

	}
	
	  public List<companybean> selectAll() {
	      String sql = "SELECT name,address,manager,phone,email FROM customer_tbl";
	      List<companybean> companyList = new ArrayList<companybean>();

	      try {
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            companybean companybean = new companybean();
	            companybean.setName(rs.getString(1));
	            companybean.setAddress(rs.getString(2));
	            companybean.setManager(rs.getString(3));
	            companybean.setPhone(rs.getString(4));
	            companybean.setEmail(rs.getString(5));
	            companyList.add(companybean);
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
	      return companyList;

	   }


	public List<companybean> update_select_One(String name) {
		String sql = "SELECT name,manager,phone,address,email FROM customer_tbl WHERE name = ?";
		List<companybean> companyList = new ArrayList<companybean>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				companybean companybean = new companybean();
				companybean.setName(rs.getString(1));
				companybean.setManager(rs.getString(2));
				companybean.setPhone(rs.getString(3));
				companybean.setAddress(rs.getString(4));
				companybean.setEmail(rs.getString(5));
				companyList.add(companybean);
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
		return companyList;

	}

	public void update_company(companybean companybean, String ori_name) {
		String sql = "UPDATE customer_tbl SET name = ? , manager = ? , phone = ?, address = ? , email = ? WHERE name = ?";
		System.out.println(companybean.getName());
		System.out.println(companybean.getManager());
		System.out.println(companybean.getPhone());
		System.out.println(companybean.getAddress());
		System.out.println(companybean.getEmail());
		System.out.println(ori_name);

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, companybean.getName());
			pstmt.setString(2, companybean.getManager());
			pstmt.setString(3, companybean.getPhone());
			pstmt.setString(4, companybean.getAddress());
			pstmt.setString(5, companybean.getEmail());
			pstmt.setString(6, ori_name);
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

	public void delete_company(companybean companybean) {
		String sql = "DELETE FROM customer_tbl WHERE ";

		try {
			for (int i = 0; i < companybean.getDel_name().size(); i++) {
				sql += "name = ? ||";
			}

			pstmt = conn.prepareStatement((String) sql.subSequence(0, sql.length() - 2));
			for (int i = 0; i < companybean.getDel_name().size(); i++) {
				pstmt.setString(i + 1, (String) companybean.getDel_name().get(i));
			}

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

}
