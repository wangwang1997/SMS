<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>学生管理系统</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css" type="text/css"></link>
    <link rel="stylesheet" href="/css/mycss.css" type="text/css"></link>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
  </head>
  <body>
    <div class="container nav-height">
   		<div class="col-sm-3">
   			<img alt="" src="/images/logn.png">
   		</div>
   		<div class="col-md-3 col-md-offset-6 visible-md-block visible-lg-block">
   			<p class="p-css">2018 年 4 月 16 日 23:22:00</p>
   		</div>
    </div>
    <div class="nav-style">
    	<div class="container">
	    	<div class="col-sm-12">
	    		<ul class="nav nav-pills">
				  <li class="active"><a href="adminMain.html">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a></li>
				  <li><a href="studentManager.html">学生管理</a></li>
				  <li><a href="gradeManager.html">班级管理</a></li>
				  <li><a href="courseManager.html">课程管理</a></li>
				  <li><a href="blogManager.html">日志管理</a></li>
				  <li class="dropdown">
			          <a href="#" data-toggle="dropdown">预留连接 <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="#">更新个人信息</a></li>
			            <li><a href="#">修改登录密码</a></li>
			            <li role="separator" class="divider"></li>
			            <li><a href="/login.html">退出校园系统</a></li>
			          </ul>
			        </li>
				</ul>
	   		</div>
    	</div>
    </div>
    <div class="container margin-top-10">
    	<div class="col-sm-8">
    		<div class="panel panel-default">
			  <div class="panel-body">
			    <table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>编号</th>
							<th>用户名</th>
							<th>姓名</th>
							<th>性别</th>
							<th>年龄</th>
							<th>班级</th>
							<th>学科</th>
						</tr>
					</thead>
					<tbody>
					    <c:forEach items="${students}" var="student">
						<tr>
							<td>${student.sid}</td>
							<td>${student.username}</td>
							<td>${student.name}</td>
							<td>${student.gender}</td>
							<td>${student.age}</td>
							<td>${student.grade.gname}</td>
							<td>${student.course.cname}</td>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="8" style="text-align: center;">
							  <ul class="pagination" style="margin: 0px;">
							    <li>
							      <a href="#" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
							    <li class="active"><a href="#">1</a></li>
							    <li><a href="#">2</a></li>
							    <li><a href="#">3</a></li>
							    <li><a href="#">4</a></li>
							    <li><a href="#">5</a></li>
							    <li>
							      <a href="#" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
							  </ul>
							</td>
						</tr>
					</tfoot>
				</table>
			  </div>
			</div>
   		</div>
    	<div class="col-sm-4">
    		<div class="panel panel-default">
    		  <div class="panel-heading">
    		  	 <img alt="" src="/images/user.png">
			     <span class="font-style"> 欢迎您：mike管理员！</span>
    		  </div>
			  <div class="panel-body">
			  	<div class="col-sm-12">
				   	<ul class="nav nav-pills nav-stacked">
					  <li><a class="btn btn-link" data-toggle="modal" data-target="#modfiyPWD" style="text-align: left;">修改登录密码</a></li>
					  <li><a href="#">退出校园系统</a></li>
					</ul>
			  	</div>
			  </div>
			</div>
			<div class="panel panel-default">
    		  <div class="panel-heading">
    		  	 <img alt="" src="/images/message.png"> 
			     <span class="font-style">&nbsp;联系我们：</span>
    		  </div>
			  <div class="panel-body">
			  	<address class="padding-left-10 font-info">
				  <strong>联系地址：</strong><br>
				  南京市紫荆花路68号中兴通讯南京研发中心<br>
				  <strong>联系电话：</strong><br>
				   025-12345678
				</address>
			  </div>
			</div>
   		</div>
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
