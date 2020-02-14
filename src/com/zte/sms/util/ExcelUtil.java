package com.zte.sms.util;

import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;

import com.zte.sms.entity.Student;

/**
 * excel工具类，用于导入导出excel数据
 * 需要使用到：poi-version-yyyymmdd.jar(解析xls格式),poi-ooxml-version-yyyymmdd.jar(解析xlsx格式)
 * @author hellboy
 *
 */
public class ExcelUtil {
	//将一个list集合数据导出为一个流文件
	public static void exportStudent(List<Student> students,OutputStream out){
		
		
		try {
			//1:创建一个工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			//2:创建一个工作表(sheet)
			HSSFSheet sheet = workbook.createSheet("学生信息表");
			
			//设置行高
			sheet.setDefaultRowHeightInPoints(20);
			
			//设置列宽
			sheet.setDefaultColumnWidth(12);
			//合并单元格
			//将第一行的第一到第七列合并
			CellRangeAddress cellRangeAddress= new CellRangeAddress(0, 0, 0, 6);
			sheet.addMergedRegion(cellRangeAddress);
			
			
			
			
			//3:创建行
			//a:创建标题行，并设置标题
			HSSFRow rowTitle = sheet.createRow(0);
			//设置行高40px
			rowTitle.setHeightInPoints(40);
			//在该行上创建第一个单元格
			HSSFCell createCell = rowTitle.createCell(0);
			//设置样式
			createCell.setCellStyle(createCellStyle(workbook,HSSFColor.RED.index,(short)18));
			//设置内容
			createCell.setCellValue("学生信息表");
			
			
			//b:创建列头行，并设置列头信息
			HSSFRow rowHead = sheet.createRow(1);
			String[] titles=  {"序号","用户名","姓名","性别","年龄","班级","课程"};
			for (int i = 0; i < titles.length; i++) {
				//在行上创建每一个单元格
				HSSFCell cellHead = rowHead.createCell(i);
				//设置样式
				cellHead.setCellStyle(createCellStyle(workbook, HSSFColor.BLACK.index, (short)14));
				//设置值
				cellHead.setCellValue(titles[i]);
			}
			
			
			//c:遍历学生集合，创建普通行
			if(students!=null){
				for (int i = 0; i < students.size(); i++) {
					Student student = students.get(i);
					//创建i+2行
					HSSFRow row = sheet.createRow(i+2);
					HSSFCell cell0 = row.createCell(0);
					cell0.setCellValue(i+1+"");
					HSSFCell cell1 = row.createCell(1);
					cell1.setCellValue(student.getUsername());
					HSSFCell cell2 = row.createCell(2);
					cell2.setCellValue(student.getName());
					HSSFCell cell3 = row.createCell(3);
					cell3.setCellValue(student.getGender()==1?"男":"女");
					HSSFCell cell4 = row.createCell(4);
					cell4.setCellValue(student.getAge());
					HSSFCell cell5 = row.createCell(5);
					cell5.setCellValue(student.getGrade().getGname());
					HSSFCell cell6 = row.createCell(6);
					cell6.setCellValue(student.getCourse().getCname());
					
				}
			}
			
			//输出到硬盘
			workbook.write(out);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		
		
		
	}

	private static HSSFCellStyle createCellStyle(HSSFWorkbook workbook, short color, short fontSize) {
		// TODO Auto-generated method stub
		//创建单元格样式
		HSSFCellStyle cellStyle = workbook.createCellStyle();
		//水平垂直居中
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);//水平居中
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//垂直居中
		
		//创建字体
		HSSFFont font = workbook.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setColor(color);//字体颜色
		font.setFontHeightInPoints(fontSize);//字体大小
		
		cellStyle.setFont(font);
		return cellStyle;
	}

	

}
