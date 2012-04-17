<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<html>
<head>


<title>Register</title>



</head>

<body>
	Register
	<form action="/user/user_userRegister" method="get">
	<table>
		<tr>
			<td>ID</td>
			<td><input name="user.id" type="text" />
			</td>
		</tr>
		<tr>
			<td>用户名</td>
			<td><input name="user.usname" type="text" />
			</td>
		</tr>
		<tr>
			<td>登录名</td>
			<td><input name="user.loginname" type="text" />
			</td>
		</tr>
		<tr>
			<td>密码</td>
			<td><input name="user.uspass" type="password" />
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
			<td><input name="user.email" type="text" />
			</td>
		</tr>
		<tr>
			<td>手机</td>
			<td><input name="user.phone" type="text" />
			</td>
		</tr>
		<tr>
			<td>办公室电话</td>
			<td><input name="user.officenum" type="text" />
			</td>
		</tr>
		<tr>
			<td>身份证</td>
			<td><input name="user.idcard" type="text" />
			</td>
		</tr>
		<tr>
			<td>出生日期</td>
			<td><input name="user.date" type="text" />
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
			<td>简介</td>
			<td><textarea name="introduction" style="height: 50px;width: 200px;"></textarea></td>
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
			<td><input value="提交" type="submit" /></td>
			<td><input value="重置" type="reset" /></td>
		</tr>

	</table>
</form>

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
