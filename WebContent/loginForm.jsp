<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ include file="./module/top.jsp"%>

<%
	String chk = "";
	String id = "";
	Cookie[] cookies = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("id")) {
				id = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				chk = "checked=\"checked\"";
			}
		}
	}
%>

<h2>Login Form</h2>
<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null) {
%>
<label><b><%=msg%></b></label>
<%
	}
%>

<!-- <form action="./LoginAction" method="post"> -->
<form action="./loginAction.jsp" method="post">
	<div class="container">
		<label><b>Username</b></label> <input type="text"
			<%-- 			placeholder="Enter Username" name="id" value="<%=id%>" required> --%>
			placeholder="Enter Username"
			name="id" value="<%=id%>" required> <label><b>Password</b></label>
		<input type="password" placeholder="Enter Password" name="pwd"
			required>

		<button class="log" type="submit">Login</button>
		<input type="checkbox" name="check" <%=chk%>> Remember me
	</div>

	<div class="container" style="background-color: #f1f1f1">
		<button type="button" class="cancelbtn"
			onclick="window.location.href='./main.jsp'">Cancel</button>
		<span class="psw">Forgot <a href="#">password?</a></span>
	</div>
</form>
<%@ include file="./module/bottom.jsp"%>
