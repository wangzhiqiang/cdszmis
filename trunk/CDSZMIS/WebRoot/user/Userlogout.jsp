<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
    <title>用户注销</title>


  </head>
  
  <body>
<div class='table' style="width:1200px;margin-left: 5px;">

	<div class='hd' style="width: 100%">
			<div class='td' style="width: 50px;">用户名</div>
			<div class='td' style="width: 50px;">性别</div>
			<div class='td' style="width: 150px;">邮箱</div>
			<div class='td' style="width: 100px;">手机</div>
			<div class='td' style="width: 100px;">办公室电话</div>
			<div class='td' style="width: 110px;">身份证</div>
			<div class='td' style="width: 150px;">用户组</div>
			<div class='td' style="width: 150px;">用户状态</div>
			<div class='td' style="width: 150px;">状态更改</div>
	</tr>
	<c:forEach items="${list}" var="l">
		<div class='tr'>
		<div class='td' style="width: 50px;">${l.usname}</div>
		<div class='td' style="width: 50px;">${l.gender}</div>
		<div class='td' style="width: 150px;">${l.email}</div>
		<div class='td' style="width: 100px;">${l.phone}</div>
		<div class='td' style="width: 100px;">${l.officenum}</div>
		<div class='td' style="width: 110px;">${l.idcard}</div>
		<div class='td' style="width: 150px;">${l.usgroups }</div>	
		<div class='td' style="width: 150px;"><c:if test="${l.status ==0}">激活</c:if> <c:if test="${l.status ==1}">未激活</c:if></div>
			
			
	<form  action="/user/user_userLogout" method="get">
			
				<td>
				<input name="user.id" type="hidden" value="${l.id }"/>
				<label name="user.status">
				<input name="user.status" type="radio" value="0" checked="checked"/>激活
				<input  name="user.status" type="radio" value="1" />注销
				<td><input id="submit"   value="提交" type="submit"  /></td>
				</label>
				</td>

		
	</form>	
	</div>
	</c:forEach>		
	
		
</div>
	
  </body>
</html>
