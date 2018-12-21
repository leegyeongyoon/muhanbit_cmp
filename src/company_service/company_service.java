package company_service;

import java.util.List;

import company.companyDAO;
import company.companybean;

public class company_service {
	private companyDAO companydao;

	public company_service() {
		companydao = companyDAO.getInstance();
	}

	public boolean company_insert(String name, String manager, String phone, String address, String email) {
		if (companydao.selectOne(name) == null) {
			companybean companybean = new companybean();
			companybean.setName(name);
			companybean.setManager(manager);
			companybean.setPhone(phone);
			companybean.setAddress(address);
			companybean.setEmail(email);
			companydao.insert_company(companybean);
			return true;
		} else {
			return false;
		}
	}

	public List<companybean> getcompanyList() {
		return companydao.selectAll();
	}

	public List<companybean> companyupdate(String name) {
		return companydao.update_select_One(name);
	}


	
	public boolean company_update(String name, String manager, String phone , String address, String email, String ori_name) {
		if (!(companydao.selectOne(ori_name) == null)) {
			companybean companybean = new companybean();
			companybean.setName(name);
			companybean.setManager(manager);
			companybean.setPhone(phone);
			companybean.setAddress(address);
			companybean.setEmail(email);
			companydao.update_company(companybean,ori_name);
		return true;
	}
		else {
			return false;
		}
	}
	
	public boolean company_delete(List<Object> names) {
		try {
		companybean companybean = new companybean();
			companybean.setDel_name(names);
			companydao.delete_company(companybean);
			return true;
		}
		catch (Exception e) {
			return false;
		}
	}
	
}