package com.zte.sms.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.zte.sms.constant.Constant;
import com.zte.sms.entity.Course;
import com.zte.sms.entity.Grade;
import com.zte.sms.entity.Student;
import com.zte.sms.exception.StudentImportException;
import com.zte.sms.exception.StudentUsernameExistsException;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.CourseService;
import com.zte.sms.service.GradeService;
import com.zte.sms.service.StudentService;
import com.zte.sms.util.ExcelUtil;
import com.zte.sms.vo.PageInfo;
import com.zte.sms.vo.StudentVO;

public class StudentAction {

	public String findStudents(HttpServletRequest req, HttpServletResponse resp) {

		StudentService studentProxy = (StudentService) ObjectFactory.getObject("studentProxy");
		List<Student> students = studentProxy.findStudentsByPage();
		req.setAttribute("students", students);
		return "adminMain";
	}

	// ajax分页
	public void findStudentsByPage(HttpServletRequest req, HttpServletResponse resp) throws IOException {

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

		StudentService studentProxy = (StudentService) ObjectFactory.getObject("studentProxy");
		PageHelper.startPage(pageNo, pageSize);
		List<Student> students = studentProxy.findStudentsByPage();
		PageInfo<Student> pageInfo = new PageInfo<Student>(students);
		resp.setContentType(Constant.CONTENT_TYPE);
		resp.getWriter().print(JSON.toJSON(pageInfo));

	}

	// 学生管理主界面
	public String toStudentManage(HttpServletRequest req, HttpServletResponse resp) {

		// 获取页面中下拉列表的值
		GradeService gradeService = (GradeService) ObjectFactory.getObject("gradeService");
		CourseService courseService = (CourseService) ObjectFactory.getObject("courseService");
		List<Grade> gradeList = gradeService.findAll();
		List<Course> courseList = courseService.findAll();

		req.getSession().setAttribute("gradeList", gradeList);
		req.getSession().setAttribute("courseList", courseList);
		return "toStudentManage";

	}

	public void findByUsername(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType(Constant.CONTENT_TYPE);
		String username = req.getParameter("username");
		StudentService studentProxy = (StudentService) ObjectFactory.getObject("studentProxy");
		Map<String, Object> map = new HashedMap();
		try {

			Student student = studentProxy.findByUsername(username);
			map.put("valid", true);
			// map.put("message","用户名已经占用");//设置valid属性值，是false时，输出message属性所对应的值

		} catch (StudentUsernameExistsException e) {
			// TODO: handle exception
			map.put("valid", false);
			map.put("message", e.getMessage());
		}
		resp.getWriter().print(JSON.toJSON(map));

	}

	// 新增学员
	public String addStudent(HttpServletRequest req, HttpServletResponse resp) {

		// 获取表单中提交过来的值
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		int gender = Integer.parseInt(req.getParameter("gender"));
		int age = Integer.parseInt(req.getParameter("age"));
		int gid = Integer.parseInt(req.getParameter("gid"));
		int cid = Integer.parseInt(req.getParameter("cid"));

		// 调用proxy
		StudentService studentProxy = (StudentService) ObjectFactory.getObject("studentProxy");
		Student student = new Student(null, username, password, name, gender, age, gid, cid);

		studentProxy.addStudent(student);

		// 返回学生管理主界面
		return "toStudentManage";
	}

	// 显示修改学员页面
	public void findById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType(Constant.CONTENT_TYPE);

