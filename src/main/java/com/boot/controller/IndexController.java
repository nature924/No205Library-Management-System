package com.boot.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.entity.Applys;
import com.boot.entity.Article;
import com.boot.entity.Books;
import com.boot.entity.Cate;
import com.boot.entity.Complains;
import com.boot.entity.Fav;
import com.boot.entity.Orders;
import com.boot.entity.Topic;
import com.boot.entity.Users;
import com.boot.service.ApplysService;
import com.boot.service.ArticleService;
import com.boot.service.BooksService;
import com.boot.service.CateService;
import com.boot.service.ComplainsService;
import com.boot.service.FavService;
import com.boot.service.OrdersService;
import com.boot.service.TopicService;
import com.boot.service.UsersService;
import com.boot.util.PageHelper;
import com.boot.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/index")
public class IndexController extends BaseController {

	@Autowired
	private UsersService usersService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private CateService cateService;
	@Autowired
	private BooksService booksService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private TopicService topicService;
	@Autowired
	private FavService favService;
	@Autowired
	private ComplainsService complainsService;
	@Autowired
	private ApplysService applysService;

	// TODO Auto-generated method stub
	// 公共方法 提供公共查询数据
	private void front() {
		this.getRequest().setAttribute("title", "图书管理系统");
		List<Cate> cateList = this.cateService.getAllCate();
		this.getRequest().setAttribute("cateList", cateList);
		List<Books> hotList = this.booksService.getBooksByHot();
		this.getRequest().setAttribute("hotList", hotList);
	}

	// 首页显示
	@RequestMapping("index.action")
	public String index() {
		this.front();
		List<Cate> cateList = this.cateService.getCateFront();
		List<Cate> frontList = new ArrayList<Cate>();
		for (Cate cate : cateList) {
			List<Books> booksList = this.booksService.getBooksByCate(cate.getCateid());
			cate.setBooksList(booksList);
			frontList.add(cate);
		}
		this.getRequest().setAttribute("frontList", frontList);
		return "users/index";
	}

	// 公告
	@RequestMapping("article.action")
	public String article(String number) {
		this.front();
		List<Article> tempList = this.articleService.getAllArticle();
		PageHelper.getIndexPage(tempList, "article", "article", null, 10, number, this.getRequest());
		return "users/article";
	}

	// 阅读公告
	@RequestMapping("read.action")
	public String read(String id) {
		this.front();
		Article article = this.articleService.getArticleById(id);
		article.setHits("" + (Integer.parseInt(article.getHits()) + 1));
		this.articleService.updateArticle(article);
		this.getRequest().setAttribute("article", article);
		return "users/read";
	}

	// 按分类查询
	@RequestMapping("cate.action")
	public String cate(String id, String number) {
		this.front();
		Books books = new Books();
		books.setCateid(id);
		List<Books> tempList = this.booksService.getBooksByCond(books);
		PageHelper.getIndexPage(tempList, "books", "cate", id, 12, number, this.getRequest());
		return "users/list";
	}

	@RequestMapping("recommend.action")
	public String recommend(String number) {
		this.front();
		Books books = new Books();
		books.setRecommend("是");
		List<Books> tempList = this.booksService.getBooksByCond(books);
		PageHelper.getIndexPage(tempList, "books", "cate", null, 12, number, this.getRequest());
		return "users/list";
	}

	// 全部产品
	@RequestMapping("all.action")
	public String all(String number) {
		this.front();
		List<Books> tempList = this.booksService.getAllBooks();
		PageHelper.getIndexPage(tempList, "books", "all", null, 12, number, this.getRequest());
		return "users/list";
	}

	// 查询图书
	@RequestMapping("query.action")
	public String query(String name) {
		this.front();
		Books books = new Books();
		books.setBooksname(name);
		List<Books> booksList = this.booksService.getBooksByLike(books);
		this.getRequest().setAttribute("booksList", booksList);
		return "users/list";
	}

