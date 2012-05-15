<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
    <link href="${rooturl }/styles/groupmenu.css" rel="stylesheet" type="text/css" />
    <link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
 	<link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<script type="text/javascript">

	function deldic() {

		window.location.href = "${roturl }/systemdic/systemdic_dicmanager01?dic.id="+$("#dicid").val()+"&isdel=true";

	}
		
	$(document).ready(function(){
		 $(".did").click(function(){
			 
		$("#dicid").val($.trim($(this).parent().parent().children().eq(1).html()));	
        $("#name").val($.trim($(this).parent().parent().children().eq(2).html()));	
        $("#seq").val($.trim($(this).parent().parent().children().eq(3).html()));		
        $("#properties").val($.trim($(this).parent().parent().children().eq(4).html()));
        $("#status").val($.trim($(this).parent().parent().children().eq(5).html()));
        var s=$.trim($(this).parent().parent().children().eq(5).html());
        if(s=="未激活"){
		 $("#a").attr('checked',false);
		 $("#b").attr('checked',true);
		 		 }
		 else if( s=="激活"){
		 $("#a").attr('checked',true);
		 $("#b").attr('checked',false);		 
		 }				 
		});
	});
</script>
  </head>
  
  <body>  职称管理<br>
   <form action="${roturl }/systemdic/systemdic_dicmanager01" method="get">

	<table id="detil">
		<tr style="border-bottom-color: #FFF;border-bottom-style: solid;border-bottom: 1px;">
			<td> 职称名称：</td><td> <input id="name" type="text" name="dic.name" value=""/></td>
		</tr>
		<tr style="border-bottom-color: #FFF;border-bottom-style: solid;border-bottom: 1px;">
			<td> 字典标识：</td><td> <input id="seq" type="text" name="dic.seq" value=""/></td>
		</tr>
		<tr>
			<td> 职称状态：</td><td> 
			<label name="dic.status">
			<input type="radio" id="a" name="dic.status" value="0"/ checked="checked">激活
			<input type="radio" id="b" name="dic.status" value="1"/>注销
			 </label>
			</td>  
		</tr>
		<tr>
			<td> 属性：</td><td> <textarea id="properties" name="dic.properties" style="width: 200px;height: 80px;"></textarea></td>
		</tr>
	</table>
	  
     <input id="dicid" name="dic.id" type="hidden" value=""></input>
	 <input  type="submit" value="添加"/> <input  type="submit" value="修改"/> <input  type="button" onclick="deldic()" value="删除"/><br>
	</form>
	<div class="leftdiv">
		<div class='table' style="width: 470px;margin-left: 5px;" >
			<div class='hd' style="width: 470px;" >
				<div class='td' style="width: 50px;">选择</div>
				<div class='td' style="width: 35px;">ID</div>
				<div class='td' style="width: 70px;">职称名称</div>
				<div class='td' style="width: 90px;"> 字典标识</div>
				<div class='td' style="width: 70px;">属性</div>
				<div class='td' style="width: 70px;">职务状态 </div>
				
			</div>
	   <c:forEach items="${alldic}" var="ls">
		   <div class='tr'  >		   
			<div class='td' style="width: 50px;"><input class="did" type="radio" name="did"/></div>
			<div class='td' style="width: 35px;"> ${ls.id }</div>
			<div class='td' style="width: 70px;"> ${ls.name }</div>
			<div class='td' style="width: 90px;">${ls.seq } </div>
			<div class='td' style="width: 70px;"> ${ls.properties }</div>
			<div class='td' style="width: 70px;"> <c:if test="${ls.status ==0}">  激活</c:if> <c:if test="${ls.status !=0}">未激活</c:if></div>		   
		   </div>
	   </c:forEach>
   </div>
   
  </body>
</html>
