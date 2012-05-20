<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>文件下载</title>
     <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
 	<link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>

  </head>
  
  <body>
   
   <div class="table"style="width: 500px;">
	   <div class='hd' style="width: 500px;">
	   	<div class="td"style="width: 30px;">
	   		 ID
	   	</div>
	   	<div class="td"style="width: 100px;">
	   		 文件名
	   	</div>
	   	<div class="td"style="width: 100px;">
	   		文件大小
	   	</div>
	   <div class="td"style="width: 100px;">
	   		文件类型
	   	</div>
	   	<div class="td"style="width: 100px;">
	   		 下载
	   	</div>
	   </div>  
	   <c:forEach items="${lsa }" var="a">
	   <div class='tr' style="width: 500px;">
	   	<div class="td"style="width: 30px;">
	   		${a.id }
	   	</div>
	   	<div class="td"style="width: 100px;">
	   		${a.filename }
	   	</div>
	   	<div class="td"style="width: 100px;">
	   		${a.filesize }Bty
	   	</div>
	   <div class="td"style="width: 100px;">
	   		${a.filetype }
	   	</div>
	   	<div class="td"style="width: 100px;">
	   		 <a href="http://localhost:8080/files/srcdownload?id=${a.id }" style="text-decoration: none;">下载</a>
	   	</div>
	   </div>  
	   </c:forEach>
    </div>
   
  </body>
</html>
