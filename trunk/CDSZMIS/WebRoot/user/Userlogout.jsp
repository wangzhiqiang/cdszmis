<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>用户注销</title>


  </head>
  
  <body>
	<table border="1" width="80%">

	<tr>
		<td>用户名</td>
		<td>性别</td>
		<td>邮箱</td>
		<td>手机</td>
		<td>办公室电话</td>
		<td>身份证</td>
		<td>用户组</td>
		<td>用户状态</td>
		<td>状态更改</td>
	</tr>
	<c:forEach items="${list}" var="l">
		<tr>
			<td>${l.usname}</td>
			<td>${l.gender}</td>
			<td>${l.email}</td>
			<td>${l.phone}</td>
			<td>${l.officenum}</td>
			<td>${l.idcard}</td>
			<td>${l.usgroups }</td>
			<td><c:if test="${l.status ==0}">激活</c:if> <c:if test="${l.status ==1}">未激活</c:if></td>
			
			
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
		</tr>
	</c:forEach>		
	
		
</table>
	
  </body>
</html>
