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
			 
		//$("#id").val($.trim($(this).parent().parent().children().eq(1).html()));	
        $("#projectid").val($.trim($(this).parent().parent().children().eq(1).html()));	   
        			 
			 
		});
	});
</script>
  </head>
  
  <body>
   ProjectFilling<br>
   <form action="${rooturl }/project/pro_projectFilling" method="get">

	<table id="detil">
		<tr style="border-bottom-color: #FFF;border-bottom-style: solid;border-bottom: 1px;">
			<td>项目ID</td><td> <input id="projectid" type="text" name="projectstatus.projectid" onclick="alert(this.value);"  readonly/></td>
		</tr>
		<tr>
			<td> 项目状态</td>
			<td>
			<label name="projectstatus.status">
			<input name="projectstatus.status" type="radio" value="7"/>归档
			</label>
			</td>
		</tr>
		<tr>
			<td>状态更新 </td><td> <input id="history" type="text" name="projectstatus.history" onclick="alert(this.value);"  readonly/></td>
		</tr>
		<tr>
			<td>创建时间</td><td> <input id="createdate" type="text" name="projectstatus.createdate" onclick="alert(this.value);"  readonly/> 
			
			</td>  
		</tr>
		<tr>
			<td>填报时间</td><td> <input id="reportdate" type="text" name="projectstatus.reportdate" onclick="alert(this.value);"  readonly/></td>
		</tr>
		<tr>
			<td> 填报人</td><td> <input id="reportperson" type="text" name="projectstatus.reportperson" onclick="alert(this.value);"  readonly></td> 
		</tr>
	</table>
	  
     <input id="id" name="projectstatus.id" type="hidden" value=""></input>
	 <input  type="submit" value="提交"/><br>
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
	   <c:forEach items="${allnofillpro }" var="ls">
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
