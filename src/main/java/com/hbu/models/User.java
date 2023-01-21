package com.hbu.models;

/**
 *
 * @author caipuyu
 *2023-01-19
 */
/**
 * User login
 userNumber		Type: string student number
 userPassword	Type: string password

 *
 */
public class User {

	private String username;
	private String userPassword;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	@Override
	public String toString() {
		return "User [username=" + username + ", userPassword=" + userPassword + "]";
	}

}
