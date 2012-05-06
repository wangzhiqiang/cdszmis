<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>用户详细信息</title>
</head>
  
  <body> 
  <table border="1">
  	<c:forEach items="${content}" var="c">
  	
  		用户名:${c.usname } <br>
		登录名:${c.loginname }<br>
		性别:${c.gender }<br>
		邮箱:${c.email}<br>
		手机:${c.phone}<br>
		办公室电话:${c.officenum}<br>
		身份证:${c.idcard}<br>
		出生日期:${c.birthday}<br>
		用户组:${c.usgroups}<br>
		部门:${c.usdeparts }<br>
		调动情况:${c.conditions }<br>
  		简介:${c.introduction}<br>
  	
  	
  	</c:forEach>
  
  </table>
  </body>
</html>
