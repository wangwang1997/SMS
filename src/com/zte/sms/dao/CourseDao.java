package com.zte.sms.dao;

import java.util.List;

import com.zte.sms.entity.Course;

public interface CourseDao {

	List<Course> selectAll();

	Integer selectIdByName(String stringCellValue);

}
