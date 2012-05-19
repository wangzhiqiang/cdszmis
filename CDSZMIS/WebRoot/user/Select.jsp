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
		   <input type="submit" value="查询">(身份证号 、姓名)
</form>


<div class='table' style="width: 516px;margin-left: 5px;">
	<div class='hd' style="width: 100%">
	<div class='td' style="width: 50px;">姓名</div>
	<div class='td' style="width: 50px;">性别</div>
	<div class='td' style="width: 80px;">手机</div>
	<div class='td' style="width: 110px;">身份证</div>
	<div class='td' style="width: 80px;">部门</div>
	<div class='td' style="width: 80px;">状态更改</div>
	</div>
	
	<c:forEach items="${list}" var="l">
	<div class='tr'>
		<div class='td' style="width: 50px;"><a href="/user/user_userContent?ids=${l.id}" >${l.usname}</div>
		<div class='td' style="width: 50px;">${l.gender }</div>
		<div class='td' style="width: 80px;">${l.phone}</div>
		<div class='td' style="width: 110px;">${l.idcard }</div>
		<div class='td' style="width: 80px;">
			<c:forEach items="${departlist}" var="dl">
					<c:if test="${l.usdeparts == dl.id }">${dl.departname}</c:if> 
			</c:forEach>
			</div>
		<div class='td' style="width: 80px;"><c:if test="${l.status ==0}">激活</c:if> <c:if test="${l.status ==1}">未激活</c:if></div>
		
	 </div>
	</c:forEach>
</div>
  </body>
</html>
