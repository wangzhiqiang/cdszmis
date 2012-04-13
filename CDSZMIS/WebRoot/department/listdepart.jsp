<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
	<link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
  </head>
  
  <body>
   <table width="90%;" align="center">
	 <tr>
		<td  width="40px;">选择</td><td  width="40px;">ID</td><td>	 部门名称  </td><td>部门简介  </td><td> 负责人</td> <td> 部门状态 </td> 
	</tr>
	   <c:forEach items="${alldepart }" var="ls">
		   <tr>
			   
			<td width="30px;"><input type="radio" name="dpid" /></td> <td  width="40px;"> ${ls.id }</td>
			<td>	${ls.departname }</td><td>${ls.departnode }  </td><td> ${ls.departowner }</td>
			<td> <c:if test="${ls.status ==0}">激活</c:if> <c:if test="${ls.status !=0}">未激活</c:if></td> 
			   
		   </tr>
	   </c:forEach>
   </table>
  </body>
</html>
