package com.boot.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.entity.Books;
import com.boot.entity.Cate;
import com.boot.service.BooksService;
import com.boot.service.CateService;
import com.boot.util.PageHelper;
import com.boot.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/books", produces = "text/plain;charset=utf-8")
public class BooksController extends BaseController {
	// @Autowired的作用是自动注入依赖的ServiceBean
	@Autowired
	private BooksService booksService;
	@Autowired
	private CateService cateService;

	// 准备添加数据
	@RequestMapping("createBooks.action")
	public String createBooks() {
		List<Cate> cateList = this.cateService.getAllCate();
		this.getRequest().setAttribute("cateList", cateList);
		this.getRequest().setAttribute("isbn", "ISBN" + VeDate.getStringDatex());
		return "admin/addbooks";
	}

	// 添加数据
	@RequestMapping("addBooks.action")
	public String addBooks(Books books) {
		books.setAddtime(VeDate.getStringDateShort());
		books.setHits("0");
		books.setNum("0");
		this.booksService.insertBooks(books);
		return "redirect:/books/createBooks.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteBooks.action")
	public String deleteBooks(String id) {
		this.booksService.deleteBooks(id);
		return "redirect:/books/getAllBooks.action";
	}

	// 批量删除数据
	@RequestMapping("deleteBooksByIds.action")
	public String deleteBooksByIds() {
		String[] ids = this.getRequest().getParameterValues("booksid");
		if (ids != null) {
			for (String booksid : ids) {
				this.booksService.deleteBooks(booksid);
			}
		}
		return "redirect:/books/getAllBooks.action";
	}

	// 更新数据
	@RequestMapping("updateBooks.action")
	public String updateBooks(Books books) {
		this.booksService.updateBooks(books);
		return "redirect:/books/getAllBooks.action";
	}

	// 显示全部数据
	@RequestMapping("getAllBooks.action")
	public String getAllBooks(String number) {
		List<Books> booksList = this.booksService.getAllBooks();
		PageHelper.getUserPage(booksList, "books", "getAllBooks", 10, number, this.getRequest());
		return "admin/listbooks";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryBooksByCond.action")
	public String queryBooksByCond(String cond, String name, String number) {
		Books books = new Books();
		if (cond != null) {
			if ("isbn".equals(cond)) {
				books.setIsbn(name);
			}
			if ("booksname".equals(cond)) {
				books.setBooksname(name);
			}
			if ("cateid".equals(cond)) {
				books.setCateid(name);
			}
			if ("image".equals(cond)) {
				books.setImage(name);
			}
			if ("author".equals(cond)) {
				books.setAuthor(name);
			}
			if ("publisher".equals(cond)) {
				books.setPublisher(name);
			}
			if ("recommend".equals(cond)) {
				books.setRecommend(name);
			}
			if ("addtime".equals(cond)) {
				books.setAddtime(name);
			}
			if ("hits".equals(cond)) {
				books.setHits(name);
			}
			if ("storage".equals(cond)) {
				books.setStorage(name);
			}
			if ("num".equals(cond)) {
				books.setNum(name);
			}
			if ("contents".equals(cond)) {
				books.setContents(name);
			}
		}

		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		nameList.add(cond);
		valueList.add(name);
		PageHelper.getPage(this.booksService.getBooksByLike(books), "books", nameList, valueList, 10, number,
				this.getRequest(), "query");
		name = null;
		cond = null;
		return "admin/querybooks";
	}

	// 按主键查询数据
	@RequestMapping("getBooksById.action")
	public String getBooksById(String id) {
		Books books = this.booksService.getBooksById(id);
		this.getRequest().setAttribute("books", books);
		List<Cate> cateList = this.cateService.getAllCate();
		this.getRequest().setAttribute("cateList", cateList);
		return "admin/editbooks";
	}

}
