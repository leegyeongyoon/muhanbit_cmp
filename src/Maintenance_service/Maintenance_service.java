package Maintenance_service;

import java.util.List;

import Maintenance.MaintenanceDAO;
import Maintenance.Maintenancebean;



public class Maintenance_service {
	private MaintenanceDAO maintenancedao;

	public Maintenance_service() {
		maintenancedao = MaintenanceDAO.getInstance();
	}

	public boolean Maintenance_insert(String sort,String type,String ca_title,String com_name,String op,String content,String other) {
			try{
				    
				Maintenancebean maintenancebean = new Maintenancebean();
				maintenancebean.setFk_ca_seq(maintenancedao.selectOne(sort,ca_title));
				maintenancebean.setSort(sort);
				maintenancebean.setType(type);
				maintenancebean.setCa_title(ca_title);
				maintenancebean.setCom_name(com_name);
				maintenancebean.setOp(op);
				maintenancebean.setContent(content);
				maintenancebean.setOther(other);
				maintenancedao.insert_Maintenance(maintenancebean);
			return true;
			}
			catch (Exception e) {
				return false;
			}
	}

	
	
}