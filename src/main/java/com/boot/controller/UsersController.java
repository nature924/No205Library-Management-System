package com.boot.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.entity.Users;
import com.boot.service.UsersService;
import com.boot.util.PageHelper;
import com.boot.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/users", produces = "text/plain;charset=utf-8")
public class UsersController extends BaseController {
	// @Autowired的作用是自动注入依赖的ServiceBean
	@Autowired
	private UsersService usersService;

	// 准备添加数据
	@RequestMapping("createUsers.action")
	public String createUsers() {
		return "admin/addusers";
	}

	// 添加数据
	@RequestMapping("addUsers.action")
	public String addUsers(Users users) {
		users.setStatus("");
		users.setRegdate(VeDate.getStringDateShort());
		this.usersService.insertUsers(users);
		return "redirect:/users/createUsers.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteUsers.action")
	public String deleteUsers(String id) {
		this.usersService.deleteUsers(id);
		return "redirect:/users/getAllUsers.action";
	}

	// 批量删除数据
	@RequestMapping("deleteUsersByIds.action")
	public String deleteUsersByIds() {
		String[] ids = this.getRequest().getParameterValues("usersid");
		if (ids != null) {
			for (String usersid : ids) {
				this.usersService.deleteUsers(usersid);
			}
		}
		return "redirect:/users/getAllUsers.action";
	}

	// 更新数据
	@RequestMapping("updateUsers.action")
	public String updateUsers(Users users) {
		this.usersService.updateUsers(users);
		return "redirect:/users/getAllUsers.action";
	}

	// 更新状态
	@RequestMapping("status.action")
	public String status(String id) {
		String status = "锁定";
		Users users = this.usersService.getUsersById(id);
		if (status.equals(users.getStatus())) {
			status = "解锁";
		}
		users.setStatus(status);
		this.usersService.updateUsers(users);
		return "redirect:/users/getAllUsers.action";
	}

	// 显示全部数据
	@RequestMapping("getAllUsers.action")
	public String getAllUsers(String number) {
		List<Users> usersList = this.usersService.getAllUsers();
		PageHelper.getUserPage(usersList, "users", "getAllUsers", 10, number, this.getRequest());
		return "admin/listusers";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryUsersByCond.action")
	public String queryUsersByCond(String cond, String name, String number) {
		Users users = new Users();
		if (cond != null) {
			if ("username".equals(cond)) {
				users.setUsername(name);
			}
			if ("password".equals(cond)) {
				users.setPassword(name);
			}
			if ("realname".equals(cond)) {
				users.setRealname(name);
			}
			if ("sex".equals(cond)) {
				users.setSex(name);
			}
			if ("birthday".equals(cond)) {
				users.setBirthday(name);
			}
			if ("contact".equals(cond)) {
				users.setContact(name);
			}
			if ("status".equals(cond)) {
				users.setStatus(name);
			}
			if ("regdate".equals(cond)) {
				users.setRegdate(name);
			}
		}

		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		nameList.add(cond);
		valueList.add(name);
		PageHelper.getPage(this.usersService.getUsersByLike(users), "users", nameList, valueList, 10, number,
				this.getRequest(), "query");
		name = null;
		cond = null;
		return "admin/queryusers";
	}

	// 按主键查询数据
	@RequestMapping("getUsersById.action")
	public String getUsersById(String id) {
		Users users = this.usersService.getUsersById(id);
		this.getRequest().setAttribute("users", users);
		return "admin/editusers";
	}

}
