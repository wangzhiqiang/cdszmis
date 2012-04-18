<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>index</title>
<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
<script language="JavaScript" src="${rooturl }/scripts/thickbox.js"></script>
<link href="${rooturl }/styles/thickbox.css" rel="stylesheet" type="text/css" />
</head>

<body>index
 
 <a href="#TB_inline?height=155&width=300&inlineId=tt" class="thickbox" style="text-decoration: none">加载层</a>
 
 <div id="tt" style="display: none">
 <p>${sessionids }</p>
 </div>
</body>
</html>
