<%--
  Created by IntelliJ IDEA.
  User: lg
  Date: 2023-11-20
  Time: 오후 4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 업로드 결과</title>
</head>
<body>
<%
    String filename="";
    int sizeLimit = 15*1024*1024;

    String realPath = request.getServletContext().getRealPath("upload");

    File dir = new File(realPath);
    if(!dir.exists()) dir.mkdirs();

    MultipartRequest multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

    filename = multipartRequest.getFilesystemName("photo");
%>

폼에서 전송된 원래 파일명 : <%= multipartRequest.getOriginalFileName("photo")%><br />
업로드한 파일의 경로 : ${pageContext.request.contextPath }/upload/<%=filename%><br />
물리적인 저장 경로 :  <%=realPath%><br />
<img src="${pageContext.request.contextPath }/upload/<%=filename%>">

파일명 : <%=filename%><br />
</body>
</html>

