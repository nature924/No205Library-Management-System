package com.boot.dao;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.boot.entity.Applys;

@Repository("applysDAO") // Repository标签定义数据库连接的访问 Spring中直接
@Mapper
public interface ApplysDAO {

	/**
* ApplysDAO 接口 可以按名称直接调用applys.xml配置文件的SQL语句
 */

	// 插入数据 调用entity包applys.xml里的insertApplys配置 返回值0(失败),1(成功)
	public int insertApplys(Applys applys);

	// 更新数据 调用entity包applys.xml里的updateApplys配置 返回值0(失败),1(成功)
	public int updateApplys(Applys applys);

	// 删除数据 调用entity包applys.xml里的deleteApplys配置 返回值0(失败),1(成功)
	public int deleteApplys(String applysid);

	// 查询全部数据 调用entity包applys.xml里的getAllApplys配置 返回List类型的数据
	public List<Applys> getAllApplys();

	// 按照Applys类里面的值精确查询 调用entity包applys.xml里的getApplysByCond配置 返回List类型的数据
	public List<Applys> getApplysByCond(Applys applys);

	// 按照Applys类里面的值模糊查询 调用entity包applys.xml里的getApplysByLike配置 返回List类型的数据
	public List<Applys> getApplysByLike(Applys applys);

	// 按主键查询表返回单一的Applys实例 调用entity包applys.xml里的getApplysById配置
	public Applys getApplysById(String applysid);

}


