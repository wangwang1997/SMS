package com.zte.sms.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.junit.Test;

import com.zte.sms.entity.Student;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.StudentService;

public class POITest {
	
	@Test
	public void excelExport() throws IOException{
		
		StudentService studentProxy = (StudentService) ObjectFactory.getObject("studentProxy");
		List<Student> students = studentProxy.findStudentsByPage();
//		for (Student student : students) {
//			System.out.println(student);
//		}
		
		ExcelUtil.exportStudent(students, new FileOutputStream(new File("e:/a.xls")));
		
		
	}
	
	

}
