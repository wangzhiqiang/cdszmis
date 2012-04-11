<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 <html>
<head>
<link href="${rooturl }/images/skin.css" rel="stylesheet" type="text/css" />
 <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EEF2FB;
}
-->
</style>
<title>管理中心</title>
</head>
<frameset rows="64,*"  frameborder="NO" border="0" framespacing="0">
	<frame src="/main/admin_top.jsp" noresize="noresize" frameborder="NO" name="topFrame" scrolling="no" marginwidth="0" marginheight="0" target="main" />
  <frameset cols="200,*"  rows="10086,*" border="0" id="frame">
	<frame src="/main/left.jsp" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" target="main" />
	<frame src="/main/right.jsp" name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" target="_self" />
  </frameset>
  </frameset>
<noframes>
  <body></body>
 </noframes>
 

</html>
