<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>index</title>
 
<script language="JavaScript"
	src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<script language="JavaScript" src="${rooturl }/scripts/thickbox.js"></script>
<link href="${rooturl }/styles/thickbox.css" rel="stylesheet"
	type="text/css" />
</head>

<body>
 
	<a href="#TB_inline?height=140&width=230&inlineId=tt" class="thickbox"
		style="text-decoration: none">登录后台管理</a>

	<div id="tt" style="display: none">
		<form action="/login" method="post">
			<table align="center">
				<tr>
					<td colspan="3" align="center">
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
</body>
</html>
