package com.zte.sms.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.zte.sms.constant.Constant;
import com.zte.sms.entity.Grade;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.GradeService;
import com.zte.sms.vo.PageInfo;

public class GradeAction {

	public String toGradeManage(HttpServletRequest req, HttpServletResponse resp) {

		GradeService gradeProxy = (GradeService) ObjectFactory.getObject("gradeProxy");
		List<Grade> grades = gradeProxy.findAll();
		req.setAttribute("grades", grades);
		return "toGradeManage";
	}

	// ajax分页
	public void findGradesByPage(HttpServletRequest req, HttpServletResponse resp) throws IOException {

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

		GradeService gradeProxy = (GradeService) ObjectFactory.getObject("gradeProxy");
		PageHelper.startPage(pageNo, pageSize);
		List<Grade> grades = gradeProxy.findAll();
		PageInfo<Grade> pageInfo = new PageInfo<Grade>(grades);
		resp.setContentType(Constant.CONTENT_TYPE);
		resp.getWriter().print(JSON.toJSON(pageInfo));

	}
	public String deleteGrade(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		int gid = Integer.parseInt(req.getParameter("gid"));

		GradeService gradeProxy = (GradeService) ObjectFactory.getObject("gradeProxy");

		try {
			gradeProxy.removeById(gid);
			req.setAttribute("msg", "删除成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			req.setAttribute("msg", "删除失败");

		}
		// 返回学生管理主界面
		return "toGradeManage";
	}


		public void findById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			resp.setContentType(Constant.CONTENT_TYPE);

			GradeService gradeProxy = (GradeService) ObjectFactory.getObject("gradeProxy");
			// 获取传递过来的gid
			int gid = Integer.parseInt(req.getParameter("gid"));
			Grade grade = gradeProxy.findById(gid);
			resp.getWriter().print(JSON.toJSON(grade));

		}
		public String addGrade(HttpServletRequest req, HttpServletResponse resp) {

			// 获取表单中提交过来的值
			String gname = req.getParameter("gname");
			String gdesc = req.getParameter("gdesc");
			int state = 1;//默认为启用

			// 调用proxy
			GradeService gradeProxy = (GradeService) ObjectFactory.getObject("gradeProxy");
			Grade grade = new Grade(null,gname,gdesc,1);

			gradeProxy.addGrade(grade);

			// 返回学生管理主界面
			return "toGradeManage";
		}
}