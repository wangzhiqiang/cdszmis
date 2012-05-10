<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<script type="text/javascript">
function delproject() {
		//alert($("#departid").val());
		window.location.href = "${roturl }/project/pro_projectmanage?project.id="+$("#projectid").val()+"&isdel=true";
	}
	$(document).ready(function(){
		 $(".pjid").click(function(){
			       
		$("#projectid").val($.trim($(this).parent().parent().children().eq(1).html()));	
        $("#serialnumbers").val($.trim($(this).parent().parent().children().eq(2).html()));	
        $("#prijectname").val($.trim($(this).parent().parent().children().eq(3).html()));	
        $("#commissionedname").val($.trim($(this).parent().parent().children().eq(4).html()));	
        $("#contactperson").val($.trim($(this).parent().parent().children().eq(5).html()));	
        $("#contactphone").val($.trim($(this).parent().parent().children().eq(6).html()));			 
	    $("#rate").val($.trim($(this).parent().parent().children().eq(7).html()));	 
	    $("#money").val($.trim($(this).parent().parent().children().eq(8).html()));
		$("#contractdate").val($.trim($(this).parent().parent().children().eq(10).html()));
		$("#startdate").val($.trim($(this).parent().parent().children().eq(11).html()));
		$("#enddate").val($.trim($(this).parent().parent().children().eq(12).html()));
		$("#detail").val($.trim($(this).parent().parent().children().eq(13).html()));
		$("#createdate").val($.trim($(this).parent().parent().children().eq(14).html()));
		$("#subperson").val($.trim($(this).parent().parent().children().eq(15).html()));
		});
	});
</script>
<html>
<head>


<title>Registe</title>



</head>

<body>
	ProjectRegiste
	<form action="${rooturl }/project/pro_projectmanage" method="get">
	<table>
		
		<tr>
			<td>项目编号</td><td><input id="serialnumbers" name="project.serialnumbers" type="text" /></td>
		</tr>
		<tr>
			<td>项目名称</td><td><input id="prijectname" name="project.prijectname" type="text" /></td>
		</tr>
		<tr>
			<td>委托单位</td><td><input  id="commissionedname" name="project.commissionedname" type="text" /></td>
		</tr>
		<tr>
			<td>联系人</td><td><input    id="contactperson" name="project.contactperson" type="text" /></td>
		</tr>
		<tr>
			<td>联系电话</td><td><input id="contactphone" name="project.contactphone" type="text" /></td>
		</tr>
		<tr>
			<td>费率</td><td><input id="rate"  name="project.rate" type="text" /></td>
		</tr>
		<tr>
			<td>合同金额</td><td><input id="money" name="project.money" type="text" /></td>
		</tr>
		<tr>
			<td>重要性</td>
			<td>
			<label name="project.important">
			<input name="project.important" type="radio" value="0" checked="checked"/>一般
			<input  name="project.important" type="radio" value="1" />重要
			<input  name="project.important" type="radio" value="2" />紧急
			</label>
			</td>
		</tr>
		<tr>
			<td>签订时间</td><td><input id="contractdate" name="project.contractdate" type="text" /></td>
		</tr>
		<tr>
			<td>启动时间</td><td><input id="startdate" name="project.startdate" type="text" /></td>
		</tr>
		<tr>
			<td>结束时间</td><td><input id="enddate" name="project.enddate" type="text" /></td>
		</tr>
		<tr>
			<td>项目情况</td><td><input id="detail" name="project.detail" type="text" /></td>
		</tr>
		<tr>
			<td>填报时间</td><td><input id="createdate" name="project.createdate" type="text" /></td>
		</tr>
		<tr>
			<td>填报人</td><td><input id="subperson" name="project.subperson" type="text" /></td>
		</tr>

	</table>
	<input id="projectid" name="project.id" type="hidden" value=""></input>
	 <input  type="submit" value="添加"/> <input  type="submit" value="修改"/> <input  type="button" onclick="deldepart()" value="删除"/><br>
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
	   <c:forEach items="${allproject }" var="ls">
		   <tr  >
			   
			<td width="30px;"><input class="pjid" type="radio" name="pjid"/></td> 
			<td  width="40px;"> ${ls.id }</td>
			<td>${ls.serialnumbers }</td>
			<td>${ls.prijectname } </td>
			<td>${ls.commissionedname }</td>
			<td>${ls.contactperson }</td>
			<td>${ls.contactphone } </td>
			<td>${ls.rate }</td>
			<td>${ls.money }</td>
			<td> <c:if test="${ls.important ==0}">一般</c:if> <c:if test="${ls.important ==1}">重要</c:if><c:if test="${ls.important ==2}">紧急</c:if></td> 
			<td>${ls.contractdate }</td>
			<td>${ls.startdate } </td>
			<td>${ls.enddate }</td>
			<td>${ls.detail }</td>
			<td>${ls.createdate } </td>
			<td>${ls.subperson }</td>   
		   </tr>
	   </c:forEach>
   </table>
</body>
</html>
