package com.boot.entity;

import com.boot.util.VeDate;

public class Orders {
	private String ordersid = "O" + VeDate.getStringId();// 生成主键编号
	private String ordercode;// 预约单号
	private String usersid;// 用户
	private String booksid;// 图书
	private String thestart;// 开始日期
	private String theend;// 结束日期
	private String addtime;// 预约日期
	private String status;// 状态
	private String memo;// 备注
	private String username;// 映射数据
	private String booksname;// 映射数据
	private String isdelay;// 是否有延期

	public String getIsdelay() {
		return isdelay;
	}

	public void setIsdelay(String isdelay) {
		this.isdelay = isdelay;
	}

	public String getOrdersid() {
		return ordersid;
	}

	public void setOrdersid(String ordersid) {
		this.ordersid = ordersid;
	}

	public String getOrdercode() {
		return this.ordercode;
	}

	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}

	public String getUsersid() {
		return this.usersid;
	}

	public void setUsersid(String usersid) {
		this.usersid = usersid;
	}

	public String getBooksid() {
		return this.booksid;
	}

	public void setBooksid(String booksid) {
		this.booksid = booksid;
	}

	public String getThestart() {
		return this.thestart;
	}

	public void setThestart(String thestart) {
		this.thestart = thestart;
	}

	public String getTheend() {
		return this.theend;
	}

	public void setTheend(String theend) {
		this.theend = theend;
	}

	public String getAddtime() {
		return this.addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBooksname() {
		return this.booksname;
	}

	public void setBooksname(String booksname) {
		this.booksname = booksname;
	}

	// 重载方法 生成JSON类型字符串
	@Override
	public String toString() {
		return "Orders [ordersid=" + this.ordersid + ", ordercode=" + this.ordercode + ", usersid=" + this.usersid
				+ ", booksid=" + this.booksid + ", thestart=" + this.thestart + ", theend=" + this.theend + ", addtime="
				+ this.addtime + ", status=" + this.status + ", memo=" + this.memo + ", username=" + this.username
				+ ", booksname=" + this.booksname + "]";
	}

}
