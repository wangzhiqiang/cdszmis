<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>用户信息维护</title>
 <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
 <link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
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
		        $("#birthday").val($.trim($(this).parent().parent().children().eq(8).html()).substring(0,10));	
		        $("#introduction").val($.trim($(this).parent().parent().children().eq(11).html()));
		        $("#conditions").val($.trim($(this).parent().parent().children().eq(12).html()));
		        $("#userid").val( $(this).val());

		    	var gids=$.trim($(this).parent().parent().children().eq(10).text());
				$("#inputcolumn").val(gids);
		        
		});


		 $('#submit').click(function(){
		 	 var uspass = $("#uspass").val();
			 var email =  $("#email").val();
			 var phone =  $("#phone").val();
			 var idcard = $("#idcard").val();
			 var birthday = $("#birthday").val();
			 var officenum =$("#officenum").val();
			
	　　　　　//密码长度
	     	if (uspass.length<6||uspass.length>20)
		    	{
	     			alert("密码长度为6-20");	 
	     			return false;
	     		}

			//邮箱验证　
	　　　　 if(email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1)  
	　　　　　　{  
	　　　　　　　　alert("邮箱格式不正确");  
	　　　　　　　　return false;  
	　　　　　　}  
    		//手机验证   
			if(phone.search(/^1[3|4|5|8][0-9]\d{8}$/) == -1)
			{
				alert("手机号错误 ");
				return false;
				}
			
			//办公室电话 
			if(officenum.length!=0){
				if(!(officenum.search(/^\d{3}-\d{8}$/) != -1 ) )
				{
					alert("办公室电话错误 ")
					return false;
				}
			}
			
			//身份证验证 
			if(idcard != null){
			    var Errors=new Array(
			        "验证通过!",
			        "身份证号码位数不对!",
			        "身份证号码出生日期超出范围或含有非法字符!",
			        "身份证号码校验错误!",
			        "身份证地区非法!" );
			    var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"} 
			    var Y,JYM;
			    var S,M;
			    var idcard_array = new Array();
			    idcard_array = idcard.split("");
			    //地区检验
			    if(area[parseInt(idcard.substr(0,2))]==null) 
					alert( Errors[4]);
			    //身份号码位数及格式检验
			    switch(idcard.length){
			        case 15:
			            if ( (parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){
			                ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性
			            } else {
			                ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性
			            }
			            if(!ereg.test(idcard)){
				             	 alert(Errors[2]);
			             	 	return false;
			           		 }
			           
			        case 18:
			            //18位身份号码检测
			            //出生日期的合法性检查 
			            //闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
			            //平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
			            if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){
			                ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式
			            } else {
			                ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式
			            }
			            if(ereg.test(idcard)){//测试出生日期的合法性
			                //计算校验位
			                S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
			                + (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
			                + (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
			                + (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
			                + (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
			                + (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
			                + (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
			                + parseInt(idcard_array[7]) * 1 
			                + parseInt(idcard_array[8]) * 6
			                + parseInt(idcard_array[9]) * 3 ;
			                Y = S % 11;
			                M = "F";
			                JYM = "10X98765432";
			                M = JYM.substr(Y,1);//判断校验位
			                if(M == idcard_array[17]) 
				                return true; //检测ID的校验位
			                else {
				                alert( Errors[3]);
				                return false;
			                }
			            }
			            else 
			            {
				            alert(Errors[2]);
			           		 return false;
			            }
			        default:
			          {
				      	 alert(Errors[1]);
			         	 return false;
			          }
			  
			    }
			}
			
			
			
			
			//生日验证 
			if(birthday.search(/^\d{4}-\d{2}-\d{2}$/) == -1)
			{
				alert("生日格式错误 yyyy-mm-dd");
				return false;
			}
		});
	});
</script>
  </head>
  
  <body>
	<form action="/user/user_userUpdate" method="post">
	<input id="userid" name="user.id" type="hidden" value=""></input>
	<input id="conditions" name="user.conditions" type="hidden" value=""></input>
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
				<td><input id= 'uspass' name="user.uspass" type="password" />
				</td>
			</tr>
			<tr>
				<td>性别</td>
				<td>
				<label name="user.gender">
				<input name="user.gender" type="radio" value="男" checked="checked"/>男
				<input  name="user.gender" type="radio" value="女" />女
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
								   <input id="group" name="user.usgroups" type=checkbox value="${list.id }" onclick="setInputcolumn(this)"> ${list.id }:${  list.groupname} <br/>
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
				<td><textarea id="introduction" name="user.introduction" style="height: 50px;width: 200px;"></textarea></td>
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
			<input  id="conditions" name="user.conditions" type="hidden" value=""/>
			<tr>
				<td><input id="submit" value="提交" type="submit" /></td>
				<td><input value="重置" type="reset" /></td>
			</tr>
	</table>
</form>
<div class='table' style="width:1000px;margin-left: 5px;">
	<div class='hd' style="width: 100%">
				<div class='td' style="width: 40px;">选择</div>
				<div class='td' style="width: 50px;">用户名</div>
				<div class='td' style="width: 50px;">登录名</div>
				<div class='td' style="width: 30px;">性别</div>
				<div class='td' style="width: 100px;">邮箱</div>
				<div class='td' style="width: 80px;">手机</div>
				<div class='td' style="width: 80px;">办公室电话</div>
				<div class='td' style="width: 110px;">身份证</div>
				<div class='td' style="width: 80px;">出生日期</div>
				<div class='td' style="width: 100px;">用户组</div>
				<div class='td' style="width: 155px;">简介</div>

	</div>
	<c:forEach items="${list}" var="l">
		<div class='tr'>
			<div class='td'style="width: 40px;"><input class="dpid" type="radio" name="dpid" value="${l.id }"/></div>
			<div class='td' style="width: 50px;">${l.usname}</div>
			<div class='td' style="width: 50px;">${l.loginname}</div>
			<div class='td' style="width: 30px;">${l.gender}</div>
			<div class='td' style="width: 100px;">${l.email}</div>
			<div class='td' style="width: 80px;">${l.phone}</div>
			<div class='td' style="width: 80px;">${l.officenum}</div>
			<div class='td' style="width: 110px;">${l.idcard}</div>
			<div class='td' style="width: 80px;overflow: hidden;">${l.birthday}</div>
			<div class='td' style="width: 100px;overflow: hidden;"><c:forEach items="${l.userGroupEntity }" var="u">${u.groupname} </c:forEach></div>
			
			<div class='groupids' style="display: none;"><c:forEach items="${l.userGroupEntity }" var="ug" varStatus="stat">${ug.id}<c:if test="${!stat.last}">,</c:if></c:forEach></div>

			<div class='td' style="width: 155px;">${l.introduction}</div>
				
			<div class='conditions' style="display: none;">${l.conditions}</div>
			
			

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
