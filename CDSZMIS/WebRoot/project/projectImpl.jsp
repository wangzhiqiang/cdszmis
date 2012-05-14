<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
 	<link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
 	<link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		 $(".pjsid").click(function(){
			 
		$("#pstatusid").val($.trim($(this).parent().parent().children().eq(1).html()));	
        $("#projectid").val($.trim($(this).parent().parent().children().eq(2).html()));	   
        $("#history").val($.trim($(this).parent().parent().children().eq(4).html()));	
        $("#createdate").val($.trim($(this).parent().parent().children().eq(5).html()));	
        $("#reportdate").val($.trim($(this).parent().parent().children().eq(6).html()));	
        $("#reportperson").val($.trim($(this).parent().parent().children().eq(7).html()));			 
			 
		});
	});
</script>
  </head>
  
  <body>
   ProjectImpl<br>
   <form action="${rooturl }/project/pro_projectImpl" method="get">

	<table id="detil">
		<tr style="border-bottom-color: #FFF;border-bottom-style: solid;border-bottom: 1px;">
			<td >项目ID</td><td> <input id="projectid" type="text" name="projectstatus.projectid" value=""/></td>
		</tr>
		<tr>
			<td> 项目状态</td><td><label name="projectstatus.status">
			<input name="projectstatus.status" type="radio" value="0" />方案
			<input  name="projectstatus.status" type="radio" value="1" />初设
			<input  name="projectstatus.status" type="radio" value="2" />施工图
			</label></td>
		</tr>
		<tr>
			<td >状态更新 </td><td> <input id="history" type="text" name="projectstatus.history" style="readonly"/></td>
		</tr>
		<tr>
			<td >创建时间</td><td> <input id="createdate" type="text" name="projectstatus.createdate"/> 
			
			</td>  
		</tr>
		<tr>
			<td >填报时间</td><td> <input id="reportdate" type="text" name="projectstatus.reportdate" /></td>
		</tr>
		<tr>
			<td > 填报人</td><td> <input id="reportperson" type="text" name="projectstatus.responsibility" ></td> 
		</tr>
	</table>
	  
     <input id="pstatusid" name="projectstatus.id" type="hidden" value=""></input>
	 <input  type="submit" value="提交"/><br>
	</form>
	<table name="pjlist" width="90%;" align="center">
	 <tr>
		<td  width="40px;">选择</td>
		<td  width="40px;">ID</td>
		<td>项目ID</td>
		<td>项目状态</td>
		<td>状态更新</td>
		<td>创建时间</td>
		<td>填报时间 </td> 
		<td>填报人</td> 
	</tr>
	   <c:forEach items="${allproject }" var="ls">
		   <tr  >
			   
			<td width="30px;"><input class="pjsid" type="radio" name="pjsid"/></td> 
			<td  width="40px;"> ${ls.id }</td>
			<td>${ls.projectid }</td>
			<td> <c:if test="${ls.status ==0}">方案</c:if> <c:if test="${ls.status ==1}">初设</c:if>
			<c:if test="${ls.status ==2}">施工图</c:if> <c:if test="${ls.status ==3}">院长签发</c:if>
			<c:if test="${ls.status ==4}">出版</c:if> <c:if test="${ls.status ==5}">发行</c:if>
			<c:if test="${ls.status ==6}">结束</c:if> <c:if test="${ls.status ==7}">归档</c:if>
			</td> 
			<td> ${ls.history }</td>
			<td>${ls.createdate }</td>
			<td>${ls.reportdate }</td> 
			<td>${ls.reportperson }</td> 
			
			   
		   </tr>
	   </c:forEach>
   </table>
   
  </body>
</html>
