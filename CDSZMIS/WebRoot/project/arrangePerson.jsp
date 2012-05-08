
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js">
	$(document).ready(function(){
		 $(".pjpid").click(function(){
		 
		$("#id").val($.trim($(this).parent().parent().children().eq(1).html()));		       
		$("#projectid").val($.trim($(this).parent().parent().children().eq(2).html()));	
        $("#chargeperson").val($.trim($(this).parent().parent().children().eq(3).html()));	
        $("#suggestion").val($.trim($(this).parent().parent().children().eq(4).html()));	
        $("#reportdate").val($.trim($(this).parent().parent().children().eq(5).html()));	
        $("#reportperson").val($.trim($(this).parent().parent().children().eq(6).html()));	
	    
		});
	});
</script>
<html>
<head>


<title>Arrange</title>



</head>

<body>
	ArrangePerson
	<form action="/project/pro_arrangePerson" method="get">
	<table>
		
		<tr>
			<td>项目ID</td><td><input  id="projectid" name="pdaentity.projectid" type="text" /></td>
		</tr>
		<tr>
			<td>项目负责人</td><td><input id="chargeperson" name="pdaentity.chargeperson" type="text" /></td>
		</tr>
		<tr>
			<td>指导意见</td><td><input  id="suggestion" name="pdaentity.suggestion" type="text" /></td>
		</tr>
		<tr>
			<td>填报时间</td><td><input   id="reportdate" name="pdaentity.reportdate" type="text" /></td>
		</tr>
		<tr>
			<td>填报人</td><td><input  id="reportperson" name="pdaentity.reportperson" type="text" /></td>
		</tr>
		
	</table>
	<input id="id" name="pdaentity.id" type="hidden" value=""></input>
	 <input  type="submit" value="安排负责人"/> <br>
</form>
	
	<table name="pjlist" width="90%;" align="center">
	 <tr>
		<td  width="40px;">选择</td>
		<td  width="40px;">ID</td>
		<td>项目ID  </td>
		<td>项目负责人</td>
		<td>指导意见</td>
		<td>填报时间 </td>
		<td>填报人</td>
	</tr>
	   <c:forEach items="${allnoarrangperson }" var="ls">
		   <tr>   
			<td width="30px;"><input class="pjpid" type="radio" name="pjpid"/></td> 
			<td width="40px;"> ${ls.id }</td>
			<td>${ls.projectid }</td>
			<td>${ls.chargeperson}</td>
			<td>${ls.suggestion }</td>
			<td>${ls.reportdate }</td>
			<td>${ls.reportperson }</td>
		   </tr>
	   </c:forEach>
   </table>
</body>
</html>
