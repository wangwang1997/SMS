package com.zte.sms.service;

import java.util.List;

import com.zte.sms.entity.Blog;

public interface BlogService {

	List<Blog> findAll();

	void removeById(int bid);

	List<Blog> findBlogsBysId(int sid);

	void addBlog(Blog blog);

	Blog findBlogById(int bid);

}
