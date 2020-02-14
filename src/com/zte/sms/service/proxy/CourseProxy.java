package com.zte.sms.service.proxy;

import java.util.List;
import com.zte.sms.entity.Course;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.CourseService;
import com.zte.sms.transaction.TransactionManager;

public class CourseProxy implements CourseService{

	@Override
	public List<Course> findAll() {
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		CourseService  courseService = (CourseService) ObjectFactory.getObject("courseService");
		List<Course> courses=null;
		try {
			tran.beginTransaction();
			courses=courseService.findAll();
			tran.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			
		}
		
		
		
		return courses;
	}

}
