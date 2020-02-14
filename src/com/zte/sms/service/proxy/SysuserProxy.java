package com.zte.sms.service.proxy;

import java.util.List;

import com.zte.sms.dao.SysuserDao;
import com.zte.sms.entity.Student;
import com.zte.sms.entity.Sysuser;
import com.zte.sms.exception.DataAccessException;
import com.zte.sms.exception.OldPassWrongException;
import com.zte.sms.exception.ServiceException;
import com.zte.sms.exception.UserOrPassWrongException;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.SysuserService;
import com.zte.sms.transaction.TransactionManager;
import com.zte.sms.vo.SysuserVO;

public class SysuserProxy implements SysuserService{

	@Override
	public Sysuser findUserByUsernameAndPass(SysuserVO sysuserVO) throws UserOrPassWrongException {
		
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		SysuserService  sysuserService = (SysuserService) ObjectFactory.getObject("sysuserService");
		Sysuser sysuser=null;
		try {
			tran.beginTransaction();
			sysuser=sysuserService.findUserByUsernameAndPass(sysuserVO);
			tran.commit();
			
		} catch (Exception e) {
			//e.printStackTrace();
			tran.rollback();
			throw e;
		}
		
		
		
		return sysuser;
	}

	@Override
	public void modifyPassById(SysuserVO sysuserVO) {
		// TODO Auto-generated method stub
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		SysuserService  sysuserService = (SysuserService) ObjectFactory.getObject("sysuserService");
		try {
			tran.beginTransaction();
			sysuserService.modifyPassById(sysuserVO);
			tran.commit();
			
		} catch (DataAccessException e) {
			//e.printStackTrace();
			tran.rollback();
			throw new ServiceException(e.getMessage());
		}
	}

	@Override
	public Sysuser findUserByIdAndPass(SysuserVO sysuserVO) throws OldPassWrongException {
		// TODO Auto-generated method stub
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		SysuserService  sysuserService = (SysuserService) ObjectFactory.getObject("sysuserService");
		Sysuser sysuser=null;
		try {
			tran.beginTransaction();
			sysuser=sysuserService.findUserByIdAndPass(sysuserVO);
			tran.commit();
			
		} catch (DataAccessException  e) {
			//e.printStackTrace();
			tran.rollback();
			throw new ServiceException(e.getMessage());
		}
		catch (OldPassWrongException e) {
			// TODO: handle exception
			tran.rollback();
			throw e;
		}
		
		
		
		return sysuser;
	}

	
}
