<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ include file="./module/top.jsp"%>

<h2>Signup Form</h2>
<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null) {
%>
<label><b><%=msg%></b></label>
<%
	}
%>
<form action="./signupAction.jsp" method="post">
	<div class="container">
		<label><b>Username</b></label> <input type="text"
			placeholder="Enter Username" name="id" required> <label><b>Password</b></label>
		<input type="password" placeholder="Enter Password" name="pwd"
			required> <label><b>name</b></label> <input type="text"
			placeholder="Enter Username" name="name" required> <label><b>email</b></label>
		<input type="text" placeholder="Enter Username" name="email">
		<button class="log" type="submit">join</button>
	</div>

	<div class="container" style="background-color: #f1f1f1">
		<button type="button" class="cancelbtn"
			onclick="window.location.href='./main.jsp'">Cancel</button>
		<span class="psw">Forgot <a href="#">password?</a></span>
	</div>
</form>
<%@ include file="./module/bottom.jsp"%>