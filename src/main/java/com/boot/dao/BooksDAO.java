package com.boot.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.boot.entity.Books;

@Repository("booksDAO") // Repository标签定义数据库连接的访问 Spring中直接
@Mapper
public interface BooksDAO {

	/**
	 * BooksDAO 接口 可以按名称直接调用books.xml配置文件的SQL语句
	 */

	// 插入数据 调用entity包books.xml里的insertBooks配置 返回值0(失败),1(成功)
	public int insertBooks(Books books);

	// 更新数据 调用entity包books.xml里的updateBooks配置 返回值0(失败),1(成功)
	public int updateBooks(Books books);

	// 删除数据 调用entity包books.xml里的deleteBooks配置 返回值0(失败),1(成功)
	public int deleteBooks(String booksid);

	// 查询全部数据 调用entity包books.xml里的getAllBooks配置 返回List类型的数据
	public List<Books> getAllBooks();

	public List<Books> getBooksByNews();

	public List<Books> getBooksByHot();

	public List<Books> getBooksByCate(String cateid);

	// 按照Books类里面的值精确查询 调用entity包books.xml里的getBooksByCond配置 返回List类型的数据
	public List<Books> getBooksByCond(Books books);

	// 按照Books类里面的值模糊查询 调用entity包books.xml里的getBooksByLike配置 返回List类型的数据
	public List<Books> getBooksByLike(Books books);

	// 按主键查询表返回单一的Books实例 调用entity包books.xml里的getBooksById配置
	public Books getBooksById(String booksid);

}
