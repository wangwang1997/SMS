<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>学生管理系统</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" type="text/css"></link>
    <link rel="stylesheet" href="../../css/mycss.css" type="text/css"></link>
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../bootstrap/js/bootstrap.min.js"></script>
  </head>
  <%request.setAttribute("index",0); %>
  <body>
    <jsp:include page="top.jsp"/>
    <div class="container margin-top-10">
    	<div class="col-sm-8">
    		<div class="panel panel-default">
			  <div class="panel-body">
				 <form action="WEB-INF/studentPage/studentMain" class="form-horizontal" method="post">
				     <div class="form-group">
				       <label class="col-sm-2 control-label">学生编号：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text" value="${student.sid}" readonly="readonly">
				       </div>
				       <label class="col-sm-4 control-label error-info" style="text-align:left;">*不可修改</label>
				    </div>
				     <div class="form-group">
				       <label class="col-sm-2 control-label">登录账户：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text" value="${student.username }" readonly="readonly">
				       </div>
				       <label class="col-sm-4 control-label error-info" style="text-align:left;">*不可修改</label>
				    </div>
				     <div class="form-group">
				       <label class="col-sm-2 control-label">学生姓名：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text" value="${student.name }">
				       </div>
				       <label class="col-sm-4 control-label error-info" style="text-align:left;">*不能为空</label>
				    </div>
				     <div class="form-group">
				       <label class="col-sm-2 control-label">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text" value="${student.age }">
				       </div>
				       <label class="col-sm-4 control-label error-info" style="text-align:left;">*不能为空</label>
				    </div>
				     <div class="form-group">
				       <label class="col-sm-2 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
				       <div class="col-sm-6">
					       <div class="radio">
							  <label>
							  	<c:if test="${student.gender == 1 }">
							    <input type="radio" value="1" name="sex" checked="checked"> 男
							    </c:if>
							    <c:if test="${student.gender == 0 }">
							    <input type="radio" value="1" name="sex"> 男
							    </c:if>
							  </label>
							  &nbsp;&nbsp;&nbsp;
							  <label>
							    <c:if test="${student.gender == 1 }">
							    <input type="radio" value="0" name="sex" > 女
							    </c:if>
							    <c:if test="${student.gender == 0 }">
							    <input type="radio" value="0" name="sex" checked="checked"> 女
							    </c:if>
							  </label>
							</div>
						</div>
				       <label class="col-sm-4 control-label error-info" style="text-align:left;"></label>
				    </div>
				    <div class="form-group">
				       <label class="col-sm-2 control-label">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text" value="${student.grade.gname}" readonly="readonly">
				       </div>
				       <label class="col-sm-4 control-label error-info" style="text-align:left;">*不可修改</label>
				    </div>
				    <div class="form-group">
				       <label class="col-sm-2 control-label">课&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;程：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text" value="${student.course.cname}" readonly="readonly">
				       </div>
				       <label class="col-sm-4 control-label error-info" style="text-align:left;">*不可修改</label>
				    </div>
				    <div class="form-group">
				       <div class="col-sm-6  col-sm-offset-2">
				       	 <div class="col-sm-6">
					         <button type="reset" class="btn btn-primary btn-block">重&nbsp;&nbsp;置</button>
				       	 </div>
				       	 <div class="col-sm-6">
					         <button type="submit" class="btn btn-primary btn-block">修&nbsp;&nbsp;改</button>
				       	 </div>
				       </div>
				    </div>
			      </form>
			  </div>
			</div>
   		</div>
    	<jsp:include page="right.jsp"/>
   	</div>
    <!-- 页尾 版权声明 -->
    <div class="container">
		<div class="col-sm-12 foot-css">
		        <p class="text-muted credit">
		            Copyright © 2018 中兴软件 版权所有
		        </p>
	    </div>
    </div>
        <!-- 密码修改model窗口 -->
    <div class="modal fade" id="modfiyPWD" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">用户密码修改</h4>
	      </div>
	      <form action="" class="form-horizontal" method="post">
		      <div class="modal-body">
			     <div class="form-group">
			       <label class="col-sm-3 control-label">登录密码：</label>
			       <div class="col-sm-6">
			         <input class="form-control" type="password">
			       </div>
			       <label class="col-sm-3 control-label error-info" style="text-align:left;">*不可为空</label>
			    </div>
			     <div class="form-group">
			       <label class="col-sm-3 control-label">新的密码：</label>
			       <div class="col-sm-6">
			         <input class="form-control" type="password">
			       </div>
			       <label class="col-sm-3 control-label error-info" style="text-align:left;">*不可为空</label>
			    </div>
			     <div class="form-group">
			       <label class="col-sm-3 control-label">重复密码：</label>
			       <div class="col-sm-6">
			         <input class="form-control" type="password">
			       </div>
			       <label class="col-sm-3 control-label error-info" style="text-align:left;">*不可为空</label>
			    </div>
		      </div>
		      <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">关&nbsp;&nbsp;闭</button>
		          <button type="reset" class="btn btn-default">重&nbsp;&nbsp;置</button>
		          <button type="submit" class="btn btn-default">修&nbsp;&nbsp;改</button>
			  </div>
		  </form>
	    </div>
	  </div>
	</div>
	<!-- MODEL结束 -->
  </body>
</html>
