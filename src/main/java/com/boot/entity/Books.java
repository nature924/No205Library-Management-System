package com.boot.entity;

import com.boot.util.VeDate;

public class Books {
	private String booksid = "B" + VeDate.getStringId();// 生成主键编号
	private String isbn;// ISBN
	private String booksname;// 图书名称
	private String cateid;// 图书类型
	private String image;// 图书图片
	private String author;// 图书作者
	private String publisher;// 出版社
	private String recommend;// 是否推荐
	private String addtime;// 上架日期
	private String hits;// 点击数
	private String storage;// 库存数量
	private String num;// 借阅次数
	private String contents;// 图书介绍
	private String catename;// 映射数据

	public String getBooksid() {
		return booksid;
	}

	public void setBooksid(String booksid) {
		this.booksid = booksid;
	}

	public String getIsbn() {
		return this.isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getBooksname() {
		return this.booksname;
	}

	public void setBooksname(String booksname) {
		this.booksname = booksname;
	}

	public String getCateid() {
		return this.cateid;
	}

	public void setCateid(String cateid) {
		this.cateid = cateid;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return this.publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getRecommend() {
		return this.recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}

	public String getAddtime() {
		return this.addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public String getHits() {
		return this.hits;
	}

	public void setHits(String hits) {
		this.hits = hits;
	}

	public String getStorage() {
		return this.storage;
	}

	public void setStorage(String storage) {
		this.storage = storage;
	}

	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getContents() {
		return this.contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getCatename() {
		return this.catename;
	}

	public void setCatename(String catename) {
		this.catename = catename;
	}

	// 重载方法 生成JSON类型字符串
	@Override
	public String toString() {
		return "Books [booksid=" + this.booksid + ", isbn=" + this.isbn + ", booksname=" + this.booksname + ", cateid="
				+ this.cateid + ", image=" + this.image + ", author=" + this.author + ", publisher=" + this.publisher
				+ ", recommend=" + this.recommend + ", addtime=" + this.addtime + ", hits=" + this.hits + ", storage="
				+ this.storage + ", num=" + this.num + ", contents=" + this.contents + ", catename=" + this.catename
				+ "]";
	}

}