	@RequestMapping("detail.action")
	public String detail(String id) {
		this.front();
		Books books = this.booksService.getBooksById(id);
		this.getRequest().setAttribute("books", books);
		Topic topic = new Topic();
		topic.setBooksid(id);
		List<Topic> topicList = this.topicService.getTopicByCond(topic);
		this.getRequest().setAttribute("topicList", topicList);
		this.getRequest().setAttribute("tnum", topicList.size());
		return "users/detail";
	}

	// 准备登录
	@RequestMapping("preLogin.action")
	public String prelogin() {
		this.front();
		return "users/login";
	}

	// 用户登录
	@RequestMapping("login.action")
	public String login() {
		this.front();
		String username = this.getRequest().getParameter("username");
		String password = this.getRequest().getParameter("password");
		Users u = new Users();
		u.setUsername(username);
		List<Users> usersList = this.usersService.getUsersByCond(u);
		if (usersList.size() == 0) {
			this.getSession().setAttribute("message", "用户名不存在");
			return "redirect:/index/preLogin.action";
		} else {
			Users users = usersList.get(0);
			if ("锁定".equals(users.getStatus())) {
				this.getSession().setAttribute("message", "账户被锁定");
				return "redirect:/index/preLogin.action";
			}
			if (password.equals(users.getPassword())) {
				this.getSession().setAttribute("userid", users.getUsersid());
				this.getSession().setAttribute("username", users.getUsername());
				this.getSession().setAttribute("users", users);
				return "redirect:/index/index.action";
			} else {
				this.getSession().setAttribute("message", "密码错误");
				return "redirect:/index/preLogin.action";
			}
		}
	}

	// 准备注册
	@RequestMapping("preReg.action")
	public String preReg() {
		this.front();
		return "users/register";
	}

	// 用户注册
	@RequestMapping("register.action")
	public String register(Users users) {
		this.front();
		Users u = new Users();
		u.setUsername(users.getUsername());
		List<Users> usersList = this.usersService.getUsersByCond(u);
		if (usersList.size() == 0) {
			users.setStatus("解锁");
			users.setRegdate(VeDate.getStringDateShort());
			this.usersService.insertUsers(users);
		} else {
			this.getSession().setAttribute("message", "用户名已存在");
			return "redirect:/index/preReg.action";
		}

		return "redirect:/index/preLogin.action";
	}

	// 退出登录
	@RequestMapping("exit.action")
	public String exit() {
		this.front();
		this.getSession().removeAttribute("userid");
		this.getSession().removeAttribute("username");
		this.getSession().removeAttribute("users");
		return "redirect:/index/index.action";
	}

