package com.boot.service;
import java.util.List;
import org.springframework.stereotype.Service;

import com.boot.entity.Applys;
@Service("applysService")
public interface ApplysService {
	// 插入数据 调用applysDAO里的insertApplys配置
	public int insertApplys(Applys applys);

	// 更新数据 调用applysDAO里的updateApplys配置
	public int updateApplys(Applys applys);

	// 删除数据 调用applysDAO里的deleteApplys配置
	public int deleteApplys(String applysid);

	// 查询全部数据 调用applysDAO里的getAllApplys配置
	public List<Applys> getAllApplys();

	// 按照Applys类里面的字段名称精确查询 调用applysDAO里的getApplysByCond配置
	public List<Applys> getApplysByCond(Applys applys);

	// 按照Applys类里面的字段名称模糊查询 调用applysDAO里的getApplysByLike配置
	public List<Applys> getApplysByLike(Applys applys);

	// 按主键查询表返回单一的Applys实例 调用applysDAO里的getApplysById配置
	public Applys getApplysById(String applysid);

}

