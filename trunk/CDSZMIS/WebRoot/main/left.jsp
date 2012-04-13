<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>left</title>
 
 <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<script type="text/JavaScript">
	$(document).ready(function(){
		 $("h1").click(function(){
			/*if ($(this).next().hasClass("no")) {
				$(this).next().removeClass("no");
				$(this).parent().find('span').slideUp();
				$(this).next().slideDown();
			} else {
				$(this).next().addClass("no");
				$(this).parent().find('span').slideUp();
			}*/
			$(this).parent().find('span').slideUp();
				$(this).next().slideDown();
		});
		$(".h2").click(function() {
		/*if ($(this).next().hasClass("no")) {
				$(this).next().removeClass("no");
				$(this).parent().find('ul').slideUp();
				$(this).next().slideDown();
			} else {
				$(this).next().addClass("no");
				$(this).parent().find('ul').slideUp();
				 
			}*/
			$(this).parent().find('ul').slideUp();
				$(this).next().slideDown();
		});
	});
</script>
</head>
<body>
 
<div id="menu">
<c:forEach items="${menu}" var="m1">
		<c:if test="${m1.value.pid==0 }">
			<h1 class="h1"> ${m1.value.menuname }</h1>
			 <span id="NO${m1.key}" class="no">
			 <img src="${rooturl}/images/menu_topline.gif" width="182" height="5" style="margin-left:5%;margin-top: 0px;"/>
			<c:forEach items="${menu}" var="m2">
				<c:if test="${m2.value.pid==m1.value.id }">
                 <h2 class="h2"> -&nbsp; ${m2.value.menuname }</h2>
                  <ul id="NO${m1.key}${m2.key}" class="no">
	                 <c:forEach items="${menu }" var="m3">
	                 <c:if test="${m3.value.pid==m2.value.id }">
	                 <li><a href="${m3.value.url }" target="main">${m3.value.menuname }</a></li>
	                 </c:if>
	                 </c:forEach>
                   </ul>
				</c:if>
			</c:forEach>
			</span>
		 </c:if>
	</c:forEach>
 
</div>
</body>
</html>

 
