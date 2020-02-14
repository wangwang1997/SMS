package com.zte.sms.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.zte.sms.constant.Constant;
import com.zte.sms.entity.Blog;
import com.zte.sms.entity.Student;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.BlogService;
import com.zte.sms.vo.PageInfo;

public class BlogAction {

	public String toBlogManage(HttpServletRequest req, HttpServletResponse resp) {

		BlogService blogProxy = (BlogService) ObjectFactory.getObject("blogProxy");
		List<Blog> blogs = blogProxy.findAll();
		req.setAttribute("blogs", blogs);
		return "toBlogManage";
	}

	public String CreateMyBlog(HttpServletRequest req, HttpServletResponse resp){

		return "NewBlog";
	}
	// ajax分页
		public void findBlogsByPage(HttpServletRequest req, HttpServletResponse resp) throws IOException {

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

			BlogService blogProxy = (BlogService) ObjectFactory.getObject("blogProxy");
			PageHelper.startPage(pageNo, pageSize);
			List<Blog> blogs = blogProxy.findAll();
			PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogs);
			resp.setContentType(Constant.CONTENT_TYPE);
			resp.getWriter().print(JSON.toJSON(pageInfo));

		}

		public String deleteBlog(HttpServletRequest req, HttpServletResponse resp) throws IOException {

			int bid = Integer.parseInt(req.getParameter("bid"));

			System.out.println(bid);
			BlogService blogProxy = (BlogService) ObjectFactory.getObject("blogProxy");

			try {
				blogProxy.removeById(bid);
				req.setAttribute("msg", "删除成功");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				req.setAttribute("msg", "删除失败");

			}
			// 返回学生管理主界面
			return "toBlogManage";
		}
		public void findBlog(HttpServletRequest req, HttpServletResponse resp) throws IOException{

			Student student = (Student)req.getSession().getAttribute("user");
			//System.out.println(student.getUsername());
			BlogService blogProxy = (BlogService) ObjectFactory.getObject("blogProxy");
			//System.out.println(student.getUsername());


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

			PageHelper.startPage(pageNo, pageSize);
			List<Blog> blogs = blogProxy.findBlogsBysId(student.getSid());
			PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogs);
			resp.setContentType(Constant.CONTENT_TYPE);
			resp.getWriter().print(JSON.toJSON(pageInfo));
		}
		public String addMyBlog(HttpServletRequest req, HttpServletResponse resp){
			// 获取表单中提交过来的值
			String title = req.getParameter("title");
			String content = req.getParameter("content");

			// 调用proxy
			BlogService blogProxy = (BlogService) ObjectFactory.getObject("blogProxy");
			Student student = (Student) req.getSession().getAttribute("user");
			Blog blog = new Blog();
			blog.setTitle(title);
			blog.setContent(content);
			blog.setCreateDate(new Date());
			blog.setStudent(student);
			blogProxy.addBlog(blog);

			// 返回学生管理主界面
			return "toMyBlog";
		}
		public String findBlogDetail(HttpServletRequest req, HttpServletResponse resp){

			int bid = Integer.parseInt(req.getParameter("bid"));
			BlogService blogProxy = (BlogService) ObjectFactory.getObject("blogProxy");

			Blog blog = blogProxy.findBlogById(bid);

			req.setAttribute("blog", blog);

			return "toDetail";
		}
}