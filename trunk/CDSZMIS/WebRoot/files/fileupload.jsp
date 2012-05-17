<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>文件上传</title>
   

  </head>
  
  <body>
    <form method="POST" action="/files/files_fileUpload"  enctype="multipart/form-data">
    	<input type="file" name = "file" />
    	<input type="submit" value="上传"/>
    </form>
  </body>
</html>
