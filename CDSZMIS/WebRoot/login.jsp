<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<title>用户登录</title>
<link href="/images/login.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <div id="login">
	
	     <div id="top">
		      <div id="top_left"><img src="/images/login_03.gif" /></div>
			  <div id="top_center"></div>
		 </div>
		 
		 <div id="center">
		      <div id="center_left"></div>
			  <div id="center_middle">
				  <form action="/login" method="post">
				       <div id="user">用 户
				         <input type="text" name="user.loginname" />
				       </div>
					   <div id="password">密   码
					     <input type="password" name="user.uspass" />
					   </div>
					   <div id="btn"><input type='submit' style="height: 25px;line-height: 24px;font-size: 12px;"value="登录"/><input type='reset' style="height: 25px;line-height: 24px;font-size: 12px;"value="清空"/></div>
				  </form>
			  </div>
			  <div id="center_right"></div>		 
		 </div>
		 <div id="down">
		      <div id="down_left">
			      <div id="inf">
                       <span class="inf_text">版本信息</span>
					   <span class="copyright">信息管理系统 2012 v1.0</span>
			      </div>
			  </div>
			  <div id="down_center"></div>		 
		 </div>

	</div>
</body>
 
</body>