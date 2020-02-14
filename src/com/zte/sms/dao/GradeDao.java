package com.zte.sms.dao;

import java.util.List;

import com.zte.sms.entity.Grade;

public interface GradeDao {

	List<Grade> selectAll();

	Integer selectIdByName(String stringCellValue);

	void deleteById(int gid);

	Grade selectById(int gid);

	void insertGrade(Grade grade);

}
