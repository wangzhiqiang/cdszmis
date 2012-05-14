<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
<link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
</head>

<body>
	<div>
		<br>
		<br>
		<form action='/depart/depart_findallDepart' method="post">
			部门名称 :<input type='text' name='depart.departname'> 负责人 :<input
				type='text' name='depart.departowner'> <input type='submit'
				name=submit value='查询'> <br>
			<br>
		</form>
		<div>
		<div class="table" name="dplist" >
	 <div class='hd'>
		<div class='td'  style="width: 40px;">选择</div>
		<div class='td'  style="width: 40px;">ID</div>
		<div class='td' style="width: 80px;">	 部门名称  </div>
		<div class='td' style="width: 70px;">部门电话</div>
		<div class='td' style="width: 70px;"> 负责人</div>
		<div class='td' style="width: 70px;"> 部门状态 </div>
		<div class='td' style="width: 210px;">部门简介  </div> 
		<div class='td'style="width: 232px;">职责描述  </div>
	</div>
	   <c:forEach items="${alldepart }" var="ls">
		   <div class='tr'>
			<div class='td'  style="width: 40px;"><input class="dpid" type="radio" name="dpid"/></div>
			<div class='td'  style="width: 40px;"> ${ls.id }</div>
			<div class='td' style="width: 80px;">${ls.departname }</div>
			<div class='td' style="width: 70px;">${ls.departphonenumber } </div>
			<div class='td' style="width: 70px;">${ls.departowner }</div>
			<div class='td' style="width: 70px;"><c:if test="${ls.status ==0}">  激活</c:if> <c:if test="${ls.status !=0}">未激活</c:if></div>
			<div class='td' style="width: 210px;">${ls.departnode }  </div>
			<div class='td'style="width: 232px;">${ls.responsibility }   </div>
		   </div>
	   </c:forEach>
   </div>
			 
</body>
</html>
