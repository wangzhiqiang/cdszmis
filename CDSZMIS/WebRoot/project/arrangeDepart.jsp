<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js">
function delproject() {
		//alert($("#departid").val());
		window.location.href = "${roturl }/project/pro_projectmanage?project.id="+$("#projectid").val()+"&isdel=true";
	}
	$(document).ready(function(){
		 $(".pjdid").click(function(){
			       
		$("#projectpersonid").val($.trim($(this).parent().parent().children().eq(1).html()));	
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

<body>
	ArrangeDepart
	<form action="/project/pro_arrangeDepart" method="get">
	<table>
		
		<tr>
			<td>项目ID</td><td><input id="projectid" name="pdaentity.projectid" type="text"  /></td>
		</tr>
		<tr>
			<td>项目名称</td><td><input id="name" name="pdaentity.name" type="text" /></td>
		</tr>
		<tr>
			<td>项目所级</td>
			<td>
			<label name="pdaentity.departids">
			<input name="pdaentity.departids" type="radio" value="1" checked="checked"/>一所
			<input  name="pdaentity.departids" type="radio" value="2" />二所
			<input  name="pdaentity.departids" type="radio" value="3" />三所
			</label>
			</td>
		</tr>
		<tr>
			<td>下达时间</td><td><input    id="startdate" name="pdaentity.startdate" type="text" /></td>
		</tr>
		<tr>
			<td>结束时间</td><td><input id="designdate" name="pdaentity.designdate" type="text" /></td>
		</tr>
		<tr>
			<td>审查结束时间</td><td><input id="examinationedate"  name="pdaentity.examinationedate" type="text" /></td>
		</tr>
		<tr>
			<td>签字时间</td><td><input id="money" name="pdaentity.money" type="text" /></td>
		</tr>
	
		<tr>
			<td>签订时间</td><td><input id="signdate" name="pdaentity.signdate" type="text" /></td>
		</tr>
		<tr>
			<td>出版结束时间</td><td><input id="publicationdate" name="pdaentity.publicationdate" type="text" /></td>
		</tr>
		<tr>
			<td>指导样意见</td><td><input id="suggestion" name="pdaentity.suggestion" type="text" /></td>
		</tr>
		<tr>
			<td>填报时间</td><td><input id="reportdate" name="pdaentity.reportdate" type="text" /></td>
		</tr>
		<tr>
			<td>填报人</td><td><input id="reportperson" name="pdaentity.reportperson" type="text" /></td>
		</tr>

	</table>
	<input id="projectpersonid" name="pdaentity.id" type="hidden" value=""></input>
	 <input  type="submit" value="所级安排"/> <br>
</form>
	
	<table name="pjlist" width="90%;" align="center">
　　<tr>
		<td  width="40px;">选择</td>
		<td  width="40px;">ID</td>
		<td>项目编号  </td>
		<td>项目名称</td>
		<td>委托单位</td>
		<td>联系人 </td>
		<td>联系电话  </td> 
		<td>费率</td> 
		<td>金额  </td>
		<td>重要性</td>
		<td>签订时间</td>
		<td>启动时间 </td>
		<td>结束时间  </td> 
		<td>项目情况</td> 
		<td>填报时间 </td>
		<td>填报人</td>
	</tr>
	   <c:forEach items="${allnoarrangdepart }" var="ls">
		   <tr  >
			   
			<td width="30px;"><input class="pjdid" type="radio" name="pjdid"/></td> 
			<td  width="40px;"> ${ls.id }</td>
			<td>${ls.projectid }</td>
			<td>${ls.prijectname } </td>
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
