package com.boot.entity;

import com.boot.util.VeDate;

public class Applys {
	private String applysid = "A" + VeDate.getStringId();// 生成主键编号
	private String ordersid;// 预约单
	private String usersid;// 用户
	private String booksid;// 图书
	private String reason;// 申请原因
	private String addtime;// 申请日期
	private String status;// 状态
	private String memo;// 备注
	private String ordercode;// 映射数据
	private String username;// 映射数据
	private String booksname;// 映射数据

	public String getApplysid() {
		return applysid;
	}

	public void setApplysid(String applysid) {
		this.applysid = applysid;
	}

	public String getOrdersid() {
		return this.ordersid;
	}

	public void setOrdersid(String ordersid) {
		this.ordersid = ordersid;
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

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
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

	public String getOrdercode() {
		return this.ordercode;
	}

	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
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
		return "Applys [applysid=" + this.applysid + ", ordersid=" + this.ordersid + ", usersid=" + this.usersid
				+ ", booksid=" + this.booksid + ", reason=" + this.reason + ", addtime=" + this.addtime + ", status="
				+ this.status + ", memo=" + this.memo + ", ordercode=" + this.ordercode + ", username=" + this.username
				+ ", booksname=" + this.booksname + "]";
	}

}
