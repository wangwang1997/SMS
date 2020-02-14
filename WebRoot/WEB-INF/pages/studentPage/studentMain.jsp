<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>学生管理系统</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css" type="text/css"></link>
    <link rel="stylesheet" href="/css/mycss.css" type="text/css"></link>
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
		        url:"/blog/findAllBlog.do",//要请求数据的文件路径
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
		          	field:'bid',
		          	align:'center'


		          },
		          {
		          	title:'日志标题',
		          	field:'title',
		          	align:'center',
		          	formatter:function(value,row,index){
		          		let result="<a href='/blog/blogDetail.do?bid="+row.bid+"'>"+row.title+"</a>";
		          		return result;
		          		
		          	}
		          },
		          {
		          	title:'更新时间',
		          	field:'createDate',
		          	align:'center',
		          	formatter:function(value,row,index){
		          	let time = new Date(row.createDate);
		          	let year = time.getFullYear();
		          	let month = time.getMonth()+1;
		          	let day = time.getDate();
		          	let hour = time.getHours();
		          	let minute = time.getMinutes();
		          	if(month<10){
		          		month="0"+month;
		          	}
		          	if(day<10){
		          		day="0"+day;
		          	}
		          	if(hour<10){
		          		hour="0"+hour;
		          	}
		          	if(minute<10){
		          		minute="0"+minute;
		          	}
		          	return year+"-"+month+"-"+day+" "+hour+":"+minute;
		          	}
		          },
		          {
		          	title:'作者',
		          	field:'username',
		          	align:'center',
		          	formatter:function(value,row,index){
		          		return row.student.username;
		          	}
		          }
				]


        	});
        	
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
        		

        	}

        }
        </script>
  </head>
  <%request.setAttribute("index",0); %>
  <body>
    <jsp:include page="top.jsp"/>
    <div class="container margin-top-10">
    	<div class="col-sm-8">
    		<div class="panel panel-default">
			  <div class="panel-body">
			  <table id="cusTable" data-toggle="tooltip">
					
				</table>
			  
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
