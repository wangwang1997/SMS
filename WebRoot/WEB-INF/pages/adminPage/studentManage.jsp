<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>学生管理系统</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/mycss.css" type="text/css">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
    <link type="text/css" href="/bootstrap/css/bootstrap-table.css"/>
    <script type="text/javascript" src="/bootstrap/js/bootstrap-table.js"></script>
    <link rel="stylesheet" href="/bootstrap/css/bootstrapValidator.min.css" type="text/css"></link>
    <link rel="stylesheet" href="/css/style.css" type="text/css"></link>
    <script type="text/javascript" src="/bootstrap/js/bootstrapValidator.min.js"></script>
    
    <script>
        function initTable(){
        
        	//先销毁表格
        	$('#cusTable').bootstrapTable('destroy');
        	//初始化表格，动态从数据库中加载数据
        	$('#cusTable').bootstrapTable({
        		method: 'post',
		        contentType: "application/x-www-form-urlencoded",//post请求必须要有！
		        url:"/student/findAllByPage.do",//要请求数据的文件路径
		        striped: true, //是否显示行间隔色
		        pageNumber: 1, //初始化加载第一页，默认第一页
		        pagination:true,//是否分页
		        queryParamsType:'limit',//查询参数组织方式
		        queryParams:queryParams,//请求服务器时所传的参数
		        sidePagination:'server',//指定服务器端分页
		        pageSize:3,//单页记录数
		        pageList:[5,10,20,30],//分页步进值
		        showRefresh:false,//刷新按钮
		        showColumns:false,
		        clickToSelect: true,//是否启用点击选中行
		        toolbarAlign:'right',//工具栏对齐方式
		        buttonsAlign:'right',//按钮对齐方式
		        undefinedText: "空",//当数据为 undefined 时显示的字符  
		        columns:[
		          {
		            title:'全选',
		            field:'select',
		            //复选框
		            checkbox:true,
		            width:25,
		            align:'center',
		            valign:'middle'
		          },
		          {
		          	title:'用户名',
		          	field:'username',
		          	align:'center'


		          },
		          {
		          	title:'姓名',
		          	field:'name',
		          	align:'center'
		          },
		          {
		          	title:'性别',
		          	field:'gender',
		          	align:'center',
		          	formatter:function(value,row,index){
		          		//自定义显示：三个参数
		          		//value:该行的属性
		          		//row:该行的记录
		          		//index:该行的下标
		          		return row.gender==0?'女':'男';
		          	}
		          },
		          {
		          	title:'年龄',
		          	field:'age',
		          	align:'center'
		          },
		          {
		          	title:'班级',
		          	field:'grade',
		          	align:'center',
		          	formatter:function(value,row,index){
		          		return value.gname;
		          	}
		          },
		          {
		          	title:'学科',
		          	field:'course',
		          	align:'center',
		          	formatter:function(value,row,index){
		          		return value.cname;
		          	}
		          },
		          {
		          	title:'操作',
		          	field:'sid',
		          	align:'center',
		          	formatter:actionFormatter
		          	
		          	
		          }
				]


        	});


        
        }
        
        function actionFormatter(value,row,index){
        
             let id=value;
             let result='';
             result+='<a class="btn btn-primary btn-xs" style="cursor: pointer;" onclick="showModalModify('+id+')">修改</a>&nbsp;&nbsp;&nbsp;';
             result+='<a class="btn btn-danger btn-xs" style="cursor: pointer;" onclick="showModalDelete('+id+')">删除</a>&nbsp;&nbsp;&nbsp;';
        	 return result;
        }
        
        function viewById(id){
       	   console.log(id);
	    }
	    function showModalModify(sid){
	       //console.log(id);
	       $.post('/student/findById.do',{'sid':sid},function(student){
	       
	       		console.log(student);
	       		//将数据写入修改模态框
	       		$('#sid').val(student.sid);
	       		$('#username').val(student.username);
	       		$('#name').val(student.name);
	       		$('#age').val(student.age);
	       		//$('#sid').val(student.sid);
	       		if(student.gender=='1'){
	       			//让男单选按钮选中
	       			$('#male').prop('checked',true);
	       		}
	       		else{
	       			$('#female').prop('checked',true);
	       		
	       		}
	       		//获取下拉列表对应的值
	       		$('select#gid').val(student.grade.gid);
	       		$('select#cid').val(student.course.cid);
	       		
	       
	       },'json');
	       
	       
	       
	       //显示修改模态框
	       $('#modifyStudent').modal('show');
	       
	    }
	    function showModalDelete(id){
	       //console.log(id);
	       //alert(id);
	       //将id存入隐藏表单域
	       $('#del_id').val(id);
	       //显示删除提示模态框
	       $('#deleteStudent').modal('show');
	    }
	    
	    //删除学生
	    function deleteStudent(){
	        //从隐藏表单域获取sid
	        let sid=$('#del_id').val();	  
	        //alert(sid);  
	     	window.location='/student/deleteStudent.do?sid='+sid;
	    
	    
	    }

        function queryParams(params){
        	return {

        		//页号
        		pageNo:(params.offset / params.limit)+1,
        		
        		//页的大小
        		pageSize:params.limit


        	}

        }
    
        $(function(){
        	//alert(1);
        	//初始化表格
        	initTable();
        	
        	let msg='${msg}';
        	if(msg!=''){
        		//在列表上方显示弹出提示框
        		//需要在对应table上加上data-toggle="tooltip"
        		$('#cusTable').tooltip({
        			title:' ',
        			template:'<div class="tooltip tooltipMsg">'+msg+'</div>',
        			trigger:'manual'
        		}).tooltip('show');
        	
        	}
        	//2秒钟后，提示框自动关闭
        	//
        	$('[data-toggle="tooltip"]').each(function(){
    			//给表单绑定事件，当tooltip显示之后触发
    			$(this).on('shown.bs.tooltip',function(){
    			    let _this=this;
    			    setTimeout(function(){
    			    	$(_this).tooltip('hide');
    			    },2000);
    			});
    		});
        	
        	
        	
        	
        	//表单校验
        	$('#frmAddStudent').bootstrapValidator({
		        message: 'This value is not valid',//默认输出值
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',//成功后输出的图标
		            invalid: 'glyphicon glyphicon-remove',//失败后输出的图标
		            validating: 'glyphicon glyphicon-refresh'//长时间加载时输出的图标
		        },
		        fields:{
					username: {//表单元素name的值
					    message: '用户名验证失败',//验证失败输出的默认值
					    validators: {//验证规则
					        notEmpty: {
					            message: '用户名不能为空'//验证失败输出的值
					        },
					        stringLength:{
					        	min:3,
					        	max:10,
					        	message:'用户名长度必须3-10位之间'
					        },
					        regexp:{
					        	regexp:/^[0-9a-zA-Z_]+$/,
					        	message:'用户名只能包含数字，字母或者下划线'
					        },
					        remote:{//向远程服务器发送请求进行校验
					        	type:'post',
					        	url:'/student/findByUsername.do'//根据返回的valid的值如果是true,输出message的值
					        	//message:'用户名已经占用'
					        
					        }			       
					    }
					},
					password:{
						validators:{
							 notEmpty: {
					            message: '密码不能为空'//验证失败输出的值
					        },
					        different:{
					        	field:'username',
					        	message:'密码不能和用户名相同'
					        }
						}
					},
					repassword:{
						validators:{
							notEmpty: {
					            message: '确认密码不能为空'//验证失败输出的值
					        },
					        identical:{
					            field:'password',
					        	message:'两次输入的密码不一致'
					        }
						}
					},
					name:{
						validators:{
							notEmpty: {
					            message: '确认密码不能为空'//验证失败输出的值
					        }
						}
					},
					age:{
						validators:{
							notEmpty: {
						        message: '年龄不能为空'//验证失败输出的值
						    },
						    greaterThan:{
						    	value:10,
						    	inclusive:true,
						    	message:'年龄必须大于10'//默认闭区间inclusive:true
						    },
						    lessThan:{
						    	value:30,
						    	inclusive:false,
						    	message:'年龄必须小于30' 
						    }
			
						}
					
					},
					gid:{
						validators:{
							notEmpty: {
						        message: '班级不能为空，请选择'
						    }
						}
					},
					cid:{
						validators:{
							notEmpty: {
						        message: '课程不能为空，请选择'
						    }
						}
					}
					
					   
		        }
		    });
        	
        	
        	
        });
        
        //按条件查询
        function queryByCondition(){
        	//alert(1);
        	//按条件初始化表格
        	initTableByCondition();
        	
        }
        
        function initTableByCondition(){
        
        //先销毁表格
        	$('#cusTable').bootstrapTable('destroy');
        	//初始化表格，动态从数据库中加载数据
        	$('#cusTable').bootstrapTable({
        		method: 'post',
		        contentType: "application/x-www-form-urlencoded",//post请求必须要有！
		        url:"/student/findByCondition.do",//要请求数据的文件路径
		        striped: true, //是否显示行间隔色
		        pageNumber: 1, //初始化加载第一页，默认第一页
		        pagination:true,//是否分页
		        queryParamsType:'limit',//查询参数组织方式
		        queryParams:queryParams,//请求服务器时所传的参数
		        sidePagination:'server',//指定服务器端分页
		        pageSize:3,//单页记录数
		        pageList:[5,10,20,30],//分页步进值
		        showRefresh:false,//刷新按钮
		        showColumns:false,
		        clickToSelect: true,//是否启用点击选中行
		        toolbarAlign:'right',//工具栏对齐方式
		        buttonsAlign:'right',//按钮对齐方式
		        undefinedText: "空",//当数据为 undefined 时显示的字符  
		        columns:[
		          {
		            title:'全选',
		            field:'select',
		            //复选框
		            checkbox:true,
		            width:25,
		            align:'center',
		            valign:'middle'
		          },
		          {
		          	title:'用户名',
		          	field:'username',
		          	align:'center'


		          },
		          {
		          	title:'姓名',
		          	field:'name',
		          	align:'center'
		          },
		          {
		          	title:'性别',
		          	field:'gender',
		          	align:'center',
		          	formatter:function(value,row,index){
		          		//自定义显示：三个参数
		          		//value:该行的属性
		          		//row:该行的记录
		          		//index:该行的下标
		          		return row.gender==0?'女':'男';
		          	}
		          },
		          {
		          	title:'年龄',
		          	field:'age',
		          	align:'center'
		          },
		          {
		          	title:'班级',
		          	field:'grade',
		          	align:'center',
		          	formatter:function(value,row,index){
		          		return value.gname;
		          	}
		          },
		          {
		          	title:'学科',
		          	field:'course',
		          	align:'center',
		          	formatter:function(value,row,index){
		          		return value.cname;
		          	}
		          },
		          {
		          	title:'操作',
		          	field:'sid',
		          	align:'center',
		          	formatter:actionFormatter
		          	
		          	
		          }
				]


        	});
        	
        }
        
        //除了当前页号和页的大小这两个参数外，还需要查询条件参数
        function queryParams(params){
        	return {

        		//页号
        		pageNo:(params.offset / params.limit)+1,
        		
        		//页的大小
        		pageSize:params.limit,
        		
        		name:$('#qname').val(),
        		minAge:$('#minAge').val(),
        		maxAge:$('#maxAge').val(),
        		gender:$(':radio:checked').val(),
        		gid:$('#qgid').val(),
        		cid:$('#qcid').val()


        	}

        }
    
    </script>
  </head>
  <%request.setAttribute("index",1); %>
  <body>
    <jsp:include page="top.jsp"/>
    <div class="container margin-top-10">
    	<div class="col-sm-8">
    		<div class="panel panel-default">
			  <div class="panel-body">
				<form class="form-inline" method="post" >
				  <div class="form-group">
				    <label>姓名:</label>
				    <input type="text" class="form-control input-sm" placeholder="不填查询所有" id="qname">
				  </div>
				  &nbsp;
				  <div class="form-group">
				    <label>年龄:</label>
				    <input type="text" class="form-control input-sm" style="width:80px" placeholder="最小年龄" id="minAge">&nbsp;&nbsp;---&nbsp;&nbsp;
				    <input type="text" class="form-control input-sm" style="width:80px" placeholder="最大年龄" id="maxAge">
				  </div>
				   &nbsp;
				  <div class="form-group">
				    <label>性别:</label>
				    <div class="radio">
					  <label>
					    <input type="radio" value="all" name="gender" checked="checked"> 全部 
					  </label>
					  &nbsp;
					  <label>
					    <input type="radio" value="1" name="gender"> 男
					  </label>
					  &nbsp;
					  <label>
					    <input type="radio" value="0" name="gender"> 女
					  </label>
					</div>
				  </div>
				   <br>
				   <br>
				  <div class="form-group">
			       <label class="control-label">班级：</label>
			         <select class="form-control input-sm"  id="qgid">
			       	 	<option value="all" selected="selected">--查询全部--</option>
			       	 	<c:forEach items="${gradeList}" var="grade" >
			       	 		<option value="${grade.gid}">${grade.gname}</option>
			       	    </c:forEach>
			       	 </select>
			       	 <label class="control-label">课程：</label>
			         <select class="form-control input-sm"  id="qcid">
			       	 	<option value="all" selected="selected">--查询全部--</option>
			       	 	<c:forEach items="${courseList}" var="course" >
			       	 		<option value="${course.cid}">${course.cname}</option>
			       	 	</c:forEach>
			       	 	
			       	 </select>
			      </div>
			       &nbsp;
			       <button type="reset" class="btn btn-success btn-sm">重&nbsp;&nbsp;置</button>
			       <button type="button" class="btn btn-success btn-sm" onclick="queryByCondition()">查&nbsp;&nbsp;询</button>
				</form>
			  	<hr/>
			  	<div class="padding-bottom-3">
			  		<a class="btn btn-info btn-sm" href="/student/exportExcel.do">导出学员信息</a>
			  		<a class="btn btn-info btn-sm" href="/student/importExcel.do">导入学员信息</a>
			  		<a class="btn btn-success btn-sm" style="display:inline-block;float:right;" 
			  		data-toggle="modal" data-target="#addStudent">添加新学员</a>
			  	</div>
			    <table id="cusTable" data-toggle="tooltip">
					
				</table>
			  </div>
			</div>
   		</div>
    	<jsp:include page="right.jsp"/>
   	</div>
    <jsp:include page="bottom.jsp"/>
    
    <!-- 添加用户model窗口 -->
    <div class="modal fade" id="addStudent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加新学员</h4>
	        <!-- 需要添加的表单  -->
	        <form action="/student/addStudent.do" class="form-horizontal" method="post" id="frmAddStudent">
				     <div class="form-group">
				       <label class="col-sm-3 control-label">登录账户：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text" name="username">
				       </div>
				    </div>
				    <div class="form-group">
				       <label class="col-sm-3 control-label">登录密码：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="password" name="password">
				       </div>
				    </div>
				    <div class="form-group">
				       <label class="col-sm-3 control-label">确认密码：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="password" name="repassword">
				       </div>
				    </div>
				     <div class="form-group">
				       <label class="col-sm-3 control-label">学生姓名：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text" name="name">
				       </div>
				    </div>
				     <div class="form-group">
				       <label class="col-sm-3 control-label">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text" name="age">
				       </div>
				    </div>
				     <div class="form-group">
				       <label class="col-sm-3 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
				       <div class="col-sm-6">
					       <div class="radio">
							  <label>
							    <input type="radio" value="1" name="gender" checked="checked"> 男
							  </label>
							  &nbsp;&nbsp;&nbsp;
							  <label>
							    <input type="radio" value="0" name="gender"> 女
							  </label>
							</div>
						</div>
				       <label class="col-sm-4 control-label error-info" style="text-align:left;"></label>
				    </div>
				    <div class="form-group">
				       <label class="col-sm-3 control-label">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</label>
				       <div class="col-sm-6">
				         <select class="form-control" name="gid">
				       	 	<option value="">-请选择-</option>
				       	 	<c:forEach items="${gradeList}" var="grade">
			       	 			<option value="${grade.gid}">${grade.gname}</option>
			       	    	</c:forEach>
				       	 </select>
				       </div>
				    </div>
				    <div class="form-group">
				       <label class="col-sm-3 control-label">课&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;程：</label>
				       <div class="col-sm-6">
				         <select class="form-control" name="cid">
				       	 	<option value="">-请选择-</option>
				       	 	<c:forEach items="${courseList}" var="course">
			       	 			<option value="${course.cid}">${course.cname}</option>
			       	 		</c:forEach>
				       	 </select>
				       </div>
				    </div>
				    <div class="form-group">
				       <div class="col-sm-6  col-sm-offset-3">
				       	 <div class="col-sm-6">
					         <button type="reset" class="btn btn-primary btn-block">重&nbsp;&nbsp;置</button>
				       	 </div>
				       	 <div class="col-sm-6">
					         <button type="submit" class="btn btn-primary btn-block">添&nbsp;&nbsp;加</button>
				       	 </div>
				       </div>
				    </div>
			      </form>
	        
	        
	      </div>
	      
	    </div>
	  </div>
	</div>
	<!-- MODEL结束 -->
    <!-- 修改用户model窗口 -->
    <div class="modal fade" id="modifyStudent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加新学员</h4>
	        <!-- 需要修改的表单  -->
	        <form action="/student/modifyStudent.do" class="form-horizontal" method="post" id="frmModifyStudent">
				   
				      
				         <input class="form-control" type="hidden"  readonly="readonly" id="sid" name="sid">
				      
				   
				     <div class="form-group">
				       <label class="col-sm-3 control-label">登录账户：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text" id="username" name="username">
				       </div>
				    </div>
				     <div class="form-group">
				       <label class="col-sm-3 control-label">学生姓名：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text" id="name" name="name">
				       </div>
				    </div>
				     <div class="form-group">
				       <label class="col-sm-3 control-label">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text" id="age" name="age">
				       </div>
				    </div>
				     <div class="form-group">
				       <label class="col-sm-3 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
				       <div class="col-sm-6">
					       <div class="radio">
							  <label>
							    <input type="radio" value="1" name="gender" id="male"> 男
							  </label>
							  &nbsp;&nbsp;&nbsp;
							  <label>
							    <input type="radio" value="0" name="gender" id="female"> 女
							  </label>
							</div>
						</div>
				       <label class="col-sm-3 control-label error-info" style="text-align:left;"></label>
				    </div>
				    <div class="form-group">
				       <label class="col-sm-3 control-label">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</label>
				       <div class="col-sm-6">
				         <select class="form-control" id="gid" name="gid">
				       	 	<option value="">-请选择-</option>
				       	 	<c:forEach items="${gradeList}" var="grade">
			       	 			<option value="${grade.gid}">${grade.gname}</option>
			       	    	</c:forEach>
				       	 </select>
				       </div>
				    </div>
				    <div class="form-group">
				       <label class="col-sm-3 control-label">课&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;程：</label>
				       <div class="col-sm-6">
				         <select class="form-control" id="cid" name="cid">
				       	 	<option value="">-请选择-</option>
				       	 	<c:forEach items="${courseList}" var="course">
			       	 			<option value="${course.cid}">${course.cname}</option>
			       	 		</c:forEach>
				       	 </select>
				       </div>
				    </div>
				    <div class="form-group">
				       <div class="col-sm-6  col-sm-offset-3">
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
	</div>
	<!-- MODEL结束 -->
	
	<!-- 删除提示model窗口 -->
    <div class="modal fade" id="deleteStudent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">删除提示</h4>
	        
	        
	        
	      </div>
	      <div class="modal-body">
	      		<p class="text-center" style="font-size: 20px;">确认删除该条记录吗？</p>
	      </div>
	      <input type="hidden" id="del_id"/>
	      <div class="modal-footer"> 
		         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	       	 
	       	 
		         <button type="button" class="btn btn-primary" onclick="deleteStudent()">确认</button>
	      </div> 	
	      
	    </div>
	  </div>
	</div>
	<!-- MODEL结束 -->
    
  </body>
</html>
