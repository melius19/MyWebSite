<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		// String dbend = "localhost";
		// String dbUser = "root";
		// String dbPass = "0000";

		String dbend = "mydbinstance.cj6bnsilnilw.ap-northeast-2.rds.amazonaws.com";
		String dbUser = "root";
		String dbPass = "12345678";

		String jdbcDriver = "jdbc:mysql://" + dbend + ":3306/ch14?useUnicode=true&characterEncoding=utf8";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		pstmt = conn.prepareStatement("insert into MEMBER values (?,?,?,?)");
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		pstmt.executeUpdate();
		response.sendRedirect("./main.jsp");
	} catch (SQLException ex) {
		// same id?
		// out.println("same id!!!!!");
		// out.println(ex.getMessage());
		// ex.printStackTrace();
		request.setAttribute("msg", "ID already exist. Please choose a different ID.");
		RequestDispatcher reqDis = request.getRequestDispatcher("./signupForm.jsp");
		reqDis.forward(request, response);
	} finally {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException ex) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException ex) {
			}
	}
%>