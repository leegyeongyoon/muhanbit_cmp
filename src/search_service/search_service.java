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
	public List<Maintenancebean> search_select_ma(String sort, String title, String search_data) {
		System.out.println(sort + title + search_data);
		searchbean searchbean = new searchbean();
		searchbean.setSort(sort);
		searchbean.setTitle(title);
		searchbean.setSearch_data(search_data);
		return searchdao.search_select_ma(searchbean);
	}
	
	public List<companybean> search_select_cu(String sort, String title, String search_data) {
		System.out.println(sort + title + search_data);
		searchbean searchbean = new searchbean();
		searchbean.setSort(sort);
		searchbean.setTitle(title);
		searchbean.setSearch_data(search_data);
		return searchdao.search_select_cu(searchbean);
	}
}
