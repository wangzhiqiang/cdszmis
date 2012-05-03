<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>人事管理</title>
     
 <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$(".dpid").click(function(){
		 
		$("#usname").val($.trim($(this).parent().parent().children().eq(1).html()));	
        $("#loginname").val($.trim($(this).parent().parent().children().eq(2).html()));	
        $("#gender").val($.trim($(this).parent().parent().children().eq(3).html()));	
        $("#email").val($.trim($(this).parent().parent().children().eq(4).html()));	
        $("#phone").val($.trim($(this).parent().parent().children().eq(5).html()));	
        $("#officenum").val($.trim($(this).parent().parent().children().eq(6).html()));	
        $("#idcard").val($.trim($(this).parent().parent().children().eq(7).html()));	
        $("#birthday").val($.trim($(this).parent().parent().children().eq(8).html()));	
        $("#conditions").val($.trim($(this).parent().parent().children().eq(10).html()));	
        $("#userid").val( $(this).val());			 
			 
		});

		
		$('#submit').click(function(){
		 	 var uspass=$("#uspass").val();
			 var email= $("#email").val();
	　　　　　//密码长度
	    
	     	if (uspass.length<5||uspass.length>20){
	     	alert("密码长度为6-20");	 
	     		return false;
	     	}
	     	 
	     	
			//邮箱验证　
		 
	　　　　　　if(email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)  
	　　　　　　{  
	　　　　　　　return true;  
	　　　　　　}  
	　　　　　　else  
	　　　　　　　{  
	　　　　　　　　alert("邮箱格式不正确");  
	　　　　　　　　return false;  
	　　　　　　}  
		    
		});

		
	});

</script>
  </head>
  
  <body>
	<form action="/user/user_userManager" method="get">
	<input id="userid" name="user.id" type="hidden" value=""></input>
		<table>
			<tr>
				<td>用户名</td>
				<td><input id='usname' name='user.usname' type="text" />
			
				</td>
			</tr>
			<tr>
				<td>登录名</td>
				<td><input id='loginname' name='user.loginname' type="text" />
				</td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input id='uspass' name="user.uspass" type="password" />
				</td>
			</tr>
			<tr>
				<td>性别</td>
				<td>
				<label name="user.gender">
				<input name="gender" type="radio" value="男" checked="checked"/>男
				<input  name="gender" type="radio" value="女" />女
				</label>
				</td>
			</tr>
			<tr>
				<td>邮箱</td>
				<td><input id='email' name='user.email' type="text" />
				</td>
			</tr>
			<tr>
				<td>手机</td>
				<td><input id='phone' name='user.phone' type="text" />
				</td>
			</tr>
			<tr>
				<td>办公室电话</td>
				<td><input id='officenum' name='user.officenum' type="text" />
				</td>
			</tr>
			<tr>
				<td>身份证</td>
				<td><input id='idcard' name='user.idcard' type="text" />
				</td>
			</tr>
			<tr>
				<td>出生日期</td>
				<td><input id='birthday' name='user.birthday' type="text" />
				</td>
			</tr>
			<tr>
				<td>用户组</td>
				<td>
	
					<div style="width:400px;text-align:left;">
						<div>
							<input type="text" name="groupids" id="inputcolumn"
								onKeyUp="showcolumn();" onFocus="testonfouce();"
								onBlur="testonblur();" style=" border:1px solid #cccccc;"
								border="0"  readonly="readonly"/>&nbsp;&nbsp;
						</div>
						<div id="allcolumns"
							style="margin-top:0px;z-index:102;display:none;position:absolute;background-color:#FFFFFF;border:1px solid #cccccc;width:200px;overflow-y:auto;"
							onMouseOver="divonfouce();" onMouseOut="divonblur();">
							<div style="background-color:#efefef;border-bottom:1px solid #FFFFFF; cursor:hand;" >
								<c:forEach items="${grouplist }" var="list">
								   <input id="group" type=checkbox value="${list.id }" onclick="setInputcolumn(this)"> ${list.id }:${  list.groupname} <br/>
								 </c:forEach>
							</div>
						</div>
					</div> 
				</td>
			</tr>
			<tr>
				<td>部门 </td>
				<td> 
					<select name="departid">
					<c:forEach items="${departlist }" var="dl">
					  
					<option value="${dl.id}">${dl.departname}</option>
					</c:forEach>
				</select>   
				 </td>
			</tr>
			<tr>
				<td>调动情况</td>
				<td><textarea name="user.conditions" style="height: 50px;width: 200px;"></textarea></td>
			</tr>
			
			<tr>
				<td>用户状态</td>
				<td>
				<label name="user.status">
				<input name="status" type="radio" value="0" checked="checked"/>激活
				<input  name="status" type="radio" value="1" />注销
				</label>
				</td>
			</tr>
			<tr>
				<td><input id="submit"   value="提交" type="submit"  /></td>
				<td><input value="重置" type="reset" /></td>
			</tr>
		</table>
	</form>		
	
	
