package com.zte.sms.vo;

public class StudentVO {

	private String name;

	private Integer minAge;

	private Integer maxAge;

	private Integer gender;

	private Integer gid;

	private String username;

	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	private String password;

	private Integer cid;

	public StudentVO() {
		// TODO Auto-generated constructor stub
	}



	public StudentVO(String name,String username,String password, Integer minAge, Integer maxAge, Integer gender, Integer gid, Integer cid) {
		super();
		this.name = name;
		this.minAge = minAge;
		this.maxAge = maxAge;
		this.gender = gender;
		this.gid = gid;
		this.cid = cid;
		this.username = username;
		this.password= password;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getMinAge() {
		return minAge;
	}

	public void setMinAge(Integer minAge) {
		this.minAge = minAge;
	}

	public Integer getMaxAge() {
		return maxAge;
	}

	public void setMaxAge(Integer maxAge) {
		this.maxAge = maxAge;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}



	@Override
	public String toString() {
		return "StudentVO [name=" + name + ", minAge=" + minAge + ", maxAge=" + maxAge + ", gender=" + gender + ", gid="
				+ gid + ", username=" + username + ", password=" + password + ", cid=" + cid + "]";
	}






}
