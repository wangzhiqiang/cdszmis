<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
 <link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>用户信息查询</title>

  </head>
  
  <body>
  
<form action="/user/user_userSelect" method="post">
	查询关键字<input type="text" name="keyword">
		   <input type="submit" value="查询">(学号 、姓名)
</form>


<table border="1" width="80%">
	<tr>
		<td>姓名</td>
		<td>性别</td>
		<td>身份证</td>

	</tr>
	<c:forEach items="${list}" var="l">
	<tr>
		<td><a href="/user/user_userContent?idcard=${l.idcard}" >${l.usname}</td>
		<td>${l.gender }</td>
		<td>${l.idcard }</td>
	</tr>
	</c:forEach>
</table>
  </body>
</html>
