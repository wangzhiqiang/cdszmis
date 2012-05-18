<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>项目状态查询</title>
     <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
 	<link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>

  </head>
  
  <body>

  <div class="rigthtitle">项目状态查询</div>
  <form action="/project/pro_projectStatus" method="post">
	    <div class="tr" style="width: 90%">
		 	<div class='td'style="width: 60px;">项目编号</div>
		 	<div class='td'style="width: 155px;height:25px;line-height: 24px;"><input type='text' name='project.serialnumbers' style="padding: 1px;" /></div>
		 	<div class='td'style="width: 60px;">项目状态</div>
		 	<div class='td'style="width: 100px;height:25px;line-height: 24px;">
			<select name="projectstatus.status">
			<option value='0'>任务下达</option>
			<option value='1'>方案</option>
			<option value='2'>初设</option>
			<option value='3'>施工图</option>
			<option value='4'>院长签发</option>
			<option value='5'>出版</option>
			<option value='6'>发行</option>
			<option value='7'>项目结束</option>
			<option value='8'>归档</option>
			</select>
			</div>
			<div class='td'style="width: 60px;"><input type='submit' value="查询"/></div>
	    </div>
  </form>
 <div class="table" style="width: 716px;" >
  	<div class='hd' style="width: 716px;">
  	  <div class="td" style="width: 100px;">项目编号 </div>
  	  <div class="td" style="width: 180px;">项目名称 </div>
  	  <div class="td" style="width: 100px;">项目状态 </div>
  	   <div class="td" style="width: 180px;">委托单位 </div>
  	  <div class="td" style="width: 100px;">重要性 </div>
	</div>
	<c:forEach items="${lsp}" var="prs">
	  	<div class='tr'style="width: 715px;">
	  	  <div class="td" style="width: 100px;">${prs.projectEntity.serialnumbers } </div>
	  	  <div class="td" style="width: 180px;">${prs.projectEntity.prijectname } </div>
	  	  <div class="td" style="width: 100px;">
	  	      <c:if test="${prs.status==0 }">任务下达</c:if> 
	  		  <c:if test="${prs.status==1 }">方案</c:if> 
	  		  <c:if test="${prs.status==2 }">初设</c:if> 
	  		  <c:if test="${prs.status==3 }">施工图</c:if>
	  		  <c:if test="${prs.status==4 }">院长签发</c:if> 
	  		  <c:if test="${prs.status==5 }">出版</c:if>
	  		  <c:if test="${prs.status==6 }">发行</c:if> 
	  		  <c:if test="${prs.status==7 }">项目结束</c:if>  
	  		  <c:if test="${prs.status==8 }">归档</c:if> 
	  	  </div>
	  	   <div class="td" style="width: 180px;">${prs.projectEntity.commissionedname} </div>
	  	  <div class="td" style="width: 100px;">${prs.projectEntity.important}</div>
		</div>
	</c:forEach>
	
</div>

  </body>
</html>
