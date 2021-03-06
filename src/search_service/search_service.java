package search_service;
import java.util.List;

import Maintenance.Maintenancebean;
import company.companybean;
import search.searchDAO;
import search.searchbean;


public class search_service {
	private searchDAO searchdao;

	public search_service() {
		searchdao = searchDAO.getInstance();
	}
	public List<Maintenancebean> search_select_ma_list(String sort, String title, String search_data,String currentPage1) {
		searchbean searchbean = new searchbean();
		searchbean.setSort(sort);
		searchbean.setTitle(title);
		searchbean.setSearch_data(search_data);
		return searchdao.search_select_ma(searchbean,currentPage1);
	}
	
	public List<Maintenancebean> search_select_ma_state(String sort, String title, String search_data) {
		searchbean searchbean = new searchbean();
		searchbean.setSort(sort);
		searchbean.setTitle(title);
		searchbean.setSearch_data(search_data);
		return searchdao.search_select_ma_state(searchbean);
	}
	
	public List<companybean> search_select_cu(String sort, String title, String search_data,String currentPage1) {
		System.out.println(sort + title + search_data);
		searchbean searchbean = new searchbean();
		searchbean.setSort(sort);
		searchbean.setTitle(title);
		searchbean.setSearch_data(search_data);
		return searchdao.search_select_cu(searchbean,currentPage1);
	}
}