	// 准备修改密码
	@RequestMapping("prePwd.action")
	public String prePwd() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		return "users/editpwd";
	}

	// 修改密码
	@RequestMapping("editpwd.action")
	public String editpwd() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		String password = this.getRequest().getParameter("password");
		String repassword = this.getRequest().getParameter("repassword");
		Users users = this.usersService.getUsersById(userid);
		if (password.equals(users.getPassword())) {
			users.setPassword(repassword);
			this.usersService.updateUsers(users);
		} else {
			this.getSession().setAttribute("message", "旧密码错误");
			return "redirect:/index/prePwd.action";
		}
		this.getSession().setAttribute("message", "修改成功");
		return "redirect:/index/prePwd.action";
	}

	@RequestMapping("usercenter.action")
	public String usercenter() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		return "users/usercenter";
	}

	@RequestMapping("userinfo.action")
	public String userinfo() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		this.getSession().setAttribute("users", this.usersService.getUsersById(userid));
		return "users/userinfo";
	}

	@RequestMapping("personal.action")
	public String personal(Users users) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		this.usersService.updateUsers(users);
		this.getSession().setAttribute("message", "修改成功");
		return "redirect:/index/userinfo.action";
	}

	@RequestMapping("preComplains.action")
	public String preComplains() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		return "users/addComplains";
	}

	@RequestMapping("addComplains.action")
	public String addComplains(Complains complains) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		complains.setAddtime(VeDate.getStringDateShort());
		complains.setStatus("未回复");
		complains.setUsersid(userid);
		this.complainsService.insertComplains(complains);
		return "redirect:/index/preComplains.action";
	}

	@RequestMapping("myComplains.action")
	public String myComplains(String number) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		Complains complains = new Complains();
		complains.setUsersid(userid);
		List<Complains> complainsList = this.complainsService.getComplainsByCond(complains);
		PageHelper.getIndexPage(complainsList, "complains", "myComplains", null, 10, number, this.getRequest());
		return "users/myComplains";
	}

	// 添加收藏
	@RequestMapping("addfav.action")
	public String addfav(Fav fav) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) getRequest().getSession().getAttribute("userid");
		fav.setAddtime(VeDate.getStringDateShort());
		fav.setBooksid(getRequest().getParameter("id"));
		fav.setUsersid(userid);
		this.favService.insertFav(fav);
		return "redirect:/index/myfav.action";
	}

	// 我的收藏
	@RequestMapping("myfav.action")
	public String myfav(String number) {
		this.front();
		if (getRequest().getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		Fav fav = new Fav();
		fav.setUsersid(userid);
		List<Fav> favList = this.favService.getFavByCond(fav);
		PageHelper.getIndexPage(favList, "fav", "myfav", null, 10, number, this.getRequest());
		return "users/myfav";
	}

	// 删除收藏
	@RequestMapping("deletefav.action")
	public String deletefav() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		this.favService.deleteFav(this.getRequest().getParameter("id"));
		return "redirect:/index/myfav.action";
	}

	@RequestMapping("addorder.action")
	public String addorder(String id) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		Orders orders = new Orders();
		orders.setBooksid(id);
		orders.setOrdercode("BD" + VeDate.getStringDatex());
		orders.setAddtime(VeDate.getStringDateShort());
		orders.setStatus("预约");
		orders.setUsersid(userid);
		this.ordersService.insertOrders(orders);
		return "redirect:/index/showOrders.action";
	}

	@RequestMapping("showOrders.action")
	public String showOrders(String number) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		Orders orders = new Orders();
		orders.setUsersid(userid);
		List<Orders> ordersList = this.ordersService.getOrdersByCond(orders);
		PageHelper.getIndexPage(ordersList, "orders", "showOrders", null, 10, number, this.getRequest());
		return "users/orderlist";
	}

	@RequestMapping("cancel.action")
	public String cancel(String id) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		this.ordersService.deleteOrders(id);
		return "redirect:/index/showOrders.action";
	}

	@RequestMapping("preTopic.action")
	public String preTopic(String id) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		this.getRequest().setAttribute("id", id);
		return "users/addTopic";
	}

	@RequestMapping("addTopic.action")
	public String addTopic(String id) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		Orders orders = this.ordersService.getOrdersById(id);
		orders.setStatus("已评价");
		this.ordersService.updateOrders(orders);
		Topic topic = new Topic();
		String userid = (String) this.getSession().getAttribute("userid");
		topic.setAddtime(VeDate.getStringDate());
		topic.setOrdersid(id);
		topic.setBooksid(orders.getBooksid());
		topic.setContents(this.getRequest().getParameter("contents"));
		topic.setNum(this.getRequest().getParameter("num"));
		topic.setUsersid(userid);
		this.topicService.insertTopic(topic);
		return "redirect:/index/showOrders.action";
	}

	@RequestMapping("preApplys.action")
	public String preApplys(String id) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		Orders orders = this.ordersService.getOrdersById(id);
		this.getRequest().setAttribute("orders", orders);
		return "users/addApplys";
	}

	@RequestMapping("addApplys.action")
	public String addApplys(Applys applys) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		applys.setAddtime(VeDate.getStringDateShort());
		applys.setStatus("待处理");
		applys.setUsersid(userid);
		this.applysService.insertApplys(applys);
		Orders orders = this.ordersService.getOrdersById(applys.getOrdersid());
		orders.setIsdelay("是");
		this.ordersService.updateOrders(orders);
		return "redirect:/index/myApplys.action";
	}

	@RequestMapping("myApplys.action")
	public String myApplys(String number) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		Applys applys = new Applys();
		applys.setUsersid(userid);
		List<Applys> applysList = this.applysService.getApplysByCond(applys);
		PageHelper.getIndexPage(applysList, "applys", "myApplys", null, 10, number, this.getRequest());
		return "users/myApplys";
	}
	// TODO Auto-generated method stub
}
