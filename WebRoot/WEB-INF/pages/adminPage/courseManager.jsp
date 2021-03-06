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
		        url:"/course/findAllCourse.do",//要请求数据的文件路径
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
		          	title:'编号',
		          	field:'cid',
		          	align:'center'


		          },
		          {
		          	title:'课程名称',
		          	field:'cname',
		          	align:'center'
		          },
		          {
		          	title:'课程描述',
		          	field:'cdesc',
		          	align:'center'
		          },
		          {
		          	title:'状态',
		          	field:'state',
		          	align:'center',
		          	formatter:function(value,row,index){
		          		//自定义显示：三个参数
		          		//value:该行的属性
		          		//row:该行的记录
		          		//index:该行的下标
		          		return row.state==0?'禁用':'启用';
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
             if(row.state == 1){
             	result+='<a class="btn btn-danger btn-xs">禁用</a>&nbsp;&nbsp;&nbsp;';
             }else{
             	result+='<a class="btn btn-success btn-xs">启用</a>&nbsp;&nbsp;&nbsp;';
             }
             result+='<a class="btn btn-info btn-xs" data-toggle="modal" data-target="#modfiyGrade">修改</a>&nbsp;&nbsp;&nbsp;';
             result+='<a class="btn btn-danger btn-xs" style="cursor: pointer;" onclick="showModalDelete('+id+')">删除</a>&nbsp;&nbsp;&nbsp;';
        	 return result;
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
    		});
    		 //除了当前页号和页的大小这两个参数外，还需要查询条件参数
        function queryParams(params){
        	return {

        		//页号
        		pageNo:(params.offset / params.limit)+1,
        		
        		//页的大小
        		pageSize:params.limit,
        		grade:$("#grade").val()
        		

        	}

        }
    </script>
  </head>
  <%request.setAttribute("index",3); %>
  <body>
    <jsp:include page="top.jsp"/>
    <div class="container margin-top-10">
    	<div class="col-sm-8">
    		<div class="panel panel-default">
			  <div class="panel-body">
			  	<div class="padding-bottom-3" style="text-align: right;">
			  		<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#addCourse" >增开新课程</button>
			  	</div>
			  	<table id="cusTable" data-toggle="tooltip">
					
				</table>
			    
			  </div>
			</div>
   		</div>
    	<jsp:include page="right.jsp"/>
   	</div>
   <jsp:include page="bottom.jsp"/>
	<!-- 课程修改model窗口 -->
    <div class="modal fade" id="modfiyCourse" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">课程信息修改</h4>
	      </div>
	      <form action="" class="form-horizontal" method="post">
		      <div class="modal-body">
				<div class="form-group">
			       <label class="col-sm-3 control-label">课程编号：</label>
			       <div class="col-sm-6">
			         <input class="form-control" type="text" value="1" readonly="readonly">
			       </div>
			       <label class="col-sm-3 control-label error-info" style="text-align:left;">*不可修改</label>
			    </div>
			     <div class="form-group">
			       <label class="col-sm-3 control-label">课程名称：</label>
			       <div class="col-sm-6">
			         <input class="form-control" type="text" value="java软件开发">
			       </div>
			       <label class="col-sm-3 control-label error-info" style="text-align:left;">*不能为空</label>
			    </div>
			     <div class="form-group">
			       <label class="col-sm-3 control-label">课程描述：</label>
			       <div class="col-sm-6">
			         <textarea class="form-control" rows="10" style="resize:none;">a、JAVA程序设计
b、SQL SERVER 高级应用
c、jQuery高级编程
d、HTML5与CSS3开发
e、Oracle数据库应用
			         </textarea>
			       </div>
			       <label class="col-sm-3 control-label error-info" style="text-align:left;">*不能为空</label>
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
	<!-- 课程添加model窗口 -->
    <div class="modal fade" id="addCourse" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">新课程添加</h4>
	      </div>
	      <form action="" class="form-horizontal" method="post">
		      <div class="modal-body">
			     <div class="form-group">
			       <label class="col-sm-3 control-label">课程名称：</label>
			       <div class="col-sm-6">
			         <input class="form-control" type="text">
			       </div>
			       <label class="col-sm-3 control-label error-info" style="text-align:left;">*不能为空</label>
			    </div>
			    <div class="form-group">
			       <label class="col-sm-3 control-label">课程描述：</label>
			       <div class="col-sm-6">
			         <textarea class="form-control" rows="10" style="resize:none;"></textarea>
			       </div>
			       <label class="col-sm-3 control-label error-info" style="text-align:left;">*不能为空</label>
			    </div>
		      </div>
		      <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">关&nbsp;&nbsp;闭</button>
		          <button type="reset" class="btn btn-default">重&nbsp;&nbsp;置</button>
		          <button type="submit" class="btn btn-default">添&nbsp;&nbsp;加</button>
			  </div>
		  </form>
	    </div>
	  </div>
	</div>
	<!-- MODEL结束 -->
  </body>
</html>
