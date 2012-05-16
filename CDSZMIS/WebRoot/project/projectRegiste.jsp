<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
 
 <link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
 
<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<script type="text/javascript">
 
	$(document).ready(function(){
		 $(".pjid").click(function(){
			       
		$("#pid").val($.trim($(this).parent().parent().children().eq(1).html()));	
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
		$("#delpro").click(function(){
			window.location.href = "${roturl }/project/pro_projectmanage?project.id="+$("#pid").val()+"&isdel=true";
		});
		 $('#submit').click(function(){
		 	 var serialnumbers = $("#serialnumbers").val();
			 var contactphone =  $("#contactphone").val();
			 var rate =  $("#rate").val();
			 var money = $("#money").val();
			 var startdate = $("#startdate").val();
			 var contactdate = $("#contractdate").val();
			 var edndate = $("#enddate").val();
	　　　　　//项目编号验证
	     	if (serialnumbers.search(/^[0-9]{1,20}$/)== -1)
		    	{
                   alert("项目编号只能是数字");  
	　　　　　　　　return false;  
	     		}
			//电话验证　　
	　　　　 if(contactphone.search(/^1[3|4|5|8][0-9]\d{8}$/) == -1)  
	　　　　　　{  
	　　　　　　　　alert("电话格式不正确");  
	　　　　　　　　return false;  
	　　　　　　}  
    	   //费率　
			if(rate.search(/^[0-9]{1,20}$/)== -1)
		    	{
                   alert("费率只能是数字");  
	　　　　　　　　return false;  
	     		} 
			//合同金额验证　 
		　　　if(money.search(/^[0-9]{1,20}$/)== -1)
		    	{
                   alert("合同金额只能是数字");  
	　　　　　　　　return false;  
	     		}
	     	/**if(!startdate.search(/^\d{4}-\d{2}-\d{2}$/) == -1)
			{
				alert("启动时间格式错误 yyyy-mm-dd");
				return false;
			}
           if(!contactdate.search(/^\d{4}-\d{2}-\d{2}$/) == -1)
			{
				alert("签订时间格式错误 yyyy-mm-dd");
				return false;
			}
			if(!enddate.search(/^\d{4}-\d{2}-\d{2}$/) == -1)
			{
				alert("结束时间格式错误 yyyy-mm-dd");
				return false;
			}*/
		
		});
	   });
 
</script>
<html>
<head>


<title>Registe</title>



</head>

<body>
	<div class="righttitle">ProjectRegiste</div>
	<form action="${rooturl }/project/pro_projectmanage" method="get" >
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
			<td>签订时间</td><td><input id="contractdate" name="project.contractdate" type="text"  /></td>
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
			<td>填报时间</td><td><input id="createdate" name="project.createdate"  type="text"  /></td>
		</tr>
		<tr>
			<td>填报人</td><td><input id="subperson" name="project.subperson" type="text" value="${sessionScope.loginname}"/></td>
		</tr>

	</table>
 
	<input id="pid" name="project.id" type="hidden" value=""></input>
	 <input   id="submit" type="submit" value="添加" /> <input  type="submit" value="修改"/> <input  id ="delpro"type="button" onclick="delproject()" value="删除"/><br>
 
</form>
	
	<div class="table" style="width: 90%" >
	 <div class="hd">
		<div class="td"  style="width: 40px">选择</div>
		<div class="td"   style="width: 40px">ID</div>
		<div class="td">项目编号  </div>
		<div class="td">项目名称</div>
		<div class="td">委托单位</div>
		<div class="td">联系人 </div>
		<div class="td">联系电话  </div>
		<div class="td">费率</div>
		<div class="td">金额  </div>
		<div class="td">重要性</div>
		<div class="td">签订时间</div>
		<div class="td">启动时间 </div>
		<div class="td">结束时间  </div> 
		<div class="td">项目情况</div>
		<div class="td">填报时间 </div>
		<div class="td">填报人</div>
	</div>
	   <c:forEach items="${allproject }" var="ls">
		   <div class="tr"  >
			   
			<div class="td" style="width:30px"><input class="pjid" type="radio" name="pjid"/></div> 
			<div class="td" style="width:40px"> ${ls.id }</div>
			<div class="td">${ls.serialnumbers }</div>
			<div class="td">${ls.prijectname } </div>
			<div class="td">${ls.commissionedname }</div>
			<div class="td">${ls.contactperson }</div>
			<div class="td">${ls.contactphone } </div>
			<div class="td">${ls.rate }</div>
			<div class="td">${ls.money }</div>
			<div class="td"> <c:if test="${ls.important ==0}">一般</c:if> <c:if test="${ls.important ==1}">重要</c:if><c:if test="${ls.important ==2}">紧急</c:if></div> 
			<div class="td">${ls.contractdate }</div>
			<div class="td">${ls.startdate } </div>
			<div class="td">${ls.enddate }</div>
			<div class="td" style="overflow: hidden;">${ls.detail }</div>
			<div class="td">${ls.createdate } </div>
			<div class="td">${ls.subperson }</div>   
		   </div>
	   </c:forEach>
   </div>
</body>
</html>
