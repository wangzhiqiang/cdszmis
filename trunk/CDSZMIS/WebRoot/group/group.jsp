<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
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
  </head>
  
  <body>
group
<br/>
<form action="/usergroup/group_groupManager" method="post">

<table>
	<tr>
	<td>用户组名称：</td><td><input type="text" name="group.groupname" /></td>
	</tr>
	<tr>
	<td>用户组权限空间：</td><td><input type="text" name="group.namespace" /></td>
	</tr>
	<tr>
	<td>用户组控制菜单：</td>
	<td>
		<div style="width:400px;text-align:left;">
					<div>
						<input type="text" name="menuids" id="inputcolumn"
							onKeyUp="showcolumn();" onFocus="testonfouce();"
							onBlur="testonblur();" style=" border:1px solid #cccccc; height: 20px;"
							border="0"  readonly="readonly"/>&nbsp;&nbsp;
					</div>
					<div id="allcolumns"
						style="margin-top:0px;z-index:102;display:none;position:absolute;background-color:#FFFFFF;border:1px solid #cccccc;width:200px;overflow-y:auto;"
						onMouseOver="divonfouce();" onMouseOut="divonblur();">
						<div style="background-color:#efefef;border-bottom:1px solid #FFFFFF; cursor:hand;" >
							<c:forEach items="${sml}" var="m1">
									<c:if test="${m1.pid==0 }">
									 <input id="group" type=checkbox value="${m1.id }" onclick="setInputcolumn(this)"> ${m1.id }:${  m1.menuname} <br>
										<c:forEach items="${sml}" var="m2">
											<c:if test="${m2.pid==m1.id }">
							               -- <input id="group" type=checkbox value="${m2.id }" onclick="setInputcolumn(this)"> ${m2.id }:${  m2.menuname} 
							                  <ul  >
								                 <c:forEach items="${sml }" var="m3">
								                 <c:if test="${m3.pid==m2.id }">
								                 <li> ---- <input id="group" type=checkbox value="${m3.id }" onclick="setInputcolumn(this)"> ${m3.id }:${  m3.menuname}   </li>
								                 </c:if>
								                 </c:forEach>
							                   </ul>
											</c:if>
										</c:forEach>
									 </c:if>
								</c:forEach>
						</div>
					</div>
				</div> 
    </td>
	</tr>
</table>
<input type="submit" name="submit" value="添加"/>
</form>

<br/>
<table>
	<tr>
	  <td>选择</td><td>ID</td><td>用户组名称</td><td>用户组权限空间</td><td>用户主控制菜单</td>
	</tr>
	<c:forEach items="${ugl }" var="group">
	<tr>
	  <td><input type="radio" id="gpradio" name="radio"/></td>
	  <td>${group.id }</td>
	  <td>${group.groupname }</td>
	  <td>${group.namespace }</td>
	  <td width="60%"><c:forEach items="${group.menSysMenuEntities }" var="gmus">
	  ${gmus.id }${gmus.menuname }&nbsp;
	  </c:forEach></td>
	</tr>
		
	</c:forEach>
	
</table>

 

  </body>
</html>
