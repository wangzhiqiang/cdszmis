<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>按部门统计</title>
  </head>
  <body>
   部门统计
   <c:forEach items="${lsp}" var="pro">
   ${pro.id }:${pro.departids }
   
   </c:forEach>
   
   
   <img src="/project/pro_barPic"/>
   
  </body>
</html>
