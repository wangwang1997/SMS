package com.zte.sms.service.proxy;

import java.io.File;
import java.util.List;

import com.zte.sms.entity.Student;
import com.zte.sms.exception.StudentImportException;
import com.zte.sms.exception.StudentUsernameExistsException;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.StudentService;
import com.zte.sms.transaction.TransactionManager;
import com.zte.sms.vo.StudentVO;

public class StudentProxy implements StudentService{

	@Override
	public List<Student> findStudentsByPage() {
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		StudentService  studentService = (StudentService) ObjectFactory.getObject("studentService");
		List<Student> students=null;
		try {
			tran.beginTransaction();
			students=studentService.findStudentsByPage();
			tran.commit();

		} catch (Exception e) {
			//e.printStackTrace();
			tran.rollback();

		}



		return students;
	}

	@Override
	public Student findByUsername(String username) throws StudentUsernameExistsException {
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		StudentService  studentService = (StudentService) ObjectFactory.getObject("studentService");
		Student student=null;
		try {
			tran.beginTransaction();
			student=studentService.findByUsername(username);
			tran.commit();

		} catch (StudentUsernameExistsException e) {
			//e.printStackTrace();
			tran.rollback();
			//必须继续向上抛出StudentUsernameExistsException,在action中去捕获该异常
			throw e;

		}



		return student;
	}

	@Override
	public void addStudent(Student student) {
		// TODO Auto-generated method stub
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		StudentService  studentService = (StudentService) ObjectFactory.getObject("studentService");
		try {
			tran.beginTransaction();
			studentService.addStudent(student);
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();

		}
	}

	@Override
	public Student findById(int sid) {
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		StudentService  studentService = (StudentService) ObjectFactory.getObject("studentService");
		Student student=null;
		try {
			tran.beginTransaction();
			student=studentService.findById(sid);
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();

		}



		return student;
	}

	@Override
	public void modifyStudent(Student student) {
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		StudentService  studentService = (StudentService) ObjectFactory.getObject("studentService");
		try {
			tran.beginTransaction();
			studentService.modifyStudent(student);
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();

		}
	}

	@Override
	public void removeById(int sid) {
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		StudentService  studentService = (StudentService) ObjectFactory.getObject("studentService");
		try {
			tran.beginTransaction();
			studentService.removeById(sid);
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			//需要向外抛出异常，将异常交给action处理
			throw new RuntimeException("删除异常");

		}
	}

	@Override
	public void importExcel(String fileName, File f) throws StudentImportException {
		// TODO Auto-generated method stub
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		StudentService  studentService = (StudentService) ObjectFactory.getObject("studentService");
		try {
			tran.beginTransaction();
			studentService.importExcel(fileName, f);
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			//需要向外抛出异常，将异常交给action处理
			throw new StudentImportException("导入数据失败");

		}

	}

	@Override
	public List<Student> findStudentsByCondition(StudentVO studentVO) {
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		StudentService  studentService = (StudentService) ObjectFactory.getObject("studentService");
		List<Student> students=null;
		try {
			tran.beginTransaction();
			students=studentService.findStudentsByCondition(studentVO);
			tran.commit();

		} catch (Exception e) {
			//e.printStackTrace();
			tran.rollback();

		}



		return students;
	}

	@Override
	public Student findUserByUsernameAndPass(String username, String password) {
		// TODO Auto-generated method stub
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		StudentService  studentService = (StudentService) ObjectFactory.getObject("studentService");
		Student student=null;
		try {
			tran.beginTransaction();
			student=studentService.findUserByUsernameAndPass(username,password);
			tran.commit();

		} catch (Exception e) {
			//e.printStackTrace();
			tran.rollback();

		}

		return student;
	}

	@Override
	public Student findIdByUserName(String username) {
		// TODO Auto-generated method stub
		TransactionManager tran= (TransactionManager) ObjectFactory.getObject("transaction");
		StudentService  studentService = (StudentService) ObjectFactory.getObject("studentService");
		Student student = null;
		try {
			tran.beginTransaction();
			student=studentService.findIdByUserName(username);
			tran.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();

		}

		return student;
	}



}
