<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/common.jsp" %> 
<%
String loginMenu = "Login";
String loginUrl = rootPath + "/view/user/login";
if(userId!=null){
	loginMenu = "Logout";
	loginUrl = rootPath + "/user/logout";
}
%>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	      <div class="container">
	        <div class="navbar-header">
	          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <a class="navbar-brand" href="#">Project name</a>
	        </div>
	        <div id="navbar" class="collapse navbar-collapse">
	          <ul class="nav navbar-nav">
	            <li class="active"><a href="<%=rootPath%>/">Home</a></li>
	            <li><a href="<%=loginUrl%>"><%=loginMenu%></a></li>
	            <li><a href="#contact">Contact</a></li>
	          </ul>
	        </div><!--/.nav-collapse -->
	      </div>
	    </nav>