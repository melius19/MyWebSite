<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./module/top.jsp"%>
<%
	if (!login) {
		session.setAttribute("FOWARD", "./board.jsp");
%>
<jsp:forward page="./loginForm.jsp" />
<%
	}
%>
<h2>&nbsp&nbspNAACP Honors Memphis Sanitation Workers Who Went On
	Strike In 1968</h2>
<p>In 1968, 1,300 black men from the Memphis Department of Public
	Works went on strike after a malfunctioning truck crushed two garbage
	collectors to death. The strike led to marches with demonstrators
	carrying signs declaring "I Am A Man." Their organizing efforts drew
	support from the Rev. Martin Luther King Jr. before his assassination.

	"We were just fighting for equal payment and equal rights from the
	sanitation department," Elmore Nickleberry, one of the workers who went
	on strike and continued to work for the city decades later, told NPR
	last year. On Monday night, the NAACP Image Awards honored the
	sanitation workers who went on strike 50 years ago with its Vanguard
	Award. Derrick Johnson, the NAACP's president and CEO, says the
	country's oldest civil rights organization honored the workers for
	fighting for safer conditions and better pay. "There would have never
	been a civil rights movement if individuals were not being exploited
	for free and cheap labor," Johnson says. "And the workers' strike
	demonstrates the need to continue to advocate, ensure that individuals
	are paid a livable wage particularly in the South."</p>
<img width="800px"
	src="https://media.npr.org/assets/img/2018/01/15/ap_919092382758-0ae1994fb9feefc2cc7c004294d3b6e306defcf2-s800-c85.jpg">
<%@ include file="./module/bottom.jsp"%>