package com.boot.controller;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.entity.Books;
import com.boot.entity.Fav;
import com.boot.entity.Users;
import com.boot.service.BooksService;
import com.boot.service.FavService;
import com.boot.service.UsersService;
import com.boot.util.PageHelper;
//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/fav" , produces = "text/plain;charset=utf-8")
public class FavController extends BaseController {
	// @Autowired的作用是自动注入依赖的ServiceBean
	@Autowired
	private FavService favService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private BooksService booksService;

	// 准备添加数据
	@RequestMapping("createFav.action")
	public String createFav() {
		List<Users> usersList = this.usersService.getAllUsers();
		this.getRequest().setAttribute("usersList", usersList);
		List<Books> booksList = this.booksService.getAllBooks();
		this.getRequest().setAttribute("booksList", booksList);
		return "admin/addfav";
	}
	// 添加数据
	@RequestMapping("addFav.action")
	public String addFav(Fav fav) {
		this.favService.insertFav(fav);
		return "redirect:/fav/createFav.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteFav.action")
	public String deleteFav(String id) {
		this.favService.deleteFav(id);
		return "redirect:/fav/getAllFav.action";
	}

	// 批量删除数据
	@RequestMapping("deleteFavByIds.action")
	public String deleteFavByIds() {
		String[] ids = this.getRequest().getParameterValues("favid");
		if (ids != null) {
			for (String favid : ids) {
				this.favService.deleteFav(favid);
			}
		}
		return "redirect:/fav/getAllFav.action";
	}

	// 更新数据
	@RequestMapping("updateFav.action")
	public String updateFav(Fav fav) {
		this.favService.updateFav(fav);
		return "redirect:/fav/getAllFav.action";
	}

	// 显示全部数据
	@RequestMapping("getAllFav.action")
	public String getAllFav(String number) {
		List<Fav> favList = this.favService.getAllFav();
		PageHelper.getUserPage(favList, "fav", "getAllFav", 10, number, this.getRequest());
		return "admin/listfav";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryFavByCond.action")
	public String queryFavByCond(String cond, String name, String number) {
		Fav fav = new Fav();
		if(cond != null){
			if ("usersid".equals(cond)) {
				fav.setUsersid(name);
			}
			if ("booksid".equals(cond)) {
				fav.setBooksid(name);
			}
			if ("addtime".equals(cond)) {
				fav.setAddtime(name);
			}
		}

		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		nameList.add(cond);
		valueList.add(name);
		PageHelper.getPage(this.favService.getFavByLike(fav), "fav", nameList, valueList, 10, number, this.getRequest(), "query");
		name = null;
		cond = null;
		return "admin/queryfav";
	}

	// 按主键查询数据
	@RequestMapping("getFavById.action")
	public String getFavById(String id) {
		Fav fav = this.favService.getFavById(id);
		this.getRequest().setAttribute("fav", fav);
		List<Users> usersList = this.usersService.getAllUsers();
		this.getRequest().setAttribute("usersList", usersList);
		List<Books> booksList = this.booksService.getAllBooks();
		this.getRequest().setAttribute("booksList", booksList);
		return "admin/editfav";
	}


}
