
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
 <link href="${rooturl }/styles/mine.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

	$(document).ready(function(){
		 $(".pjpid").click(function(){
		 
		//$("#id").val($.trim($(this).parent().parent().children().eq(1).html()));		       
		$("#projectid").val($.trim($(this).parent().parent().children().eq(1).html()));	
       
	    
		});
	});
</script>
<html>
<head>


<title>Arrange</title>



</head>

<body>
	<div class="righttitle">ArrangePerson</div>
	<form action="${rooturl }/project/pro_arrangePerson" method="get">
	<table>
		
		<tr>
			<td>项目ID</td><td><input  id="projectid" name="pdaentity.projectid" type="text" /></td>
		</tr>
		<tr>
			<td>项目负责人</td>
			<td>
					<select name="userid">
					<c:forEach items="${userlist }" var="ul">
					  
					<option  value="${ul.id}">${ul.usname}</option>
					
					</c:forEach>
				</select>   
				 </td>
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
	<input id="id" name="pdaentity.id" type="hidden" ></input>
	 <input  type="submit" value="安排负责人"/> <br>
</form>
	
	<div class="table" style="width:1000px" >
	 <div class="hd">
		<div class="td"  style="width: 35px">选择</div>
		<div class="td"   style="width: 35px">ID</div>
		<div class="td"   style="width: 56px">项目编号  </div>
		<div class="td"   style="width: 56px">项目名称</div>
		<div class="td"   style="width: 56px">委托单位</div>
		<div class="td"   style="width: 45px">联系人 </div>
		<div class="td"   style="width: 65px">联系电话  </div>
		<div class="td"   style="width: 35px">费率</div>
		<div class="td"   style="width: 35px">金额  </div>
		<div class="td"   style="width: 45px">重要性</div>
		<div class="td"   style="width: 65px">签订时间</div>
		<div class="td"   style="width: 65px">启动时间 </div>
		<div class="td"   style="width: 65px">结束时间  </div> 
		<div class="td"   style="width: 56px">项目情况</div>
		<div class="td"   style="width: 65px">填报时间 </div>
		<div class="td"   style="width: 45px">填报人</div>
	</div>
	   <c:forEach items="${allnoarrangperson }" var="ls">
		   <div class="tr"  >
			   
			<div class="td" style="width:35px"><input class="pjid" type="radio" name="pjid"/></div> 
			<div class="td" style="width:35px"> ${ls.id }</div>
			<div class="td" style="width: 56px;overflow: hidden;">${ls.serialnumbers }</div>
			<div class="td" style="width: 56px;overflow: hidden;">${ls.prijectname } </div>
			<div class="td" style="width: 56px;overflow: hidden;">${ls.commissionedname }</div>
			<div class="td" style="width: 45px;overflow: hidden;">${ls.contactperson }</div>
			<div class="td" style="width: 65px;overflow: hidden;">${ls.contactphone } </div>
			<div class="td" style="width: 35px;overflow: hidden;">${ls.rate }</div>
			<div class="td" style="width: 35px;overflow: hidden;">${ls.money }</div>
			<div class="td" style="width: 45px;overflow: hidden;"> <c:if test="${ls.important ==0}">一般</c:if> <c:if test="${ls.important ==1}">重要</c:if><c:if test="${ls.important ==2}">紧急</c:if></div> 
			<div class="td" style="width: 65px;overflow: hidden;">${ls.contractdate }</div>
			<div class="td" style="width: 65px;overflow: hidden;">${ls.startdate } </div>
			<div class="td" style="width: 65px;overflow: hidden;">${ls.enddate }</div>
			<div class="td" style="width: 56px;overflow: hidden;">${ls.detail }</div>
			<div class="td" style="width: 65px;overflow: hidden;">${ls.createdate } </div>
			<div class="td" style="width: 45px;overflow: hidden;">${ls.subperson }</div>   
		   </div>
	   </c:forEach>
   </div>
</body>
</html>
