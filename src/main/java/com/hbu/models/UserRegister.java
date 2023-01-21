package com.hbu.models;

/**
 * user registration
 * @author caipuyu
 *2023-01-20
 *
name       Type: string name
userNumber Type: string student number
departId   Type: int College ID
sexId      type: int gender ID
birthday   type: date birthday
userPhone  type: string phone number
numberCheck type: int verification code
userCard   type: string student card path
userName   Type: String user nickname
userPassword type: String user password

 */

public class UserRegister {

	private String name;
	private String userNumber;
	private int departId;
	private int sexId;
	private String birthday;
	private String userPhone;
	private String userCard;
	private String userName;
	private String userPassword;
	private int numberCheck;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}
	public int getDepartId() {
		return departId;
	}
	public void setDepartId(int departId) {
		this.departId = departId;
	}
	public int getSexId() {
		return sexId;
	}
	public void setSexId(int sexId) {
		this.sexId = sexId;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserCard() {
		return userCard;
	}
	public void setUserCard(String userCard) {
		this.userCard = userCard;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public int getNumberCheck() {
		return numberCheck;
	}
	public void setNumberCheck(int numberCheck) {
		this.numberCheck = numberCheck;
	}
	@Override
	public String toString() {
		return "UserRegister [name=" + name + ", userNumber=" + userNumber + ", departId=" + departId + ", sexId="
				+ sexId + ", birthday=" + birthday + ", userPhone=" + userPhone + ", userCard=" + userCard
				+ ", userName=" + userName + ", userPassword=" + userPassword + ", numberCheck=" + numberCheck + "]";
	}

	
}
