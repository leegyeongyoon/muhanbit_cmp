package company;
import java.util.List;
public class companybean {
	private String name;
	private String manager;
	private String phone;
	private String address;
	private String email;
	private List<Object> del_name;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public List<Object> getDel_name() {
		return del_name;
	}
	public void setDel_name(List<Object> name) {
		this.del_name = name;
	}
	
}
