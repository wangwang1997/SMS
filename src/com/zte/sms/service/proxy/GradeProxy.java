package com.zte.sms.service.proxy;

import java.util.List;

import com.zte.sms.entity.Grade;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.GradeService;
import com.zte.sms.transaction.TransactionManager;

public class GradeProxy implements GradeService {

	@Override
	public List<Grade> findAll() {
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		GradeService  gradeService = (GradeService) ObjectFactory.getObject("gradeService");
		List<Grade> grades=null;
		try {
			tran.beginTransaction();
			grades=gradeService.findAll();
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();

		}
		return grades;
	}

	@Override
	public void removeById(int gid) {
		// TODO Auto-generated method stub
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		GradeService  gradeService = (GradeService) ObjectFactory.getObject("gradeService");
		try {
			tran.beginTransaction();
			gradeService.removeById(gid);
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			//需要向外抛出异常，将异常交给action处理
			throw new RuntimeException("删除异常");

		}

	}

	@Override
	public Grade findById(int gid) {
		// TODO Auto-generated method stub
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		GradeService  gradeService = (GradeService) ObjectFactory.getObject("gradeService");
		Grade grade=null;
		try {
			tran.beginTransaction();
			grade=gradeService.findById(gid);
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();

		}



		return grade;
	}

	@Override
	public void addGrade(Grade grade) {
		// TODO Auto-generated method stub

		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		GradeService  gradeService = (GradeService) ObjectFactory.getObject("gradeService");
		try {
			tran.beginTransaction();
			gradeService.addGrade(grade);
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();

		}
	}

}
