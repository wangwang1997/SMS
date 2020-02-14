<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script>
       function modifyPwd(){
       		//alert(1);
       		let id='${user.id}';
       		let oldPass=$('#oldPass').val();
       		let newPass=$('#newPass').val();
       		let params={'id':id,'oldPass':oldPass,'newPass':newPass};
       		$.post('/sysuser/modifyPwd.do',params,function(data){
       			if(data=='success'){
       				alert('修改密码成功');
       				//返回登录页面重新登录
       				window.location='/login.jsp';
       			}
       			else{
       				alert('修改密码失败');
       				//清空表单数据
       				$('#modForm')[0].reset();
       				
       				
       			}
       			
       			
       		});
       }
       
       //退出系统
       function logOut(){
       	  $.ajax({
       	  		method: 'post',
       	  		url:'/sysuser/logOut.do',
       	  		success:function(){
       	  			alert('你已退出当前系统');
       	  			//返回登录页面，继续登录
       	  			window.location='/login.jsp';
       	  		}
       	  });
       }
       
    </script>
<div class="col-sm-4">
    		<div class="panel panel-default">
    		  <div class="panel-heading">
    		  	 <img alt="" src="/images/user.png">
			     <span class="font-style"> 欢迎您：${user.username}</span>
    		  </div>
			  <div class="panel-body">
			  	<div class="col-sm-12">
				   	<ul class="nav nav-pills nav-stacked">
					  <li><a class="btn btn-link" data-toggle="modal" data-target="#modfiyPWD" style="text-align: left;">修改登录密码</a></li>
					  <li><a onclick="logOut()" style="cursor: pointer;">退出校园系统</a></li>
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
   		
   		
   		<!-- 密码修改model窗口 -->
    <div class="modal fade" id="modfiyPWD" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">用户密码修改</h4>
	      </div>
	      <form action="" class="form-horizontal" method="post" id="modForm">
		      <div class="modal-body">
			     <div class="form-group">
			       <label class="col-sm-3 control-label">登录密码：</label>
			       <div class="col-sm-6">
			         <input class="form-control" type="password" id="oldPass">
			       </div>
			       <label class="col-sm-3 control-label error-info" style="text-align:left;">*不可为空</label>
			    </div>
			     <div class="form-group">
			       <label class="col-sm-3 control-label">新的密码：</label>
			       <div class="col-sm-6">
			         <input class="form-control" type="password" id="newPass">
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
		          <button type="button" class="btn btn-default" onclick="modifyPwd()">修&nbsp;&nbsp;改</button>
			  </div>
		  </form>
	    </div>
	  </div>
	</div>
	<!-- MODEL结束 -->