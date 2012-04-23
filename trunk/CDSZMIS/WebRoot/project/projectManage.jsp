<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
 	<link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<script type="text/javascript">

	function deldepart() {
		//alert($("#departid").val());
		window.location.href = "${roturl }/project/pro_projectmanage?project.id="+$("#projectid").val()+"&isdel=true";
	}
	//function departdetil(){
	// alert("asdfasdf");
	// onclick="departdetil()
	//}
	
	$(document).ready(function(){
		 $(".dpid").click(function(){
			 
		$("#departid").val($.trim($(this).parent().parent().children().eq(1).html()));	
        $("#departname").val($.trim($(this).parent().parent().children().eq(2).html()));	
        $("#departowner").val($.trim($(this).parent().parent().children().eq(4).html()));	
        $("#departphonenumber").val($.trim($(this).parent().parent().children().eq(3).html()));	
        $("#departnode").val($.trim($(this).parent().parent().children().eq(6).html()));	
        $("#responsibility").val($.trim($(this).parent().parent().children().eq(7).html()));			 
			 
		});
	});
</script>
  </head>
  
  <body>
   任务进度管理<br>
   <form action="${roturl }/project/pro_projectmanage" method="get">

	<table id="detil">
		<tr style="border-bottom-color: #FFF;border-bottom-style: solid;border-bottom: 1px;">
			<td> 项目名称：</td><td> <input id="projectname" type="text" name="project.projectname" value=""/></td>
		</tr>
		<tr>
			<td> 委托单位：</td><td> <input  id="commissionedname" type="text" name="project.commissionedname"/></td>
		</tr>
		<tr>
			<td> 联系电话：</td><td> <input id="contactphone" type="text" name="project.contactphone"/></td>
		</tr>
		<tr>
			<td> 项目状态：</td><td> 
			<label name="project.status">
			<input type="radio" name="project.status" value="1"/ checked="checked">施工图
			<input type="radio" name="project.status" value="2"/>院长签发
			<input type="radio" name="project.status" value="3"/>出版
			<input type="radio" name="project.status" value="4"/>发行
			<input type="radio" name="project.status" value="5"/>项目结束
			 </label>
			</td>  
		</tr>
	</table>
	  
     <input id="projectid" name="projectt.id" type="hidden" value=""></input>
	 <input  type="submit" value="添加"/> <input  type="submit" value="修改"/> <input  type="button" onclick="deldepart()" value="删除"/><br>
	</form>
	<table name="dplist" width="90%;" align="center">
	 <tr>
		<td  width="40px;">选择</td>
		<td  width="40px;">ID</td>
		<td>	 部门名称  </td>
		<td>部门电话</td>
		<td> 负责人</td>
		<td> 部门状态 </td>
		<td>部门简介  </td> 
		<td>职责描述  </td> 
	</tr>
	   <c:forEach items="${alldepart }" var="ls">
		   <tr  >
			   
			<td width="30px;"><input class="dpid" type="radio" name="dpid"/></td> 
			<td  width="40px;"> ${ls.id }</td>
			<td>	${ls.projectname }</td>
			<td>${ls.commissionedname} </td>
			<td> ${ls.contactphone }</td>
			<td> <c:if test="${ls.status ==1}"> 施工图</c:if> <c:if test="${ls.status ==2}">未激活</c:if></td> 

  
		   </tr>
	   </c:forEach>
   </table>
   
  </body>
</html>