<table border="1" width="80%">

	<tr>
		<td  width="40px;">选择</td>
		<td>用户名</td>
		<td>登录名</td>
		<td>性别</td>
		<td>邮箱</td>
		<td>手机</td>
		<td>办公室电话</td>
		<td>身份证</td>
		<td>出生日期</td>
		<td>用户组</td>
		<td>调动情况</td>

	</tr>
	<c:forEach items="${list}" var="l">
		<tr>
			<td width="30px;"><input class="dpid" type="radio" name="dpid" value="${l.id }"/></td> 
			<td>${l.usname}</td>
			<td>${l.loginname}</td>
			<td>${l.gender}</td>
			<td>${l.email}</td>
			<td>${l.phone}</td>
			<td>${l.officenum}</td>
			<td>${l.idcard}</td>
			<td>${l.birthday}</td>
			<td></td>
			<td>${l.conditions}</td>
			

		</tr>
	</c:forEach>
		
		
</table>


	
<script>
					var inputtext = false;
					var allcolumnsover = false;
					function testonfouce() {
						inputtext = true;
						showorhidden();
						showcolumn();
					}
					function testonblur() {
						inputtext = false;
						showorhidden();
					}
					function divonfouce() {
						allcolumnsover = true;
						showorhidden();
					}
					function divonblur() {
						allcolumnsover = false;
						showorhidden();
					}

					function showorhidden() {
						if (inputtext | allcolumnsover) {
							document.getElementById('allcolumns').style.display = '';
						} else {
							document.getElementById('allcolumns').style.display = 'none';
						}
					}
					function showcolumn() {
						var value = document.getElementById("inputcolumn").value;
						var allcolumns = document.getElementById("allcolumns").childNodes;
						var temp = 0;
						for ( var i = 0; i < allcolumns.length; i++) {
							if (allcolumns[i].innerHTML.indexOf(value) > -1) {
								allcolumns[i].style.display = "";
								temp++;
							} else {
								allcolumns[i].style.display = "none";
							}
						}
						if (temp > 10) {
							document.getElementById("allcolumns").style.height = "560px";
							document.getElementById("allcolumns").style.overflowY = "scroll";
						} else {
							document.getElementById("allcolumns").style.height = (temp * 26)
									+ "px";
							document.getElementById("allcolumns").style.overflowY = "hidden";
						}
					}
				
					
					function setInputcolumn(obj) {
						var ids = document.getElementById("inputcolumn").value;
						var id = obj.value;
						var temp = new Array();
						if (ids == "") {
							ids = id;
						} else {
							temp = ids.split(",");
							 var l=temp.length;
							for (i = 0; i <l;  i++) {
					           if (id == temp[i]) {
									temp.splice(i, 1);
									ids = temp.join(",");
									break;
								}
								if (i == l - 1) {
									ids = ids + "," + id;
								}
							}
						}
						document.getElementById("inputcolumn").value = ids;
					}
				</script>
  </body>
</html>
