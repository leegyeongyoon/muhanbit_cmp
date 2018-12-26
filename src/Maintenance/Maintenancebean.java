package Maintenance;

public class Maintenancebean {
	private String sort;
	private String type;
	private String ca_title;
	private String com_name;
	private String op;
	private String content;
	private String other;
	private String go_date;

	int request, progress, Complet, visit, remote, flowing_line, mail,
	    monthly_Inspection, branch_Inspection,
	    remote_Inspection, neww, add;

	public int getRequest() {
		return request;
	}

	public void setRequest(int request) {
		this.request = request;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	public int getComplet() {
		return Complet;
	}

	public void setComplet(int complet) {
		Complet = complet;
	}

	public int getVisit() {
		return visit;
	}

	public void setVisit(int visit) {
		this.visit = visit;
	}

	public int getRemote() {
		return remote;
	}

	public void setRemote(int remote) {
		this.remote = remote;
	}

	public int getFlowing_line() {
		return flowing_line;
	}

	public void setFlowing_line(int flowing_line) {
		this.flowing_line = flowing_line;
	}

	public int getMail() {
		return mail;
	}

	public void setMail(int mail) {
		this.mail = mail;
	}

	public int getMonthly_Inspection() {
		return monthly_Inspection;
	}

	public void setMonthly_Inspection(int monthly_Inspection) {
		this.monthly_Inspection = monthly_Inspection;
	}

	public int getBranch_Inspection() {
		return branch_Inspection;
	}

	public void setBranch_Inspection(int branch_Inspection) {
		this.branch_Inspection = branch_Inspection;
	}

	public int getRemote_Inspection() {
		return remote_Inspection;
	}

	public void setRemote_Inspection(int remote_Inspection) {
		this.remote_Inspection = remote_Inspection;
	}

	public int getNeww() {
		return neww;
	}

	public void setNeww(int neww) {
		this.neww = neww;
	}

	public int getAdd() {
		return add;
	}

	public void setAdd(int add) {
		this.add = add;
	}

	public String getGo_date() {
		return go_date;
	}

	public void setGo_date(String go_date) {
		this.go_date = go_date;
	}

	private int fk_ca_seq;

	public int getFk_ca_seq() {
		return fk_ca_seq;// ¡÷ºÆ
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
