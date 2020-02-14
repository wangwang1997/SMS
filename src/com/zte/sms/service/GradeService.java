package com.zte.sms.service;

import java.util.List;

import com.zte.sms.entity.Grade;

public interface GradeService {

	List<Grade> findAll();

	void removeById(int gid);

	Grade findById(int gid);

	void addGrade(Grade grade);

}
