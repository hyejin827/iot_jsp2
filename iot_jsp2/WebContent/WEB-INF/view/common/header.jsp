<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String loginMenu = "Login";
String loginUrl = rootPath + "/view/user/login";
if(user!=null){
	loginMenu = "Logout";
	loginUrl = rootPath + "/user/logout";
}
%>
<script src="<%=rootPath%>/ui/js/jquery-3.2.1.js"></script>
<script src="<%=rootPath%>/ui/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=rootPath%>/ui/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=rootPath%>/ui/css/common.css">
<link rel="stylesheet" href="<%=rootPath%>/ui/css/style_header.css">
    <nav>
        <ul>
            <li><a href=<%=rootPath%>/>Home</a></li>
            <li><a href="<%=loginUrl%>"><%=loginMenu%></a></li>
            <li><a href="<%=rootPath%>/view/user/list2">User List</a></li>
        </ul>
    </nav>