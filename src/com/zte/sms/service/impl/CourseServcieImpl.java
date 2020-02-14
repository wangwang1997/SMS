package com.zte.sms.service.impl;

import java.util.List;

import com.zte.sms.dao.CourseDao;
import com.zte.sms.entity.Course;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.CourseService;

public class CourseServcieImpl implements CourseService{

	@Override
	public List<Course> findAll() {
		// TODO Auto-generated method stub
		CourseDao courseDao  = (CourseDao)ObjectFactory.getObject("courseDao");
		List<Course> courses= courseDao.selectAll();
		return courses;
	}

}
