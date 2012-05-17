<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
 <link href="${rooturl }/styles/mine.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		 $(".pjdid").click(function(){
			       
		//$("#id").val($.trim($(this).parent().parent().children().eq(1).html()));	
        $("#projectid").val($.trim($(this).parent().parent().children().eq(1).html()));	
        $("#name").val($.trim($(this).parent().parent().children().eq(3).html()));	
	});
</script>
<html>
<head>


<title>Arrange</title>



</head>

<body>&nbsp; 
	<div class="righttitle">ArrangeDepart</div> 
	<form action="${rooturl }/project/pro_arrangeDepartids" method="get">
	<table>
		
		<tr>
			<td>项目ID</td><td><input id="projectid" name="paentity.projectid" type="text"  onclick="alert(this.value);" readonly  /></td>
		</tr>
		<tr>
			<td>项目名称</td><td><input id="name" name="paentity.name" type="text" onclick="alert(this.value);" readonly /></td>
		</tr>
		<tr>
			<td>项目部门</td>
			<td>
					<select name="departid">
					<c:forEach items="${departlist }" var="dl">
					  
					<option  value="${dl.id}">${dl.departname}</option>
					
					</c:forEach>
				</select>   
				 </td>
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
			<td>签字时间</td><td><input id="signdate" name="paentity.signdate" type="text"/></td>
		</tr>
		<tr>
			<td>出版结束时间</td><td><input id="publicationdate" name="paentity.publicationdate" type="text" /></td>
		</tr>
		<tr>
			<td>指导意见</td><td><input id="suggestion" name="paentity.suggestion" type="text"  /></td>
		</tr>
		<tr>
			<td>填报时间</td><td><input id="reportdate" name="paentity.reportdate" type="text"  /></td>
		</tr>
		<tr>
			<td>填报人</td><td><input id="reportperson" name="paentity.reportperson" type="text" /></td>
		</tr>

	</table>
	<input id="id" name="paentity.id" type="hidden"  ></input>
	 <input  type="submit" value="所级安排"/> <br>
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
	   <c:forEach items="${allnoarrangdepart }" var="ls">
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
