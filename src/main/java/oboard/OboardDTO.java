package oboard;

import java.sql.Timestamp;

public class OboardDTO {

	private int num;
	private String id;
	private String nickname;
	private String fdate;
	private String faddress;
	private String wfood;
	private String nof;
	private String people;
	private String ooption;
	private String etc;
	private Timestamp date;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getFdate() {
		return fdate;
	}
	public void setFdate(String fdate) {
		this.fdate = fdate;
	}
	public String getFaddress() {
		return faddress;
	}
	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}
	public String getWfood() {
		return wfood;
	}
	public void setWfood(String wfood) {
		this.wfood = wfood;
	}
	public String getNof() {
		return nof;
	}
	public void setNof(String nof) {
		this.nof = nof;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}

	public String getOoption() {
		return ooption;
	}
	public void setOoption(String ooption) {
		this.ooption = ooption;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	

	
}
