<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>用户权限管理</title>
  <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
 <link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$(".dpid").click(function(){	 
		$("#usname").val($.trim($(this).parent().parent().children().eq(1).html()));	
        $("#userid").val( $(this).val()); 
		});
	});
	</script>
  </head>
  
  <body>
  	<form action="/user/user_userPower" method="get">
	<input id="userid" name="user.id" type="hidden" value=""></input>
		<table>
			<tr>
				<td>用户名</td>
				<td><input id='usname' name='user.usname' type="text" />
			
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
								  <input id="group" name="user.usgroups" type=checkbox value="${list.id }" onclick="setInputcolumn(this)"> ${list.id }:${  list.groupname}  <br/>
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
					  
					<option  value="${dl.id}">${dl.departname}</option>
					
					</c:forEach>
				</select>   
				 </td>
			</tr>
		
			<tr>
				<td><input id="submit"   value="提交" type="submit"  /></td>
				<td><input value="重置" type="reset" /></td>
			</tr>
		</table>
	</form>		


<div class='table' style="width:450px;margin-left: 5px;">
	<div class='hd' style="width: 100%">
			<div class='td' style="width: 50px;">选择</div>
			<div class='td' style="width: 50px;">用户名</div>
			<div class='td' style="width: 100px;">用户组</div>
			<div class='td' style="width: 100px;">部门</div>

	</div>

	<c:forEach items="${list}" var="l">
		
		<div class='tr'>
			<div class='td'style="width: 50px;"><input class="dpid" type="radio" name="dpid" value="${l.id }"/></div>
			<div class='td' style="width: 50px;">${l.usname}</div>
			<div class='td' style="width: 100px;"><c:forEach items="${grouplist}" var="gl"><c:if test="${gl.id == l.usgroups }">${gl.groupname}</c:if></c:forEach></div>
			<div class='td' style="width: 100px;"><c:forEach items="${departlist}" var="dl"> <c:if test="${dl.id == l.usdeparts }">${dl.departname}</c:if> </c:forEach></div>
		</div>
	</c:forEach>
</div>
	
	
	
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
