package com.zte.sms.service;

import java.io.File;
import java.util.List;

import com.zte.sms.entity.Student;
import com.zte.sms.exception.StudentImportException;
import com.zte.sms.exception.StudentUsernameExistsException;
import com.zte.sms.vo.StudentVO;

public interface StudentService {

	//分页显示学生列表信息
		public List<Student> findStudentsByPage();

		public Student findByUsername(String username) throws StudentUsernameExistsException;

		public void addStudent(Student student);

		public Student findById(int sid);

		public void modifyStudent(Student student);

		public void removeById(int sid);

		public void importExcel(String fileName, File f) throws StudentImportException;

		public List<Student> findStudentsByCondition(StudentVO studentVO);

		public Student findUserByUsernameAndPass(String username, String password);

		public Student findIdByUserName(String username);



}
