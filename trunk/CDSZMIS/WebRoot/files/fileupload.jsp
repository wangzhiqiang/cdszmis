<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>文件上传</title>
    <link href="${rooturl }/styles/banner.css" rel="stylesheet" type="text/css" />
 	<link href="${rooturl }/styles/common.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${rooturl }/scripts/jquery/jquery-1.5.2.js"></script>
  </head>
  
  <body>
    <form method="POST" action="/files/files_fileUpload"  enctype="multipart/form-data">
    
    	<table>
    	文件名称 ，文件介绍，
    	+-
    	
    	</table>
    
    
    	<input id='file'type="file" name = "file" value="选择上传的文件"/>
    	<input id='submit' type="submit" value="上传"/>
    </form>
   <script type="text/javascript">
    $(function(){
    
    $("#submit").click(function(){
	   	 var filelocal= $("#file").val() ;
	   	 if(""==filelocal){
	   		 
	   			 
	   		 return confirm("您确定不上传文件吗？");
	   	 }else{
	    	 var point = filelocal.lastIndexOf(".");     
	         var type = filelocal.substr(point).toLowerCase(); 
			if (!(type == ".jpg"
					|| type == ".gif" 
					|| type == ".jpeg" 
					|| type == ".png" 
					|| type == ".doc" 
					|| type == ".docx" 
					|| type == ".xls"
					|| type == ".xlsx" 
					|| type == ".pptx" 
					|| type == ".ppt")) {
				alert("只能是图片，文档，表格和PPT文件");
				return false;
			}
			
			/**
			文件大小判定  由于只有ie6 可以 在前台就不验证了
			if(true){
				  var image=new Image();  
				   image.src=filelocal;  
				   alert(image.fileSize);  
				   
				return false;
			}*/
		}
	});

});
			</script>
  </body>
</html>
