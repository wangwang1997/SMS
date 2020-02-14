package com.zte.sms.service.impl;

import java.util.List;

import com.zte.sms.dao.GradeDao;
import com.zte.sms.entity.Grade;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.GradeService;

public class GradeServcieImpl implements GradeService {

	@Override
	public List<Grade> findAll() {
		// TODO Auto-generated method stub
		GradeDao gradeDao = (GradeDao)ObjectFactory.getObject("gradeDao");
		List<Grade> grades= gradeDao.selectAll();
		return grades;
	}

	@Override
	public void removeById(int gid) {
		// TODO Auto-generated method stub
		GradeDao  gradeDao = (GradeDao)ObjectFactory.getObject("gradeDao");
		gradeDao.deleteById(gid);
	}

	@Override
	public Grade findById(int gid) {
		// TODO Auto-generated method stub
		GradeDao  gradeDao = (GradeDao)ObjectFactory.getObject("gradeDao");
		Grade grade= gradeDao.selectById(gid);
		return grade;
	}

	@Override
	public void addGrade(Grade grade) {
		// TODO Auto-generated method stub
		GradeDao  gradeDao = (GradeDao)ObjectFactory.getObject("gradeDao");
		gradeDao.insertGrade(grade);

	}

}
