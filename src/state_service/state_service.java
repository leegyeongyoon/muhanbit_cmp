package state_service;

import java.util.List;

import state.stateDAO;
import state.statebean;

public class state_service {
	private stateDAO statedao;
	public state_service() {
		statedao = stateDAO.getInstance();
	}
	
	
	public boolean state_insert(String sort, String title) {
		if (statedao.selectOne(sort,title) == null) {
		statebean statebean = new statebean();
		statebean.setSort(sort);;
		statebean.setTitle(title);;
		statedao.joincategory(statebean);
		return true;
	}
		else {
			return false;
		}
	}
	
	public 	List<statebean> sort_select(String sort){

		return statedao.sort_select(sort);
	}
	
	public boolean state_delete(String sort , String title) {
		if (statedao.selectOne(sort,title) != null) { 
		statebean stbean = new statebean();
		stbean.setSort(sort);
		stbean.setTitle(title);
		statedao.delete_state(stbean);
		return true;
	}
		else {
			return false;
		}
	}
	
		
	}
	
	
