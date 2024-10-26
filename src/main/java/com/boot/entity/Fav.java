package com.boot.entity;

import com.boot.util.VeDate;

public class Fav {
	private String favid = "F" + VeDate.getStringId();// 生成主键编号
	private String usersid;// 用户
	private String booksid;// 图书
	private String addtime;// 收藏日期
	private String username;// 映射数据
	private String booksname;// 映射数据
	private String image;
	private String storage;

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getStorage() {
		return storage;
	}

	public void setStorage(String storage) {
		this.storage = storage;
	}

	public String getFavid() {
		return favid;
	}

	public void setFavid(String favid) {
		this.favid = favid;
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

	public String getAddtime() {
		return this.addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
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
		return "Fav [favid=" + this.favid + ", usersid=" + this.usersid + ", booksid=" + this.booksid + ", addtime=" + this.addtime
				+ ", username=" + this.username + ", booksname=" + this.booksname + "]";
	}

}

/**
 * 
 */
