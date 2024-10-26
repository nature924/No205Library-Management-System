package com.boot.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.ApplysDAO;
import com.boot.entity.Applys;
import com.boot.service.ApplysService;

@Service("applysService")
public class ApplysServiceImpl implements ApplysService {
	@Autowired
	private ApplysDAO applysDAO;
	@Override // 继承接口的新增 返回值0(失败),1(成功)
	public int insertApplys(Applys applys) {
		return this.applysDAO.insertApplys(applys);
	}

	@Override // 继承接口的更新 返回值0(失败),1(成功)
	public int updateApplys(Applys applys) {
		return this.applysDAO.updateApplys(applys);
	}

	@Override // 继承接口的删除 返回值0(失败),1(成功)
	public int deleteApplys(String applysid) {
		return this.applysDAO.deleteApplys(applysid);
	}

	@Override // 继承接口的查询全部
	public List<Applys> getAllApplys() {
		return this.applysDAO.getAllApplys();
	}

	@Override // 继承接口的按条件精确查询
	public List<Applys> getApplysByCond(Applys applys) {
		return this.applysDAO.getApplysByCond(applys);
	}

	@Override // 继承接口的按条件模糊查询
	public List<Applys> getApplysByLike(Applys applys) {
		return this.applysDAO.getApplysByLike(applys);
	}

	@Override // 继承接口的按主键查询 返回Entity实例
	public Applys getApplysById(String applysid) {
		return this.applysDAO.getApplysById(applysid);
	}

}

