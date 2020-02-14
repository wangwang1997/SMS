package com.zte.sms.service.impl;

import java.util.List;

import com.zte.sms.dao.BlogDao;
import com.zte.sms.entity.Blog;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.BlogService;

public class BlogServiceImpl implements BlogService{

	@Override
	public List<Blog> findAll() {
		// TODO Auto-generated method stub
		BlogDao blogDao  = (BlogDao)ObjectFactory.getObject("blogDao");
		List<Blog> blogs= blogDao.selectAll();
		return blogs;
	}

	@Override
	public void removeById(int bid) {
		// TODO Auto-generated method stub
		BlogDao  blogDao = (BlogDao)ObjectFactory.getObject("blogDao");
		blogDao.deleteById(bid);

	}

	@Override
	public List<Blog> findBlogsBysId(int sid) {
		// TODO Auto-generated method stub
		BlogDao blogDao  = (BlogDao)ObjectFactory.getObject("blogDao");
		List<Blog> blogs= blogDao.selectBlogsById(sid);
		return blogs;
	}

	@Override
	public void addBlog(Blog blog) {
		// TODO Auto-generated method stub
		BlogDao  blogDao = (BlogDao)ObjectFactory.getObject("blogDao");
		blogDao.insert(blog);
	}

	@Override
	public Blog findBlogById(int bid) {
		// TODO Auto-generated method stub
		BlogDao blogDao  = (BlogDao)ObjectFactory.getObject("blogDao");
		Blog blog= blogDao.selectById(bid);
		return blog;
	}

}
