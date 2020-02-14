package com.zte.sms.dao;

import java.util.List;

import com.zte.sms.entity.Student;
import com.zte.sms.entity.Sysuser;
import com.zte.sms.vo.SysuserVO;

public interface SysuserDao {
	
	//根据用户名和密码查询记录
	public Sysuser selectUserByUsernameAndPass(SysuserVO sysuserVO);

	//根据id修改密码
	public void updatePassById(SysuserVO sysuserVO);

	//根据id和老密码查询用户
	public Sysuser selectUserByIdAndPass(SysuserVO sysuserVO);

	

	
	

}
