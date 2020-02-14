package com.zte.sms.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.zte.sms.constant.Constant;
import com.zte.sms.entity.Course;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.CourseService;
import com.zte.sms.vo.PageInfo;

public class CourseAction {

	public String toCourseManage(HttpServletRequest req, HttpServletResponse resp) {

		CourseService courseProxy = (CourseService) ObjectFactory.getObject("courseProxy");
		List<Course> courses = courseProxy.findAll();
		req.setAttribute("courses", courses);
		return "toCourseManage";
	}
	// ajax分页
	public void findCoursesByPage(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		String pageNoStr = req.getParameter("pageNo");
		String pageSizeStr = req.getParameter("pageSize");
		int pageNo = 0;
		int pageSize = 0;
		if (pageNoStr == null) {
			pageNo = 1;
		} else {
			pageNo = Integer.parseInt(pageNoStr);
		}

		if (pageSizeStr == null) {
			pageSize = 2;
		} else {
			pageSize = Integer.parseInt(pageSizeStr);
		}

		CourseService courseProxy = (CourseService) ObjectFactory.getObject("courseProxy");
		PageHelper.startPage(pageNo, pageSize);
		List<Course> courses = courseProxy.findAll();
		PageInfo<Course> pageInfo = new PageInfo<Course>(courses);
		resp.setContentType(Constant.CONTENT_TYPE);
		resp.getWriter().print(JSON.toJSON(pageInfo));

	}
}