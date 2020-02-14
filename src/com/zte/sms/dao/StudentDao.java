package com.zte.sms.dao;

import java.util.List;

import com.zte.sms.entity.Student;
import com.zte.sms.vo.StudentVO;

public interface StudentDao {
	//获取学生分页列表
	public List<Student> selectStudentsByPage();

	public Student selectByUsername(String username);

	public void insertStudent(Student student);

	public Student selectById(int sid);

	public void updateStudent(Student student);

	public void deleteById(int sid);

	public List<Student> selectStudentsByCondition(StudentVO studentVO);

	public Student selectByNameAndPass(StudentVO studentVo);
}
