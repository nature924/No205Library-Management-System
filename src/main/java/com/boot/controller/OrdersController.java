package com.boot.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.entity.Books;
import com.boot.entity.Orders;
import com.boot.entity.Users;
import com.boot.service.BooksService;
import com.boot.service.OrdersService;
import com.boot.service.UsersService;
import com.boot.util.PageHelper;
import com.boot.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/orders", produces = "text/plain;charset=utf-8")
public class OrdersController extends BaseController {
	// @Autowired的作用是自动注入依赖的ServiceBean
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private BooksService booksService;

	// 准备添加数据
	@RequestMapping("createOrders.action")
	public String createOrders() {
		List<Users> usersList = this.usersService.getAllUsers();
		this.getRequest().setAttribute("usersList", usersList);
		List<Books> booksList = this.booksService.getAllBooks();
		this.getRequest().setAttribute("booksList", booksList);
		return "admin/addorders";
	}

	// 添加数据
	@RequestMapping("addOrders.action")
	public String addOrders(Orders orders) {
		orders.setAddtime(VeDate.getStringDateShort());
		orders.setStatus("");
		this.ordersService.insertOrders(orders);
		return "redirect:/orders/createOrders.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteOrders.action")
	public String deleteOrders(String id) {
		this.ordersService.deleteOrders(id);
		return "redirect:/orders/getAllOrders.action";
	}

	// 批量删除数据
	@RequestMapping("deleteOrdersByIds.action")
	public String deleteOrdersByIds() {
		String[] ids = this.getRequest().getParameterValues("ordersid");
		if (ids != null) {
			for (String ordersid : ids) {
				this.ordersService.deleteOrders(ordersid);
			}
		}
		return "redirect:/orders/getAllOrders.action";
	}

	// 更新数据
	@RequestMapping("updateOrders.action")
	public String updateOrders(Orders orders) {
		this.ordersService.updateOrders(orders);
		return "redirect:/orders/getAllOrders.action";
	}

	// 更新状态
	@RequestMapping("status.action")
	public String status(String id) {
		String status = "";
		Orders orders = this.ordersService.getOrdersById(id);
		if (status.equals(orders.getStatus())) {
			status = "";
		}
		orders.setStatus(status);
		this.ordersService.updateOrders(orders);
		return "redirect:/orders/getAllOrders.action";
	}

	@RequestMapping("lend.action")
	public String lend(String id) {
		Orders orders = this.ordersService.getOrdersById(id);
		Orders x = new Orders();
		x.setUsersid(orders.getUsersid());
		x.setStatus("借阅");
		List<Orders> xList = this.ordersService.getOrdersByCond(x);
		if (xList.size() >= 5) {
			this.getSession().setAttribute("message", "已经借阅5本 , 请先归还图书");
			return "redirect:/orders/getAllOrders.action";
		}
		Books books = this.booksService.getBooksById(orders.getBooksid());
		if ("1".equals(books.getStorage())) {
			this.getSession().setAttribute("message", "库存错误");
		} else {
			books.setStorage("" + (Integer.parseInt(books.getStorage()) - 1));
			this.booksService.updateBooks(books);
			orders.setStatus("借阅");
			orders.setThestart(VeDate.getStringDateShort());
			orders.setTheend(VeDate.getNextDay(orders.getThestart(), "14"));
			orders.setIsdelay("否");
			this.ordersService.updateOrders(orders);
		}
		return "redirect:/orders/getSendOrders.action";
	}

	@RequestMapping("back.action")
	public String back(String id) {
		Orders orders = this.ordersService.getOrdersById(id);
		Books books = this.booksService.getBooksById(orders.getBooksid());
		books.setStorage("" + (Integer.parseInt(books.getStorage()) + 1));
		this.booksService.updateBooks(books);
		orders.setStatus("归还");
		this.ordersService.updateOrders(orders);
		return "redirect:/orders/getBackOrders.action";
	}

	// 显示全部数据
	@RequestMapping("getAllOrders.action")
	public String getAllOrders(String number) {
		List<Orders> ordersList = this.ordersService.getAllOrders();
		PageHelper.getUserPage(ordersList, "orders", "getAllOrders", 10, number, this.getRequest());
		return "admin/listorders";
	}

	@RequestMapping("getSendOrders.action")
	public String getSendOrders(String number) {
		Orders orders = new Orders();
		orders.setStatus("预约");
		List<Orders> ordersList = this.ordersService.getOrdersByCond(orders);
		PageHelper.getUserPage(ordersList, "orders", "getSendOrders", 10, number, this.getRequest());
		return "admin/xlistorders";
	}

	@RequestMapping("getBackOrders.action")
	public String getBackOrders(String number) {
		Orders orders = new Orders();
		orders.setStatus("借阅");
		List<Orders> ordersList = this.ordersService.getOrdersByCond(orders);
		PageHelper.getUserPage(ordersList, "orders", "getBackOrders", 10, number, this.getRequest());
		return "admin/ylistorders";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryOrdersByCond.action")
	public String queryOrdersByCond(String cond, String name, String number) {
		Orders orders = new Orders();
		if (cond != null) {
			if ("ordercode".equals(cond)) {
				orders.setOrdercode(name);
			}
			if ("usersid".equals(cond)) {
				orders.setUsersid(name);
			}
			if ("booksid".equals(cond)) {
				orders.setBooksid(name);
			}
			if ("thestart".equals(cond)) {
				orders.setThestart(name);
			}
			if ("theend".equals(cond)) {
				orders.setTheend(name);
			}
			if ("addtime".equals(cond)) {
				orders.setAddtime(name);
			}
			if ("status".equals(cond)) {
				orders.setStatus(name);
			}
			if ("memo".equals(cond)) {
				orders.setMemo(name);
			}
		}

		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		nameList.add(cond);
		valueList.add(name);
		PageHelper.getPage(this.ordersService.getOrdersByLike(orders), "orders", nameList, valueList, 10, number,
				this.getRequest(), "query");
		name = null;
		cond = null;
		return "admin/queryorders";
	}

	// 按主键查询数据
	@RequestMapping("getOrdersById.action")
	public String getOrdersById(String id) {
		Orders orders = this.ordersService.getOrdersById(id);
		this.getRequest().setAttribute("orders", orders);
		List<Users> usersList = this.usersService.getAllUsers();
		this.getRequest().setAttribute("usersList", usersList);
		List<Books> booksList = this.booksService.getAllBooks();
		this.getRequest().setAttribute("booksList", booksList);
		return "admin/editorders";
	}

}
