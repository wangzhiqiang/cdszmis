<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<title>login</title>
<link href="${rooturl }/styles/login.css" rel="stylesheet" type="text/css">
<link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
<body>

	<div class='header'>

		<br>
	</div>
	<div class='content'>

		<div class='c_left'>
			<img src="${rooturl}/images/logo_1.png" class="logoimg">
		</div>
		<div class='c_right'>
		<form action="/login" method="post">
			<table class="tab_center">
				<tr>
					<td colspan="3">
						用户登录
					</td>
				</tr>
				<tr>
					<td colspan="3"> <br />
					</td>
				</tr>
				<tr>
					<td>
						帐号:
					</td>
					<td>
						<input type="text" name='user.loginname' style="width: 150px;" />
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						密码:
					</td>
					<td>
						<input type="password" name='user.uspass' style="width: 150px;" />
					</td>
					<td>
						  <img src="${rooturl}/images/luck.gif" width="19" height="18">  
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<br />
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						<input type="submit" name='submit' value="登录"
							style="position: relative; margin-left: 5px;" />

						<input type="reset" name='reset' value="重置"
							style="position: relative; margin-left: 35px;" />
					</td>
				</tr>
			</table>
			</form>
			 
		</div>
	</div>

 
</body>