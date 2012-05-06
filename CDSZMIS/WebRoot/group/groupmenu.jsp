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
  <table>
  <tr>
		  <td width="20"> <input type="checkbox" /> </td><td width="25">ID </td><td width="60">  用户组</td><td>用户组权限空间</td><td style="display:none;"> 用户组控制菜单</td>
</tr>
  <c:forEach items="${allgroup }" var="group">
	  <tr>
		  <td> <input type="checkbox"value=''/> </td><td>${group.id } </td><td> ${group.groupname }</td><td>${group.namespace }</td>
		  <td style="display:none;"> 
		  <c:forEach items="${group.menSysMenuEntities }" var="g" varStatus="stat" >
	     ${g.id }<c:if test="${!stat.last}">,</c:if>
	     </c:forEach></td>
	  </tr>
   </c:forEach>
   </table>
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
   
   
   <script>
   
   $(function (){
	   $':checkbox').cilck(function (){
		   alert("sd");
		   
	   });
	   
   });
   
   </script>
  </body>
</html>
