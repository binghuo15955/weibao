package com.yt.util;

public class validate {

	public static boolean validate_form(String text, String pattern) {
		if (text.matches(pattern)) {
			return true;
		}
		return false;
	}
	
	public static boolean validate_username(String username) {
		if (username.length()>6&&username.matches("![^\\w\\s]+")) {
			return true;
		}
		return false;
	}
	
	public static boolean validate_email(String email) {
		if (email.matches("[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?")) {
			return true;
		}
		return false;
	}

	public static boolean validate_pwd(String pwd) {
		if (pwd.length()>6&&pwd.matches("![^\\w\\s]+")) {
			return true;
		}
		return false;
	}
	
	public static boolean validate_tel(String tel) {
		if (tel.matches("^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\\d{8}$")) {
			return true;
		}
		return false;
	}
	
	

}
