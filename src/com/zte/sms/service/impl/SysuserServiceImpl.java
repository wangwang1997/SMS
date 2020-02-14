package com.zte.sms.service.impl;

import java.util.List;

import com.zte.sms.dao.SysuserDao;
import com.zte.sms.entity.Student;
import com.zte.sms.entity.Sysuser;
import com.zte.sms.exception.OldPassWrongException;
import com.zte.sms.exception.UserOrPassWrongException;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.SysuserService;
import com.zte.sms.vo.SysuserVO;

public class SysuserServiceImpl implements SysuserService{

	@Override
	public Sysuser findUserByUsernameAndPass(SysuserVO sysuserVO) throws UserOrPassWrongException {
		
		SysuserDao  sysuserDao = (SysuserDao)ObjectFactory.getObject("sysuserDao");
		
		Sysuser sysuser = sysuserDao.selectUserByUsernameAndPass(sysuserVO);
		if(sysuser==null){
			throw new UserOrPassWrongException("用户名或者密码错误");
		}
		
		
		return sysuser;
	}

	@Override
	public void modifyPassById(SysuserVO sysuserVO) {
		// TODO Auto-generated method stub
		SysuserDao  sysuserDao = (SysuserDao)ObjectFactory.getObject("sysuserDao");
		
		sysuserDao.updatePassById(sysuserVO);
	}

	@Override
	public Sysuser findUserByIdAndPass(SysuserVO sysuserVO) throws OldPassWrongException {
		
		SysuserDao  sysuserDao = (SysuserDao)ObjectFactory.getObject("sysuserDao");
		
		Sysuser sysuser = sysuserDao.selectUserByIdAndPass(sysuserVO);
		if(sysuser==null){
			throw new OldPassWrongException("用户名或者密码错误");
		}
		
		
		return sysuser;
	}

	

}