		StudentService studentProxy = (StudentService) ObjectFactory.getObject("studentProxy");
		// 获取传递过来的sid
		int sid = Integer.parseInt(req.getParameter("sid"));
		Student student = studentProxy.findById(sid);
		resp.getWriter().print(JSON.toJSON(student));

	}

	// 修改学员
	public String modifyStudent(HttpServletRequest req, HttpServletResponse resp) {

		// 获取表单中提交过来的值
		String username = req.getParameter("username");
		String name = req.getParameter("name");
		int sid = Integer.parseInt(req.getParameter("sid"));
		int gender = Integer.parseInt(req.getParameter("gender"));
		int age = Integer.parseInt(req.getParameter("age"));
		int gid = Integer.parseInt(req.getParameter("gid"));
		int cid = Integer.parseInt(req.getParameter("cid"));

		// 调用proxy
		StudentService studentProxy = (StudentService) ObjectFactory.getObject("studentProxy");
		Student student = new Student(sid, username, null, name, gender, age, gid, cid);

		studentProxy.modifyStudent(student);

		// 返回学生管理主界面
		return "toStudentManage";
	}

	// 删除学员
	public String deleteStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		int sid = Integer.parseInt(req.getParameter("sid"));

		StudentService studentProxy = (StudentService) ObjectFactory.getObject("studentProxy");

		try {
			studentProxy.removeById(sid);
			req.setAttribute("msg", "删除成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			req.setAttribute("msg", "删除失败");

		}
		// 返回学生管理主界面
		return "toStudentManage";
	}

	// 导出数据到excel
	public void exportExcel(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		// 设置响应类型为excel
		resp.setContentType("application/x-excel");
		// 设置处理方式为附件
		resp.setHeader("Content-Disposition", "attachment; filename=student.xls");
		StudentService studentProxy = (StudentService) ObjectFactory.getObject("studentProxy");
		List<Student> students = studentProxy.findStudentsByPage();
		// 将记录输出到xls文件
		ExcelUtil.exportStudent(students, resp.getOutputStream());

	}

	// 将excel文件中的数据导入到数据表中
	public String importExcel(HttpServletRequest req, HttpServletResponse resp) {

		String fileName = "student.xls";
		File f = new File("d:/students.xls");
		StudentService studentProxy = (StudentService) ObjectFactory.getObject("studentProxy");
		try {
			studentProxy.importExcel(fileName, f);
			req.setAttribute("msg", "导入成功");
		} catch (StudentImportException e) {
			// TODO: handle exception
			e.printStackTrace();
			req.setAttribute("msg", e.getMessage());
		}
		// 返回学生管理主界面
		return "toStudentManage";

	}

	//ajax按条件分页
	public void findByCondition(HttpServletRequest req, HttpServletResponse resp) throws IOException {

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
		//添加需要查询的条件
		//获取请求中提交过来的值
		String name = req.getParameter("name");
		String minAge = req.getParameter("minAge");
		String maxAge = req.getParameter("maxAge");
		String gender = req.getParameter("gender");
		String gid = req.getParameter("gid");
		String cid = req.getParameter("cid");
		StudentVO studentVO = new StudentVO();
		//根据传来的值，将值封装到VO中，进行查询
		if(!"".equals(name)){
			studentVO.setName(name);
		}
		if(!"".equals(minAge)){
			studentVO.setMinAge(Integer.parseInt(minAge));
		}
		if(!"".equals(maxAge)){
			studentVO.setMaxAge(Integer.parseInt(maxAge));
		}
		if(!"all".equals(gender)){
			studentVO.setGender(Integer.parseInt(gender));
		}
		if(!"all".equals(gid)){
			studentVO.setGid(Integer.parseInt(gid));
		}
		if(!"all".equals(cid)){
			studentVO.setCid(Integer.parseInt(cid));
		}


		StudentService studentProxy = (StudentService) ObjectFactory.getObject("studentProxy");
		PageHelper.startPage(pageNo, pageSize);

		//判断是否有无查询条件，如果不等于""或者all,调用不按条件查询的方法，否则调用按条件查询的方法
		List<Student> students=null;
		if("".equals(name)&&"".equals(minAge)&&"".equals(maxAge)&&"all".equals(gender)&&"all".equals(gid)&&"all".equals(cid)){

			students= studentProxy.findStudentsByPage();
		}
		else{
			students= studentProxy.findStudentsByCondition(studentVO);
		}
		PageInfo<Student> pageInfo = new PageInfo<Student>(students);
		resp.setContentType(Constant.CONTENT_TYPE);
		resp.getWriter().print(JSON.toJSON(pageInfo));

	}
	public String findMyBlog(HttpServletRequest req, HttpServletResponse resp){

		return "toMyBlog";
	}

	public String toStudentMain(HttpServletRequest req, HttpServletResponse resp){
		return "toMain";
	}
	public String toModifyInfo(HttpServletRequest req, HttpServletResponse resp){

		Student student = (Student) req.getSession().getAttribute("user");
		StudentService studentProxy = (StudentService) ObjectFactory.getObject("studentProxy");

		req.setAttribute("student", studentProxy.findById(student.getSid()));
		return "toModifyInfo";
	}
}
