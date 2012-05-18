<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  	<head>
	 	<link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
		<link href="${rooturl }/scripts/jquery/jquery.multiSelect.css" rel="stylesheet" type="text/css" />
		<link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
		<link href="${rooturl }/styles/groupmenu.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
		<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery.bgiframe.min.js"></script>
		<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery.multiSelect.js"></script>
		<script language="JavaScript" src="${rooturl }/scripts/thickbox.js"></script>
		<link href="${rooturl }/styles/thickbox.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<div class='rigthtitle'>用户分配</div>
	<div style="width: 100%; margin: 5px 0px 5px 20px;">
		<form action="/usergroup/group_groupUser" method="post">
		<input name="userid" id="userid" type='hidden' value=""/>
		<input name="groupids" id="groupids" type='hidden' value=""/>
		<input id="submit" type='submit' value="保存"/>
		</form>
	</div>
	<div class="leftdiv">
		<div class='table' style="width: 484px;margin-left: 5px;" >
				<div class='hd'style="width:100%">
					<div class='td' style="width: 50px">选择</div>
					<div class='td' style="width: 30px">ID</div>
					<div class='td' style="width: 50px">用户名</div>
					<div class='td' style="width: 50px">登录名</div>
					<div class='td' style="width: 249px;overflow: hidden;">用户组</div>
				</div>
			<c:forEach items="${lsu }" var="user" >
	 			<div class='tr'style="width:100%">
					<div class='td' style="width: 50px"><input class='radio'type="radio" name='radio' value="${user.id }"></div>
					<div class='td' style="width: 30px">${user.id }</div>
					<div class='td' style="width: 50px">${user.usname }</div>
					<div class='td' style="width: 50px">${user.loginname }</div>
					<div class='td' style="width: 249px;overflow: hidden;"><c:forEach items="${user.userGroupEntity }" var="ug">${ug.groupname} </c:forEach></div>
					<div class='groupids' style="display: none;"><c:forEach items="${user.userGroupEntity }" var="ug" varStatus="stat">${ug.id}<c:if test="${!stat.last}">,</c:if></c:forEach></div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="centerdiv"></div>

	<div class="rightdiv">
		<div class='table' style="width: 490px;margin-left: 5px;">
			<div class='hd' style="width: 100%">
				<div class='td' style="width: 50px;">选择</div>
				<div class='td' style="width: 30px;">ID</div>
				<div class='td' style="width: 80px;">用户组名称</div>
				<div class='td' style="width: 143px;">权限空间</div>
				<div class='td' style="width: 90px;">用户组菜单ID</div>
				<div class='td' style="width: 30px;">操作</div>
			</div>
			<c:forEach items="${lsg }" var="group" >
		 		<div class='tr'>
				  <div class='td'style="width: 50px;"><input class='gid'id='gid${group.id }' type="checkbox"  name="checkbox" value="${group.id }"/></div>
				    <div class='td' style="width: 30px;">${group.id }</div>
				    <div class='td'style="width: 80px;">${group.groupname }</div>
				    <div class='td'style="width: 143px;overflow: hidden;">${group.namespace}</div>
				    <div class='td' style="width: 90px;overflow: hidden;"><c:forEach items="${group.menSysMenuEntities }" var="gmus" varStatus="gstat">${gmus.id }<c:if test="${!gstat.last}">,</c:if></c:forEach></div> 
					<div class='td view'style="width: 31px;">查看</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div id='hiddenbox' style="display: none;">
		<a href="" id='view' class='thickbox' title='用户组菜单'></a>
	</div>
	<script>
	$(function(){
 		$('.view').click(function(){
 			var gids=$(this).parent().children().eq(4).html();
 			var url="/usergroup/group_groupmenuview?width=480&height=400&menuids="+gids;
 			$("#view").attr('href',url);
 			$("#view").click();
 		});
 		$(".radio").click(function(){
			var groupids=$(this).parent().parent().children().eq(5).html();
			var userid=$(this).parent().parent().children().eq(1).html();
			$("#groupids").val(groupids);
			$("#userid").val(userid);
			$(".gid").attr('checked',false);
			var gids =groupids.split(",");
		    var L=gids.length;
			for(var i=0 ;i<L;i++){
			   var temp="#gid"+gids[i];
			   $(temp).attr("checked",true);
			}
 		});
 		$(".gid").click(function(){
 			var id=$(this).val();
 			var gids=$("#groupids").val();
 
			if($(this).attr('checked')){
				var arrayids= gids.split(",");
				var L=arrayids.length;
				 for(var i=0 ;i<L;i++){
					 if(id==arrayids[i])
						 {
						 arrayids= arrayids.splice(i,1);
						 }
				 }
				 if(0==gids.length){
					 gids=id;
				 }else{
				 gids=gids+','+id;
				 }
				 $("#groupids").val(gids);
				 
			}else{
				var arrayids= gids.split(",");
				var L=arrayids.length;
				 for(var j=0 ;j<L;j++){
					 if(id==arrayids[j])
						 {
						 arrayids.splice(j,1);
						 }
				 }  
				 $("#groupids").val(arrayids);
			}
 		});
 		$("#submit").click(function(){
 			var userid=$("#userid").val();
 			 if(0==userid.length){
 				 alert("请先选择用户");
 				return false;
 			 }
 			 $(this).submit();
 		});
	});
	</script>
	
	
  	</body>
</html>
