package com.zte.sms.dao;

import java.util.List;

import com.zte.sms.entity.Blog;

public interface BlogDao {

	List<Blog> selectAll();

	void deleteById(int bid);

	List<Blog> selectBlogsById(int sid);

	void insert(Blog blog);

	Blog selectById(int bid);

}
