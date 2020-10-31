package com.tomorrow.pjt.user.model;

public class UserPARAM extends UserVO 
{
	private String msg;
	private int i_prod;
	private String proc_type;
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getI_prod() {
		return i_prod;
	}
	public void setI_prod(int i_prod) {
		this.i_prod = i_prod;
	}
	public String getProc_type() {
		return proc_type;
	}
	public void setProc_type(String proc_type) {
		this.proc_type = proc_type;
	}
}
