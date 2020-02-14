package com.zte.sms.service;

import java.util.List;

import com.zte.sms.entity.Student;
import com.zte.sms.entity.Sysuser;
import com.zte.sms.exception.OldPassWrongException;
import com.zte.sms.exception.UserOrPassWrongException;
import com.zte.sms.vo.SysuserVO;

public interface SysuserService {
	
	//根据用户名和密码查询记录
	public Sysuser findUserByUsernameAndPass(SysuserVO sysuserVO) throws UserOrPassWrongException;
	
	
    //根据新密码更新用户密码
	public void modifyPassById(SysuserVO sysuserVO);


	//根据用户id和老密码查询用户
	public Sysuser findUserByIdAndPass(SysuserVO sysuserVO) throws OldPassWrongException;
	
	
}
