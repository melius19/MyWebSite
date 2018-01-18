<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ include file="./module/top.jsp"%>
<%
	String id = "";
	if (login) {
		id = ", " + memberId;
	} else {
		id = ", please log in.";
	}
%>
<div style="text-align: center">
	<h2>
		&nbsp&nbspWelcome to The York Times<%=id%>
	</h2>
</div>
<!-- <div style="text-align: center"> -->
<!-- </div> -->
<iframe style="display: block; margin-left: auto; margin-right: auto"
	width="560" height="315"
	src="https://www.youtube.com/embed/vH0pSHZOsTk" frameborder="0"
	allow="autoplay; encrypted-media" allowfullscreen></iframe>
<%@ include file="./module/bottom.jsp"%>