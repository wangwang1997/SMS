<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script>
        function showTime(){
        	let d = new Date();
        	let year=d.getFullYear();
        	let month = d.getMonth()+1;
        	let day = d.getDate();
        	let hour = d.getHours();
        	let minute = d.getMinutes();
        	//let second = d.getSeconds();
        	$('#timeId').html('当前时间：'+year+'年'+month+'月'+day+'日'+hour+'时'+minute+'分');
        	
        }
    
        $(function(){
        	//显示当前时间
        	showTime();
        	//每隔一分钟调用一次该函数
        	setInterval(showTime,60000);
        	
        	//正确显示导航栏
        	//逻辑:给每一个导航页加上索引，遍历该导航栏，如果是对应索引，将其页面对应的样式高亮，其余清除高亮显示
        	let navIndex = ${index};
        	$('ul.nav li').each(function(i){
        		//alert(i);
        		//将所有导航栏背景清除
        		$(this).removeClass('active');
        		if(navIndex==i){
        			$(this).addClass('active');
        		}
        	});
        	
        
        });
    </script>
<div class="container nav-height">
   		<div class="col-sm-3">
   			<img alt="" src="/images/logn.png">
   		</div>
   		<div class="col-md-3 col-md-offset-6 visible-md-block visible-lg-block">
   			<p class="p-css" id="timeId">dfdf</p>
   		</div>
    </div>
    <div class="nav-style">
    	<div class="container">
	    	<div class="col-sm-12">
	    		<ul class="nav nav-pills">
				  <li class="active"><a href="/student/findAllBlog.do">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a></li>
				  <li><a href="/blog/Myblog.do">我的日志</a></li>
				  <li><a href="/blog/newblog.do">发表日志</a></li>
				  <li class="dropdown">
			          <a href="#" data-toggle="dropdown">预留连接 <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="/student/toModifyInfo.do">更新个人信息</a></li>
			            <li><a class="btn btn-link" data-toggle="modal" data-target="#modfiyPWD" style="text-align: left;">修改登录密码</a></li>
			            <li role="separator" class="divider"></li>
			            <li><a href="#">退出校园系统</a></li>
			          </ul>
			        </li>
				</ul>
	   		</div>
    	</div>
    </div>