package com.boot.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.boot.entity.Books;

@Service("booksService")
public interface BooksService {
	// 插入数据 调用booksDAO里的insertBooks配置
	public int insertBooks(Books books);

	// 更新数据 调用booksDAO里的updateBooks配置
	public int updateBooks(Books books);

	// 删除数据 调用booksDAO里的deleteBooks配置
	public int deleteBooks(String booksid);

	// 查询全部数据 调用booksDAO里的getAllBooks配置
	public List<Books> getAllBooks();

	public List<Books> getBooksByNews();

	public List<Books> getBooksByHot();

	public List<Books> getBooksByCate(String cateid);

	// 按照Books类里面的字段名称精确查询 调用booksDAO里的getBooksByCond配置
	public List<Books> getBooksByCond(Books books);

	// 按照Books类里面的字段名称模糊查询 调用booksDAO里的getBooksByLike配置
	public List<Books> getBooksByLike(Books books);

	// 按主键查询表返回单一的Books实例 调用booksDAO里的getBooksById配置
	public Books getBooksById(String booksid);

}
