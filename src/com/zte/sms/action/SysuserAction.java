package com.zte.sms.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zte.sms.entity.Student;
import com.zte.sms.entity.Sysuser;
import com.zte.sms.exception.UserOrPassWrongException;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.SysuserService;
import com.zte.sms.service.proxy.StudentProxy;
import com.zte.sms.service.proxy.SysuserProxy;
import com.zte.sms.vo.SysuserVO;

public class SysuserAction {

	public String  login(HttpServletRequest req,HttpServletResponse resp){

		SysuserProxy sysuserProxy = (SysuserProxy) ObjectFactory.getObject("sysuserProxy");
		StudentProxy studentProxy = (StudentProxy) ObjectFactory.getObject("studentProxy");
		//获取表单中传递过来的username,password
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String state = req.getParameter("state");

		SysuserVO sysuserVO = new SysuserVO();
		sysuserVO.setUsername(username);
		sysuserVO.setPassword(password);
		if("1".equals(state)){
			Sysuser sysuser=null;
			try {
				sysuser=sysuserProxy.findUserByUsernameAndPass(sysuserVO);
				req.getSession().setAttribute("user",sysuser);
			} catch (UserOrPassWrongException e) {
				// TODO: handle exception
				//e.printStackTrace();
				req.getSession().setAttribute("error",e.getMessage());
				return "fail";

			}
			return "admin";
		}
		else if("0".equals(state)){
			Student student=null;
			try{
				student=studentProxy.findUserByUsernameAndPass(username,password);
				req.getSession().setAttribute("user",student);
			}catch(Exception e){
				// TODO: handle exception
				//e.printStackTrace();
				req.getSession().setAttribute("error",e.getMessage());
				return "fail";
			}
			return "student";
		}

		return "fail";


	}

	public void  modifyPwd(HttpServletRequest req,HttpServletResponse resp) throws IOException{

		//获取提交过来的值
		String id = req.getParameter("id");
		String oldPass = req.getParameter("oldPass");
		String newPass = req.getParameter("newPass");

		SysuserService sysuserProxy  = (SysuserService) ObjectFactory.getObject("sysuserProxy");
		SysuserVO sysuserVO = new SysuserVO();
		sysuserVO.setId(Integer.parseInt(id));
		sysuserVO.setPassword(oldPass);
		sysuserVO.setNewPass(newPass);

		try {
			sysuserProxy.findUserByIdAndPass(sysuserVO);
			sysuserProxy.modifyPassById(sysuserVO);
			resp.getWriter().print("success");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			resp.getWriter().print("fail");
		}



	}

	//退出系统
	public void  logOut(HttpServletRequest req,HttpServletResponse resp){

		//清空session中的当前账号
		req.getSession().removeAttribute("user");

	}


}
