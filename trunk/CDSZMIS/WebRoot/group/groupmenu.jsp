<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
     <link href="${rooturl }/styles/groupmenu.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>

  </head>
  
  <body>
    groupmenu\\\\<br/>
  <div class="leftdiv">
  <c:forEach items="${allgroup }" var="group">
 	${group.id }:${group.groupname }:${group.namespace }:
	<c:forEach items="${group.menSysMenuEntities }" var="g" varStatus="stat" >
	  ${g.id }<c:if test="${!stat.last}">,</c:if>
	</c:forEach>
		<br>
   </c:forEach>
  </div>
 <div class="centerdiv"></div>
   
  <div class="rightdiv">
   <c:forEach items="${allmenu }" var="menu1">
   	<c:if test="${menu1.pid==0 }"> ${menu1.id }:${menu1.menuname }<br/>
	   	<c:forEach items="${allmenu }" var="menu2">
	   		<c:if test="${menu2.pid==menu1.id }">${menu2.id }:${menu2.menuname }<br/>
		   		<c:forEach items="${allmenu }" var="menu3">
		   			<c:if test="${menu3.pid==menu2.id}">${menu3.id }:${menu3.menuname }<br/></c:if>
	   			</c:forEach>
   			</c:if>
	   </c:forEach>
	 </c:if>
   </c:forEach>
   </div>
  </body>
</html>
