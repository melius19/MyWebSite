<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>melius17</title>
<style>
body {
	overflow-y: scroll;
}

header {
	margin: 0px;
	/* background-image:url('vcp-weekend-slider-1200x546.jpg'); */
	position: relative;
	width: auto;
	height: 150px;
	overflow: hidden;
}

header div {
	/* border-style: solid;
            border-width: 1px; */
	width: 300px;
	height: 100%;
	margin: auto;
}

header h1 {
	position: absolute;
	font-size: 40px;
	font-family: Impact;
	color: black;
	text-align: center;
	margin: 10px;
	left: auto;
	top: 30%;
}

header img {
	width: 100%;
}

ul {
	list-style-type: none;
	margin: 0;
	/* padding: 14px 16px; */
	padding: 0px 16px 0px 0px;
	background-color: #333333;
}

li {
	/* font-size: 15px; */
	display: inline;
	/* background-color: #333333; */
	/*padding: 8px 20px;*/
}

.dropbtn {
	background-color: #333333;
	color: white;
	padding: 8px 20px 8px 20px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}

form {
	border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #333333;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	/*opacity: 0.8;*/
	background-color: #3e8e41;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	/* 	background-color: #f44336; */
	background-color: #f44336;
}

.cancelbtn:hover {
	background-color: #333333;
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

#mconti {
	width: 800px;
	margin: auto;
}
/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>
<body>
	<div id="mconti">
		<header> <!-- <img src="vcp-weekend-slider-1200x546.jpg"> -->
		<div>
			<h1>
				<ins>The York Times</ins>
			</h1>
		</div>
		</header>
		<%
			String memberId = (String) session.getAttribute("MEMBERID");
			boolean login = memberId == null ? false : true;
		%>

		<hr>
		<div>
			<ul>
				<li>
					<div class="dropdown">
						<button class="dropbtn"
							onclick="window.location.href='./main.jsp'">HOME</button>
					</div>
				</li>
				<li>
					<div class="dropdown">
						<button class="dropbtn"
							onclick="window.location.href='./board.jsp'">Board</button>
					</div>
				</li>
				<li>
					<div class="dropdown">
						<button class="dropbtn">Delta Team</button>
						<div class="dropdown-content">
							<a href="https://blog.naver.com/melius17" target="_blank">melius17</a>
							<a href="https://www.w3schools.com/" target="_blank">w3schools</a>
							<a href="https://melius18.atlassian.net" target="_blank">Jira</a>
						</div>
					</div>
				</li>
				<li>
					<div class="dropdown">
						<button class="dropbtn">Coding Study</button>
						<div class="dropdown-content">
							<a href="https://www.youtube.com/user/MasterNKS" target="_blank">java's
								joseki</a> <a href="https://programmers.co.kr" target="_blank">programmers</a>
							<a href="https://opentutorials.org" target="_blank">opentutorials</a>
						</div>
					</div>
				</li>
				<li>
					<div class="dropdown">
						<%
							if (login) {
						%>
						<button class="dropbtn"
							onclick="window.location.href='./logoutAction.jsp'">Logout</button>

						<%
							} else {
						%>
						<button class="dropbtn"
							onclick="window.location.href='./loginForm.jsp'">Login</button>
					</div>
				</li>
				<li>
					<div class="dropdown">
						<button class="dropbtn"
							onclick="window.location.href='./signupForm.jsp'">Signup</button>
						<%
							}
						%>
					</div>
				</li>
			</ul>
		</div>