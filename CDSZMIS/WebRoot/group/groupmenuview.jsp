<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body> 
 <c:forEach items="${lsm }" var='menu'>
    <div style="width: 150px;height: 25px;line-height: 24px; font-size: 14px;margin: 2px 2px 2px 2px;float: left">${menu.menuname }</div>
 </c:forEach>
</body>
</html>
