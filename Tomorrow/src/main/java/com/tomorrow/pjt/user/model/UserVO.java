package com.tomorrow.pjt.user.model;

public class UserVO 
{
	private int i_user;
	private String user_id;
	private String user_pw;
	private String nm;
	private String nick_nm;
	private String salt;
	private String email;
	private String l_addr;
	private String s_addr;
	private String r_dt;
	private String m_dt;
	
	public String getNick_nm() {
		return nick_nm;
	}
	public void setNick_nm(String nick_nm) {
		this.nick_nm = nick_nm;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getL_addr() {
		return l_addr;
	}
	public void setL_addr(String l_addr) {
		this.l_addr = l_addr;
	}
	public String getS_addr() {
		return s_addr;
	}
	public void setS_addr(String s_addr) {
		this.s_addr = s_addr;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	public String getM_dt() {
		return m_dt;
	}
	public void setM_dt(String m_dt) {
		this.m_dt = m_dt;
	}
	
	
}