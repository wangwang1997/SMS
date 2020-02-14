package com.zte.sms.service.proxy;

import java.util.List;

import com.zte.sms.entity.Blog;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.BlogService;
import com.zte.sms.transaction.TransactionManager;

public class BlogProxy implements BlogService{

	@Override
	public List<Blog> findAll() {
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		BlogService  BlogService = (BlogService) ObjectFactory.getObject("blogService");
		List<Blog> blogs=null;
		try {
			tran.beginTransaction();
			blogs=BlogService.findAll();
			tran.commit();

		} catch (Exception e) {
			//e.printStackTrace();
			tran.rollback();
		}
		return blogs;
	}

	@Override
	public void removeById(int bid) {
		// TODO Auto-generated method stub
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		BlogService  blogService = (BlogService) ObjectFactory.getObject("blogService");
		try {
			tran.beginTransaction();
			blogService.removeById(bid);
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			//需要向外抛出异常，将异常交给action处理
			throw new RuntimeException("删除异常");

		}
	}

	@Override
	public List<Blog> findBlogsBysId(int sid) {
		// TODO Auto-generated method stub
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		BlogService  BlogService = (BlogService) ObjectFactory.getObject("blogService");
		List<Blog> blogs=null;
		try {
			tran.beginTransaction();
			blogs=BlogService.findBlogsBysId(sid);
			tran.commit();

		} catch (Exception e) {
			//e.printStackTrace();
			tran.rollback();
		}
		return blogs;
	}

	@Override
	public void addBlog(Blog blog) {
		// TODO Auto-generated method stub

		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		BlogService  blogService = (BlogService) ObjectFactory.getObject("blogService");
		try {
			tran.beginTransaction();
			blogService.addBlog(blog);
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			//需要向外抛出异常，将异常交给action处理
			throw new RuntimeException("添加异常");

		}
	}

	@Override
	public Blog findBlogById(int bid) {
		// TODO Auto-generated method stub
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		BlogService  BlogService = (BlogService) ObjectFactory.getObject("blogService");
		Blog blog=null;
		try {
			tran.beginTransaction();
			blog=BlogService.findBlogById(bid);
			tran.commit();

		} catch (Exception e) {
			//e.printStackTrace();
			tran.rollback();
		}
		return blog;
	}

}
