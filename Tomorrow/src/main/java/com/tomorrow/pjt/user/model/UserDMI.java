package com.tomorrow.pjt.user.model;

public class UserDMI extends UserVO
{
	private int i_prod;	
	private String prod_nm;
	private String prod_categoty;
	private String prod_price;

	/*
	 * private List<ProdRecMenuVO> menuList;
	 */
	public int getI_prod() {
		return i_prod;
	}
	public void setI_prod(int i_prod) {
		this.i_prod = i_prod;
	}
	public String getProd_nm() {
		return prod_nm;
	}
	public void setProd_nm(String prod_nm) {
		this.prod_nm = prod_nm;
	}
	public String getProd_categoty() {
		return prod_categoty;
	}
	public void setProd_categoty(String prod_categoty) {
		this.prod_categoty = prod_categoty;
	}
	public String getProd_price() {
		return prod_price;
	}
	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}
	/*
	 * public List<ProdRecMenuVO> getMenuList() { return menuList; } public void
	 * setMenuList(List<ProdRecMenuVO> menuList) { this.menuList = menuList; }
	 */

		

}
