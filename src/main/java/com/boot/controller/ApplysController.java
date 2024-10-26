package com.boot.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.entity.Applys;
import com.boot.entity.Books;
import com.boot.entity.Orders;
import com.boot.entity.Users;
import com.boot.service.ApplysService;
import com.boot.service.BooksService;
import com.boot.service.OrdersService;
import com.boot.service.UsersService;
import com.boot.util.PageHelper;
import com.boot.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/applys", produces = "text/plain;charset=utf-8")
public class ApplysController extends BaseController {
	// @Autowired的作用是自动注入依赖的ServiceBean
	@Autowired
	private ApplysService applysService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private BooksService booksService;

	// 准备添加数据
	@RequestMapping("createApplys.action")
	public String createApplys() {
		List<Orders> ordersList = this.ordersService.getAllOrders();
		this.getRequest().setAttribute("ordersList", ordersList);
		List<Users> usersList = this.usersService.getAllUsers();
		this.getRequest().setAttribute("usersList", usersList);
		List<Books> booksList = this.booksService.getAllBooks();
		this.getRequest().setAttribute("booksList", booksList);
		return "admin/addapplys";
	}

	// 添加数据
	@RequestMapping("addApplys.action")
	public String addApplys(Applys applys) {
		this.applysService.insertApplys(applys);
		return "redirect:/applys/createApplys.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteApplys.action")
	public String deleteApplys(String id) {
		this.applysService.deleteApplys(id);
		return "redirect:/applys/getAllApplys.action";
	}

	// 批量删除数据
	@RequestMapping("deleteApplysByIds.action")
	public String deleteApplysByIds() {
		String[] ids = this.getRequest().getParameterValues("applysid");
		if (ids != null) {
			for (String applysid : ids) {
				this.applysService.deleteApplys(applysid);
			}
		}
		return "redirect:/applys/getAllApplys.action";
	}

	// 更新数据
	@RequestMapping("updateApplys.action")
	public String updateApplys(Applys applys) {
		this.applysService.updateApplys(applys);
		return "redirect:/applys/getAllApplys.action";
	}

	// 更新状态
	@RequestMapping("status.action")
	public String status(String id) {
		String status = "通过审核";
		Applys applys = this.applysService.getApplysById(id);
		applys.setStatus(status);
		this.applysService.updateApplys(applys);
		Orders orders = this.ordersService.getOrdersById(applys.getOrdersid());
		String nxtDay = VeDate.getNextDay(orders.getTheend(), "14");
		orders.setTheend(nxtDay);
		this.ordersService.updateOrders(orders);
		return "redirect:/applys/getAllApplys.action";
	}

	// 显示全部数据
	@RequestMapping("getAllApplys.action")
	public String getAllApplys(String number) {
		List<Applys> applysList = this.applysService.getAllApplys();
		PageHelper.getUserPage(applysList, "applys", "getAllApplys", 10, number, this.getRequest());
		return "admin/listapplys";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryApplysByCond.action")
	public String queryApplysByCond(String cond, String name, String number) {
		Applys applys = new Applys();
		if (cond != null) {
			if ("ordersid".equals(cond)) {
				applys.setOrdersid(name);
			}
			if ("usersid".equals(cond)) {
				applys.setUsersid(name);
			}
			if ("booksid".equals(cond)) {
				applys.setBooksid(name);
			}
			if ("reason".equals(cond)) {
				applys.setReason(name);
			}
			if ("addtime".equals(cond)) {
				applys.setAddtime(name);
			}
			if ("status".equals(cond)) {
				applys.setStatus(name);
			}
			if ("memo".equals(cond)) {
				applys.setMemo(name);
			}
		}

		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		nameList.add(cond);
		valueList.add(name);
		PageHelper.getPage(this.applysService.getApplysByLike(applys), "applys", nameList, valueList, 10, number,
				this.getRequest(), "query");
		name = null;
		cond = null;
		return "admin/queryapplys";
	}

	// 按主键查询数据
	@RequestMapping("getApplysById.action")
	public String getApplysById(String id) {
		Applys applys = this.applysService.getApplysById(id);
		this.getRequest().setAttribute("applys", applys);
		List<Orders> ordersList = this.ordersService.getAllOrders();
		this.getRequest().setAttribute("ordersList", ordersList);
		List<Users> usersList = this.usersService.getAllUsers();
		this.getRequest().setAttribute("usersList", usersList);
		List<Books> booksList = this.booksService.getAllBooks();
		this.getRequest().setAttribute("booksList", booksList);
		return "admin/editapplys";
	}

}
