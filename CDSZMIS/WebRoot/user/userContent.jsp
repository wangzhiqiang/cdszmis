<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>用户详细信息</title>
    <link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
</head>
  
  <body> 
  <div class="table" style="width: 400px;">
  	<c:forEach items="${content}" var="c">
  		
			<div class='tr' style="width: 305px; ">
				<div class="td" style="font-size: 16;width: 138px;">用户名:</div>
				<div class="td" style="font-size: 16;width: 145px;">${c.usname }</div>
			</div> 
			
			<div class='tr' style="width: 305px;">
				<div class="td" style="font-size: 16;width: 138px;">登录名:</div>
				<div class='td' style="font-size: 16;width: 145px;">${c.loginname }</div>
			</div> 
			
			<div class='tr' style="width: 305px;">
				<div class="td" style="font-size: 16;width: 138px;">性别:</div>
				<div class='td' style="font-size: 16;width: 145px;">${c.gender }</div>
			</div> 
			
			<div class='tr' style="width: 305px;">
				<div class="td" style="font-size: 16;width: 138px;">邮箱:</div>
				<div class=td style="font-size: 16;width: 145px;">${c.email}</div>
			</div> 
			
			<div class='tr' style="width: 305px;">
					<div class="td" style="font-size: 16;width: 138px;">手机:</div>
				<div class=td style="font-size: 16;width: 145px;">${c.phone}</div>
			</div> 
			
			<div class='tr' style="width: 305px;">
			<div class="td" style="font-size: 16;width: 138px;">办公室电话:</div>
			<div class=td style="font-size: 16;width: 145px;">${c.officenum}</div>
			</div> 
			
			<div class='tr' style="width: 305px;">
			<div class="td" style="font-size: 16;width: 138px;">身份证:</div>
			<div class=td style="font-size: 16;width: 145px;">${c.idcard}</div>
			</div> 
			
			<div class='tr' style="width: 305px;">
			<div class="td" style="font-size: 16;width: 138px;">出生日期:</div>
			<div class=td style="font-size: 16;width: 145px;overflow: hidden;">${c.birthday}</div>
			</div> 

			<div class='tr' style="width: 305px;">
				<div class="td" style="font-size: 16;width: 138px;">	用户组:	</div>
				<div class="td" style="font-size: 16;width: 145px;"><c:forEach items="${c.userGroupEntity }" var="u"> ${u.groupname} </c:forEach></div>
			</div>
			<div class='tr' style="width: 305px;">
					<div class="td" style="font-size: 16;width: 138px;">部门:</div>
					<div class="td" style="font-size: 16;width: 145px;"><c:forEach items="${departlist}" var="dl"> <c:if test="${c.usdeparts == dl.id }">${dl.departname}</c:if></c:forEach></div>
			</div>
			<div class='tr' style="width: 145px;">
				<div class="td" style="font-size: 16;width: 135px;">调动情况:</div>
			</div>
			<textarea style="width:300px;max-width: 400px;border: 1px solid #CCC; max-height: 250px"> ${c.conditions } </textarea>

			<div class='tr' style="width: 145px;">
				<div class="td" style="font-size: 16;width: 135px;">简介:</div>
			</div>
			<textarea style="width:300px;max-width: 400px;border: 1px solid #CCC; max-height: 250px"> ${c.introduction}</textarea>
  			
  	</c:forEach>
  
 	</div>
  </body>
</html>
