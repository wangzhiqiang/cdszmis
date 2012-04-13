<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<link href="${rooturl }/scripts/jquery/jquery.multiSelect.css" rel="stylesheet" type="text/css" />
	<link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
	<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery.bgiframe.min.js"></script>
	<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery.multiSelect.js"></script>
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
	<td>用户组名称：</td><td><input id="groupname" style="width: 150px;" type="text" name="group.groupname" /></td>
	</tr>
	<tr>
	<td>用户组权限空间：</td>
	<td >
	<input id="namespace" name="group.namespace" type="hidden"  />
	   <select id="control_7" name="control_7" multiple="multiple"  style="width: 135px;" >
					<option value=""></option>
					<option value="1"> /user</option>
					<option value="2"> /usergroup</option>
					<option value="3"> /files</option>
					<option value="4"> /project</option>
					<option value="5"> /depart</option>
				</select>
	</td>
	</tr>
	<tr>
	<td>用户组控制菜单：</td>
	<td>
		<div style="width:400px;text-align:left;">
					<div>
						<input type="text" name="menuids" id="inputcolumn"
							onKeyUp="showcolumn();" onFocus="testonfouce();"
							onBlur="testonblur();"   style="width: 150px;border:1px solid #cccccc; height: 20px;"
							border="0"  readonly="readonly" value=""/> 
					</div>
					<div id="allcolumns"
						style="margin-top:0px;z-index:102;display:none;position:absolute;background-color:#FFFFFF;border:1px solid #cccccc;width:200px;overflow-y:auto;"
						onMouseOver="divonfouce();" onMouseOut="divonblur();">
						<div style="background-color:#efefef;border-bottom:1px solid #FFFFFF; cursor:hand;" >
							<c:forEach items="${sml}" var="m1">
									<c:if test="${m1.pid==0 }">
									 <input class="checkbox" id="g${m1.id }" type=checkbox value="${m1.id }" onclick="setInputcolumn(this)"> ${m1.id }:${  m1.menuname} <br>
										<c:forEach items="${sml}" var="m2">
											<c:if test="${m2.pid==m1.id }">
							               -- <input class="checkbox" id="g${m2.id }" type=checkbox value="${m2.id }" onclick="setInputcolumn(this)"> ${m2.id }:${  m2.menuname} 
							                  <ul  >
								                 <c:forEach items="${sml }" var="m3">
								                 <c:if test="${m3.pid==m2.id }">
								                 <li> ---- <input class="checkbox" id="g${m3.id }" type=checkbox value="${m3.id }" onclick="setInputcolumn(this)" > ${m3.id }:${  m3.menuname}   </li>
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
<input id="groupid" name="group.id" type="hidden" >

<input class="submit" type="submit" name="submit" value="添加"/><input class="submit" type="submit" name="submit" value="修改"/>
</form>

<br/>
<table>
	<tr>
	  <td>选择</td><td>ID</td><td>用户组名称</td><td>用户组权限空间</td><td>用户主控制菜单</td>
	</tr>
	<c:forEach items="${ugl }" var="group">
	<tr>
	  <td><input type="radio" class="gpradio" name="radio"/></td>
	  <td>${group.id }</td>
	  <td>${group.groupname }</td>
	  <td>${group.namespace }</td>
	  <td width="60%">
		  <c:forEach items="${group.menSysMenuEntities }" var="gmus">
		   ${gmus.id }:${gmus.menuname }&nbsp;
		  </c:forEach>
	  </td> 
	  <td style="display: none" id="groupsid">
	  		<c:forEach items="${group.menSysMenuEntities }" var="g" varStatus="stat" >
	 		 ${g.id }<c:if test="${!stat.last}">,</c:if>
	  		</c:forEach>
	  		
	  </td>
	</tr>
	</c:forEach>
	
</table>

 <script type="text/javascript">
	   $(document).ready(function(){
	    $("#control_7").multiSelect({ oneOrMoreSelected: '*' });
	  
		$(".gpradio").click(function(){
		 var ids= $(this).parent().parent().children().eq(5).html().replace( /[\r\n" "\	]/g,"");
		 
		 $("#groupid").val($(this).parent().parent().children().eq(1).html().replace( /[\r\n" "\	]/g,""));
		 $("#groupname").val( $(this).parent().parent().children().eq(2).html().replace( /[\r\n" "\	]/g,""));
		 $("#selval").empty();
		 $("#selval").append( $(this).parent().parent().children().eq(3).html().replace( /[\r\n" "\	]/g,""));
		 $("#inputcolumn").val(ids);	
		 $("#namespace").val( $(this).parent().parent().children().eq(3).html().replace( /[\r\n" "\	]/g,""));
		  var id= ids.split(",");
		  var L=id.length;
		  $(".checkbox").attr("checked",false);
		  for(var i=0 ;i<L;i++){
		   var temp="#g"+id[i];
		   $(temp).attr("checked",true);
		   }
		});
		$(".submit").click(function(){
		
		
			if ($("#selval").html()!="选择..."){
			   $("#namespace").val($("#selval").html());
			   }
			    
		});
		 /*
		$("#gns").click(function (){
		  $("#gns_c").slideDown();
		});
		$("#gns_c").mouseover(function (){
		   $("#gns_c").slideDown();
		 });
		 $("#gns_c").mousout(function ());
		  
		 $("#gns_c").click(function (){
		    alert( $(this).val().html());
		 }); 
		 */
		  
	});
</script>

  </body>
</html>
