package com.zte.sms.vo;

/*
 * 用于封装处理user表的数据
 */
public class SysuserVO {
	
	private String username;
	
	private String password;
	
	//id
	private Integer id;
	
	//newPass
	private String newPass;
	

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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNewPass() {
		return newPass;
	}

	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}
	
	
	
	

}
