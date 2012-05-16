<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
 <link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		 $(".pjdid").click(function(){
			       
		$("#id").val($.trim($(this).parent().parent().children().eq(1).html()));	
        $("#projectid").val($.trim($(this).parent().parent().children().eq(2).html()));	
        $("#name").val($.trim($(this).parent().parent().children().eq(3).html()));	
        $("#startdate").val($.trim($(this).parent().parent().children().eq(5).html()));	
        $("#designdate").val($.trim($(this).parent().parent().children().eq(6).html()));			 
	    $("#examinationedate").val($.trim($(this).parent().parent().children().eq(7).html()));	 
	    $("#signdate").val($.trim($(this).parent().parent().children().eq(8).html()));
		$("#publicationdate").val($.trim($(this).parent().parent().children().eq(9).html()));
		$("#suggestion").val($.trim($(this).parent().parent().children().eq(10).html()));
		$("#reportdate").val($.trim($(this).parent().parent().children().eq(11).html()));
		$("#reportperson").val($.trim($(this).parent().parent().children().eq(12).html()));
		});
	});
</script>
<html>
<head>


<title>Arrange</title>



</head>

<body>&nbsp; 
	ArrangeDepart 
	<form action="${rooturl }/project/pro_arrangeDepartids" method="get">
	<table>
		
		<tr>
			<td>项目ID</td><td><input id="projectid" name="paentity.projectid" type="text"  /></td>
		</tr>
		<tr>
			<td>项目名称</td><td><input id="name" name="paentity.name" type="text" /></td>
		</tr>
		<tr>
			<td>项目所级</td>
			<td>
			<label name="paentity.departids">
			<input  name="paentity.departids" type="radio" value="1"  />一所
			<input  name="paentity.departids" type="radio" value="2" />二所
			<input  name="paentity.departids" type="radio" value="3" />三所
			</label>
			</td>
		</tr>
		<tr>
			<td>下达时间</td><td><input  id="startdate" name="paentity.startdate" type="text" /></td>
		</tr>
		<tr>
			<td>结束时间</td><td><input id="designdate" name="paentity.designdate" type="text" /></td>
		</tr>
		<tr>
			<td>审查结束时间</td><td><input id="examinationedate"  name="paentity.examinationedate" type="text" /></td>
		</tr>
		<tr>
			<td>签字时间</td><td><input id="signdate" name="paentity.signdate" type="text" /></td>
		</tr>
		<tr>
			<td>出版结束时间</td><td><input id="publicationdate" name="paentity.publicationdate" type="text" /></td>
		</tr>
		<tr>
			<td>指导意见</td><td><input id="suggestion" name="paentity.suggestion" type="text" /></td>
		</tr>
		<tr>
			<td>填报时间</td><td><input id="reportdate" name="paentity.reportdate" type="text" /></td>
		</tr>
		<tr>
			<td>填报人</td><td><input id="reportperson" name="paentity.reportperson" type="text" /></td>
		</tr>

	</table>
	<input id="id" name="paentity.id" type="hidden" value=""></input>
	 <input  type="submit" value="所级安排"/> <br>
</form>
	
	<table name="pjlist" width="90%;" align="center">
　　<tr>
		<td  width="40px;">选择</td>
		<td  width="40px;">ID</td>
		<td>项目ID</td>
		<td>项目名称</td>
		<td>项目所级  </td>
		<td>下达时间</td>
		<td>结束时间 </td>
		<td>审查结束时间  </td> 
		<td>签字时间</td> 
		<td>出版结束时间</td>
		<td>指导意见</td>
		<td>填报时间 </td>
		<td>填报人 </td> 
	</tr>
	   <c:forEach items="${lsp }" var="ls">
		   <tr  >
			   
			<td width="30px;"><input class="pjdid" type="radio" name="pjdid"/></td> 
			<td  width="40px;"> ${ls.id }</td>
			<td>${ls.projectid }</td>
			<td>${ls.name }</td>
		   <td> <c:if test="${ls.departids ==1}">一所</c:if> <c:if test="${ls.departids ==2}">二所</c:if><c:if test="${ls.departids ==3}">三所</c:if></td> 
			<td>${ls.startdate } </td>
			<td>${ls.designdate }</td>
			<td>${ls.examinationedate}</td>
			<td>${ls.signdate }</td>
			<td>${ls.publicationdate } </td>
			<td>${ls.suggestion }</td>
			<td>${ls.reportdate }</td>
			<td>${ls.reportperson } </td>
	
		   </tr>
	   </c:forEach>
   </table>
</body>
</html>
