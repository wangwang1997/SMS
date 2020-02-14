package com.zte.sms.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.zte.sms.dao.CourseDao;
import com.zte.sms.dao.GradeDao;
import com.zte.sms.dao.StudentDao;
import com.zte.sms.entity.Student;
import com.zte.sms.exception.StudentImportException;
import com.zte.sms.exception.StudentUsernameExistsException;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.StudentService;
import com.zte.sms.util.MD5;
import com.zte.sms.vo.StudentVO;

public class StudentServiceImpl implements StudentService {

	@Override
	public List<Student> findStudentsByPage() {
		// TODO Auto-generated method stub
		StudentDao  studentDao = (StudentDao)ObjectFactory.getObject("studentDao");
		List<Student> students = studentDao.selectStudentsByPage();
		return students;
	}

	@Override
	public Student findByUsername(String username) throws StudentUsernameExistsException {
		StudentDao  studentDao = (StudentDao)ObjectFactory.getObject("studentDao");
		Student student = studentDao.selectByUsername(username);
	    if(student!=null){
	    	throw new StudentUsernameExistsException("用户名("+username+")已经被占用啦");
	    }

		return student;
	}

	@Override
	public void addStudent(Student student) {
		// TODO Auto-generated method stub
		StudentDao  studentDao = (StudentDao)ObjectFactory.getObject("studentDao");
		studentDao.insertStudent(student);

	}

	@Override
	public Student findById(int sid) {
		// TODO Auto-generated method stub
		StudentDao  studentDao = (StudentDao)ObjectFactory.getObject("studentDao");
		Student student= studentDao.selectById(sid);
		return student;
	}

	@Override
	public void modifyStudent(Student student) {
		// TODO Auto-generated method stub
		StudentDao  studentDao = (StudentDao)ObjectFactory.getObject("studentDao");
		studentDao.updateStudent(student);
	}

	@Override
	public void removeById(int sid) {
		// TODO Auto-generated method stub
		StudentDao  studentDao = (StudentDao)ObjectFactory.getObject("studentDao");
		studentDao.deleteById(sid);

	}

	@Override
	public void importExcel(String fileName, File f) throws StudentImportException {
		// TODO Auto-generated method stub
		StudentDao  studentDao = (StudentDao)ObjectFactory.getObject("studentDao");
		GradeDao  gradeDao = (GradeDao)ObjectFactory.getObject("gradeDao");
		CourseDao  courseDao = (CourseDao)ObjectFactory.getObject("courseDao");

		try {
			//判断是否是excel文件
			if (fileName.matches("^.+\\.((?i)(xls)|(xlsx))$")) {
				//1:读取工作簿
				Workbook workbook = null;
				//根据后缀是xls还是xlsx调用不同的对象进行创建
				if (fileName.matches("^.+\\.((?i)(xls))$")) {
					workbook = new HSSFWorkbook(new FileInputStream(f));
				}
				else{
					workbook = new XSSFWorkbook(new FileInputStream(f));
				}
				//2:读取工作表
				Sheet sheet = workbook.getSheetAt(0);

				//3:读取行(从第三行开始读取)
				if(sheet.getPhysicalNumberOfRows()>2){
					Student student = null;
					for (int i = 2; i < sheet.getPhysicalNumberOfRows(); i++) {
						Row row = sheet.getRow(i);
						student  = new Student();
						//4:读取单元格
						String username=row.getCell(0).getStringCellValue();//第1列
						student.setUsername(username);
						student.setPassword(MD5.MD5Encode("123"));//获取123的md5密文为所有用户的初始密码
						student.setName(row.getCell(1).getStringCellValue());//第2列
						student.setGender("男".equals(row.getCell(2).getStringCellValue())?1:0);//第3列
						student.setAge((int)row.getCell(3).getNumericCellValue());//第4列
						student.setGid(gradeDao.selectIdByName(row.getCell(4).getStringCellValue()));//第5列
						student.setCid(courseDao.selectIdByName(row.getCell(5).getStringCellValue()));//第6列
						studentDao.insertStudent(student);


					}


				}
				workbook.close();

			}
		} catch (Exception e) {
			// TODO: handle exception
			throw new StudentImportException("数据导入失败:"+e.getMessage());
		}





	}

	@Override
	public List<Student> findStudentsByCondition(StudentVO studentVO) {
		StudentDao  studentDao = (StudentDao)ObjectFactory.getObject("studentDao");
		List<Student> students = studentDao.selectStudentsByCondition(studentVO);
		return students;
	}

	@Override
	public Student findUserByUsernameAndPass(String username, String password) {
		// TODO Auto-generated method stub
		StudentDao  studentDao = (StudentDao)ObjectFactory.getObject("studentDao");
		StudentVO studentVo = new StudentVO();
		studentVo.setUsername(username);
		studentVo.setPassword(password);
		Student student= studentDao.selectByNameAndPass(studentVo);
		return student;
	}

	@Override
	public Student findIdByUserName(String username) {
		// TODO Auto-generated method stub
		StudentDao  studentDao = (StudentDao)ObjectFactory.getObject("studentDao");
		Student student = studentDao.selectByUsername(username);

		return student;
	}

}
