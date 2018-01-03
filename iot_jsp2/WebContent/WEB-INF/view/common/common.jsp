<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String rootPath = request.getContextPath();
String userId = (String)session.getAttribute("id");
%>
<script src="<%=rootPath%>/ui/js/jquery-3.2.1.js"></script>
<script src="<%=rootPath%>/ui/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=rootPath%>/ui/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=rootPath%>/ui/css/common.css">