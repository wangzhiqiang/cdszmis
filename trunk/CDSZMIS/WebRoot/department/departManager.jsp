<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
 	<link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
 	<link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<script type="text/javascript">

	function deldepart() {
		//alert($("#departid").val());
		window.location.href = "${roturl }/depart/depart_departmanager?depart.id="+$("#departid").val()+"&isdel=true";
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
   部门管理<br>
   <form action="${roturl }/depart/depart_departmanager" method="get">

	<table id="detil" style="margin-top: 10px;">
		<tr style="border-bottom-color: #FFF;border-bottom-style: solid;border-bottom: 1px;">
			<td> 部门名称：</td><td> <input id="departname" type="text" name="depart.departname" value=""/></td>
		</tr>
		<tr>
			<td> 部门负责人：</td><td> <input  id="departowner" type="text" name="depart.departowner"/></td>
		</tr>
		<tr>
			<td> 部门电话：</td><td> <input id="departphonenumber" type="text" name="depart.departphonenumber"/></td>
		</tr>
		<tr>
			<td> 部门状态：</td><td> 
			<label name="depart.status">
			<input type="radio" name="depart.status" value="0"/ checked="checked">激活
			<input type="radio" name="depart.status" value="1"/>注销
			 </label>
			</td>  
		</tr>
		<tr>
			<td> 部门简介：</td><td> <textarea id="departnode" name="depart.departnode" style="width: 200px;height: 80px;"></textarea></td>
		</tr>
		<tr>
			<td> 职责描述：</td><td> <textarea id="responsibility" name="depart.responsibility" style="width: 200px;height: 80px;"></textarea></td> 
		</tr>
	</table>
	  
     <input id="departid" name="depart.id" type="hidden" value=""></input>
	 <input  type="submit" value="添加"/> <input  type="submit" value="修改"/> <input  type="button" onclick="deldepart()" value="删除"/><br>
	</form>
	<div class="table" name="dplist" >
	 <div class='tr'>
		<div class='td'  style="width: 40px;">选择</div>
		<div class='td'  style="width: 40px;">ID</div>
		<div class='td' style="width: 80px;">	 部门名称  </div>
		<div class='td' style="width: 70px;">部门电话</div>
		<div class='td' style="width: 70px;"> 负责人</div>
		<div class='td' style="width: 70px;"> 部门状态 </div>
		<div class='td' style="width: 210px;">部门简介  </div> 
		<div class='td'style="width: 232px;">职责描述  </div>
	</div>
	   <c:forEach items="${alldepart }" var="ls">
		   <div class='tr'>
			<div class='td'  style="width: 40px;"><input class="dpid" type="radio" name="dpid"/></div>
			<div class='td'  style="width: 40px;"> ${ls.id }</div>
			<div class='td' style="width: 80px;">${ls.departname }</div>
			<div class='td' style="width: 70px;">${ls.departphonenumber } </div>
			<div class='td' style="width: 70px;">${ls.departowner }</div>
			<div class='td' style="width: 70px;"><c:if test="${ls.status ==0}">  激活</c:if> <c:if test="${ls.status !=0}">未激活</c:if></div>
			<div class='td' style="width: 210px;">${ls.departnode }  </div>
			<div class='td'style="width: 232px;">${ls.responsibility }   </div>
		   </div>
	   </c:forEach>
   </div>
   
  </body>
</html>
