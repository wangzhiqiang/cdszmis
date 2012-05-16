<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
    <title>项目进度查询</title>
    <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
 	<link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>

  </head>
  <body>
   <div class="rigthtitle">项目进度查询</div>
   <form action="/project/pro_projectProgress" method="post">
	    <div class="tr" style="width: 90%">
		 	<div class='td'style="width: 60px;">项目编号</div>
		 	<div class='td'style="width: 155px;height:25px;line-height: 24px;"><input type='text' name='project.serialnumbers' style="padding: 1px;" /></div>
		 	<div class='td'style="width: 60px;">项目名称</div>
		 	<div class='td'style="width: 155px;height:25px;line-height: 24px;"><input type='text' name='project.prijectname' style="padding: 1px;" /></div>
		 <div class='td'style="width: 100px;height:25px;line-height: 24px;">
			<select name="projectstatus.status">
			<option value='0'>方案</option>
			<option value='1'>初设</option>
			<option value='2'>施工图</option>
			<option value='3'>院长签发</option>
			<option value='4'>出版</option>
			<option value='5'>发行</option>
			<option value='6'>项目结束</option>
			<option value='7'>归档</option>
			</select>
		</div>
			<div class='td'style="width: 60px;"><input type='submit' value="查询"/></div>
	    </div>
   </form>
   <div class="table" style="width: 716px;" >
  	<div class='hd' style="width: 716px;">
  	  <div class="td" style="width: 100px;">项目编号 </div>
  	  <div class="td" style="width: 100px;">项目名称 </div>
  	  <div class="td" style="width: 100px;">项目状态 </div>
  	  <div class="td" style="width: 180px;">项目启动时间 </div>
  	  <div class="td" style="width: 180px;">合同结束时间 </div>
  	  
	</div>
   <c:forEach items="${lsp}" var="prs">
	  	<div class='tr'style="width: 715px;">
	  	  <div class="td" style="width: 100px;">${prs.projectEntity.serialnumbers } </div>
	  	  <div class="td" style="width: 100px;">${prs.projectEntity.prijectname } </div>
	  	   <div class="td" style="width: 100px;">
	  		  <c:if test="${prs.status==0 }">方案</c:if> 
	  		  <c:if test="${prs.status==1 }">初设</c:if> 
	  		  <c:if test="${prs.status==2 }">施工图</c:if>
	  		  <c:if test="${prs.status==3 }">院长签发</c:if> 
	  		  <c:if test="${prs.status==4 }">出版</c:if>
	  		  <c:if test="${prs.status==5 }">发行</c:if> 
	  		  <c:if test="${prs.status==6 }">项目结束</c:if>  
	  		  <c:if test="${prs.status==7 }">归档</c:if> 
	  	  </div>
	  	  <div class="td" style="width: 180px;">${prs.projectEntity.startdate} </div>
	  	  <div class="td" style="width: 180px;">${prs.projectEntity.enddate}</div>
		</div>
	</c:forEach>
   
   </div>


  </body>
</html>
