<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String chk = request.getParameter("check");
	boolean login = false;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		//	String jdbcDriver = "jdbc:mysql://192.168.3.183:3306/ch14?" + "useUnicode=true&characterEncoding=utf8";
		String jdbcDriver = "jdbc:mysql://localhost:3306/ch14?" + "useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPass = "0000";
		String query = "select * from MEMBER order by MEMBERID";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		while (rs.next()) {
			if (rs.getString("MEMBERID").equals(id) && rs.getString("PASSWORD").equals(pwd)) {
				login = true;
			}
		}
	} catch (SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException ex) {
			}
		if (stmt != null)
			try {
				stmt.close();
			} catch (SQLException ex) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException ex) {
			}
	}
	if (login) {
		session.setAttribute("MEMBERID", id);
		if (chk != null && chk.equals("on")) {
			Cookie cookie = new Cookie("id", URLEncoder.encode(id, "utf-8"));
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("id", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		String forward = (String) session.getAttribute("FOWARD");
		if (forward != null && forward.equals("./board.jsp")) {
			session.setAttribute("FOWARD", "");
			response.sendRedirect("./board.jsp");
		} else {
			response.sendRedirect("./main.jsp");
		}
	} else {
		request.setAttribute("msg", "ID or password is wrong.");
		Cookie cookie = new Cookie("id", "");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		RequestDispatcher reqDis = request.getRequestDispatcher("./loginForm.jsp");
		reqDis.forward(request, response);
	}
%>