<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>学生管理系统</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" type="text/css"></link>
    <link rel="stylesheet" href="../../css/mycss.css" type="text/css"></link>
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../ckeditor/ckeditor.js"></script>
    <script>
    	$(function(){
    		CKEDITOR.replace('content');
    	});

    </script>
  </head>
  <%request.setAttribute("index",2); %>
  <body>
    <jsp:include page="top.jsp"/>
    <div class="container margin-top-10">
    	<div class="col-sm-8">
    		<div class="panel panel-default">
			  <div class="panel-body">
				<form action="/blog/AddBlog.do" method="post">
				  <div class="form-group">
				    <label>日志标题：</label><label class="control-label error-info" style="text-align:left;">*不能为空</label>
				    <input type="text" class="form-control" id="title" name="title">
				  </div>
				  <div class="form-group">
				    <label>日志正文：</label><label class="control-label error-info" style="text-align:left;">*不能为空</label>
				    <textarea id="content" cols="20" rows="2" class="ckeditor" name="content"></textarea>
				  </div>
				  <div class="text-right">
					  <button type="submit" class="btn btn-success">发&nbsp;&nbsp;&nbsp;&nbsp;表</button>
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
