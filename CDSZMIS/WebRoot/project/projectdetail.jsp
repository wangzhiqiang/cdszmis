<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>项目详细信息查询</title>
    
	 <link href="${rooturl }/styles/thickbox.css" rel="stylesheet" type="text/css" />
     <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
 	 <link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
	 <script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
	 <script language="JavaScript" src="${rooturl }/scripts/thickbox.js"></script>
	 

  </head>
  <body>
   <div class="rigthtitle">项目详细信息查询</div>
      <form action="/project/pro_projectDetail" method="post">
	    <div class="tr" style="width: 90%">
		 	<div class='td'style="width: 60px;">项目编号</div>
		 	<div class='td'style="width: 155px;height:25px;line-height: 24px;">
		 	    <input type='text' name='project.serialnumbers' style="padding: 1px;" /></div>
		 	    <div class='td'style="width: 60px;">项目名称</div>
		 	<div class='td'style="width: 155px;height:25px;line-height: 24px;"><input type='text' name='projectname.prijectname' style="padding: 1px;" /></div>
		 	<div class='td'style="width: 60px;">项目状态</div>
		 	<div class='td'style="width: 100px;height:25px;line-height: 24px;">
		   <select name="projectstatus.status">
			<option value='0'>方案</option>
			<option value='1'>初设</option>
			<option value='2'>施工图</option>
			<option value='3'>院长签发</option>
			<option value='4'>出版</option>
			<option value='5'>发行</option>
			<option value='6'>项目结束</option>
			<option value='7'>归档</option>
		   </select>
			</div>
			<div class='td'style="width: 60px;"><input type='submit' value="查询"/></div>
	    </div>
  </form>
 <div class="table" style="width: 716px;" >
  	<div class='hd' style="width: 716px;">
  	  <div class="td" style="width: 100px;">项目编号 </div>
  	  <div class="td" style="width: 100px;">项目名称 </div>
  	  <div class="td" style="width: 100px;">项目状态 </div>
  	   <div class="td" style="width: 120px;">委托单位 </div>
  	  <div class="td" style="width: 100px;">重要性 </div>
  	  <div class='td' style="width: 80px;">操作</div>
	</div>
	<c:forEach items="${lsp}" var="prs">
	  	<div class='tr'style="width: 715px;">
	  	  <div class="td" style="width: 100px;">${prs.projectEntity.serialnumbers } </div>
	  	  <div class="td" style="width: 100px;">${prs.projectEntity.prijectname } </div>
	  	  <div class="td" style="width: 100px;">
	  		  <c:if test="${prs.status==0 }">方案</c:if> 
	  		  <c:if test="${prs.status==1 }">初设</c:if> 
	  		  <c:if test="${prs.status==2 }">施工图</c:if>
	  		  <c:if test="${prs.status==3 }">院长签发</c:if> 
	  		  <c:if test="${prs.status==4 }">出版</c:if>
	  		  <c:if test="${prs.status==5 }">发行</c:if> 
	  		  <c:if test="${prs.status==6 }">项目结束</c:if>  
	  		  <c:if test="${prs.status==7 }">归档</c:if> 
	  	  </div>
	  	   <div class="td" style="width: 120px;">${prs.projectEntity.commissionedname} </div>
	  	   <div class="td" style="width: 100px;">${prs.projectEntity.important}</div>
	  	   <div class='td view'style="width: 80px;color:red;"><a  class="thickbox" href="#TB_inline?height=350&width=300&inlineId=view">详细信息查看</a></div>	  	     	   
		</div>
	</c:forEach>
	
</div>
     <div id='view' style="display: none;">		  
		  <div class="viewhtml">
		   <c:forEach items="${lsp}" var="prs">
		      <div class='tr' >
  	             <div class="td" style="width: 100px;">项目编号 </div>
  	             <div class="td" style="width: 150px;">${prs.projectEntity.serialnumbers} </div>
  	          </div>
  	          <div class='tr' >
  	             <div class="td" style="width: 100px;">项目(合同)名称:</div>
  	             <div class="td" style="width: 150px;">${prs.projectEntity.prijectname} </div>
  	          </div>
  	          <div class='tr' >
  	             <div class="td" style="width: 100px;">委托单位: </div>
  	             <div class="td" style="width: 150px;">${prs.projectEntity.commissionedname} </div>
  	          </div>
  	          <div class='tr' >
  	             <div class="td" style="width: 100px;">联系人: </div>
  	             <div class="td" style="width: 150px;">${prs.projectEntity.contactperson} </div>
  	          </div>
  	          <div class='tr' >
  	             <div class="td" style="width: 100px;">联系电话:</div>
  	             <div class="td" style="width: 150px;">${prs.projectEntity.contactphone} </div>
  	          </div>
  	          <div class='tr' >
  	             <div class="td" style="width: 100px;">费率: </div>
  	             <div class="td" style="width: 150px;">${prs.projectEntity.rate} </div>
  	          </div>
  	          <div class='tr' >
  	             <div class="td" style="width: 100px;">合同金额（万元）: </div>
  	             <div class="td" style="width: 150px;">${prs.projectEntity.money} </div>
  	          </div>
  	          <div class='tr' >
  	             <div class="td" style="width: 100px;">重要性: </div>
  	             <div class="td" style="width: 150px;">${prs.projectEntity.important} </div>
  	          </div>
  	          <div class='tr' >
  	             <div class="td" style="width: 100px;">项目启动时间:</div>
  	             <div class="td" style="width: 150px;">${prs.projectEntity.startdate} </div>
  	          </div>
  	          <div class='tr' >
  	             <div class="td" style="width: 100px;">合同结束时间: </div>
  	             <div class="td" style="width: 150px;">${prs.projectEntity.enddate}</div>
  	          </div>
  	          <div class='tr' >
  	             <div class="td" style="width: 100px;">合同项目情况: </div>
  	             <div class="td" style="width: 150px;">${prs.projectEntity.detail} </div>
  	          </div>
  	          <div class='tr' >
  	             <div class="td" style="width: 100px;">填报时间: </div>
  	             <div class="td" style="width: 150px;">${prs.projectEntity.createdate} </div>
  	          </div>
  	          <div class='tr' >
  	             <div class="td" style="width: 100px;">填报人: </div>
  	             <div class="td" style="width: 150px;">${prs.projectEntity.subperson}</div>
  	          </div>
	       </c:forEach>		    		 		  
		  </div>
		
	</div>
	
 
	<script>
	$(function(){
 		$('.thickbox').click(function(){
 		  $('.tt').remove();
 			var html=$(this).parent().parent().find('.hi').text();
 			//var url="/project/pro_projectDetail?width=680&height=400&menuids="+gids;
 			//$("#view").attr('href',url);
 			 $('.viewhtml').after("<div  class='tt'>"+html+"</div>");
 		});
 	 });
 	</script>
 	

  </body>
</html>
