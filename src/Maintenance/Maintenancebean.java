package Maintenance;

public class Maintenancebean {
	private String sort;
	private String type;
	private String ca_title;
	private String com_name;
	private String op;
	private String content;
	private String other;
	private int fk_ca_seq;
	public int getFk_ca_seq() {
		return fk_ca_seq;//¡÷ºÆ
	}
	public void setFk_ca_seq(int fk_ca_seq) {
		this.fk_ca_seq = fk_ca_seq;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCa_title() {
		return ca_title;
	}
	public void setCa_title(String ca_title) {
		this.ca_title = ca_title;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getOp() {
		return op;
	}
	public void setOp(String op) {
		this.op = op;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	
}
