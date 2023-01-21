package com.hbu.models;

public class Result<T>{

	private String code = "000000";
	
	private String message = "success";
	
	private T data;


	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "Result{" +
				"code='" + code + '\'' +
				", message='" + message + '\'' +
				", data=" + data +
				'}';
	}
}
