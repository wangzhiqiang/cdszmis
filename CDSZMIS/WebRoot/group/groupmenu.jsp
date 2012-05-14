<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="${rooturl }/styles/banner.css" rel="stylesheet"
	type="text/css" />
	<link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
<link href="${rooturl }/styles/groupmenu.css" rel="stylesheet"
	type="text/css" />
<script language="JavaScript"
	src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>

</head>

<body>
<form><br/> 
<input type='hidden' value='' id='menuids'name='menuids'>
<input type='hidden' value='' id='groupid'name='groupid'>
	<input type='submit' value="修改"/>
	<br/> 
	</form>
	<div class="leftdiv">
		<table>
			<tr>
				<td width="20"><input type="checkbox" id='groupselect'
					title='全选' /></td>
				<td width="25">ID</td>
				<td width="60">用户组</td>
				<td>用户组权限空间</td>
				<td style="display:none;">用户组控制菜单</td>
			</tr>
			<c:forEach items="${allgroup }" var="group">
				<tr>
					<td><input type="checkbox" class='groupitem' value='${group.id }' /></td>
					<td>${group.id }</td>
					<td>${group.groupname }</td>
					<td>${group.namespace }</td>
					<td style="display:none;"><c:forEach
							items="${group.menSysMenuEntities }" var="g" varStatus="stat">
	     ${g.id }<c:if test="${!stat.last}">,</c:if>
						</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="centerdiv"></div>

	<div class="rightdiv">
		<table>
			<tr>
				<td><input type="checkbox" id='menuselect' title='全选' />
				</td>
				<td>菜单</td>
			</tr>

			<c:forEach items="${allmenu }" var="menu1">

				<c:if test="${menu1.pid==0 }">
					<tr>
						<td><input type="checkbox" class='menu'id="menuid${menu1.id }"  value='${menu1.id }'/>
						</td>
						<td>${menu1.menuname }</td>
					</tr>
					<c:forEach items="${allmenu }" var="menu2">
						<c:if test="${menu2.pid==menu1.id }">
							<tr>
								<td><input type="checkbox"class='menu' id="menuid${menu2.id }"value='${menu2.id }' />
								</td>
								<td>--${menu2.menuname }</td>
							</tr>
							<c:forEach items="${allmenu }" var="menu3">
								<c:if test="${menu3.pid==menu2.id}">
									<tr>
										<td><input type="checkbox"class='menu' id="menuid${menu3.id }"value='${menu3.id }' />
										</td>
										<td>----${menu3.menuname }</td>
									</tr>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</c:if>
			</c:forEach>
		</table>
	</div>


	<script>
		$(function() {
			$(".groupitem").click( function() {
				$('.menu').attr("checked", false);				  
				if($(this).attr("checked")){
						var menuids = $(this).parent().parent().children().eq(4).text().replace(/[\r\n" "\	]/g, "");
						$(".groupitem").attr("checked", false);
						$(this).attr("checked", true);
						$('#groupid').val($(this).val());
						$('#menuids').val(menuids);
						var ids= menuids.split(",");
						var L=ids.length;
						
						for(var i=0 ;i<L;i++){
							   var temp="#menuid"+ids[i];
							   $(temp).attr("checked",true);
							   }
				   }
			});
			$("#groupselect").click(function() {
				if ($(this).attr("checked")) {
					$(".groupitem").attr("checked", true);
				} else {
					$(".groupitem").attr("checked", false);
				}
			});
			$('.menu').click(function(){
				 
				if( $('#groupid').val().length==0)
					{
					alert("请选择用户组");
					$(this).attr('checked',false);
					}
				else{
					var ids=$('#menuids').val();
					var id=$(this).val();
				
					if($(this).attr('checked')){
						var arrayids= ids.split(",");
						var L=arrayids.length;
						 for(var i=0 ;i<L;i++){
							 if(id==arrayids[i])
								 {
								 arrayids= arrayids.splice(i,1);
								 }
						 }
						 ids=ids+','+id;
						 
					}else{
						  
						var arrayids= ids.split(",");
						var L=arrayids.length;
						 for(var j=0 ;j<L;j++){
							 if(id==arrayids[j])
								 {
								 arrayids[j].del();
								 }
						 }  
					}	
					$('#menuids').val(arrayids);
				}
				
			});

		});
	</script>
</body>
</html>
