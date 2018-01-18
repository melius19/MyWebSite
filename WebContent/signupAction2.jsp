<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	boolean sameid = false;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/ch14?useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPass = "0000";
		String query = "select * from MEMBER order by MEMBERID";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		while (rs.next()) {
			if (rs.getString("MEMBERID").equals(id)) {
				sameid = true;
			}
		}
		if (!sameid) {
			pstmt = conn.prepareStatement("insert into MEMBER values (?,?,?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.executeUpdate();
			response.sendRedirect("./main.jsp");
		} else {
			request.setAttribute("msg", "ID already exist. Please choose different ID.");
			RequestDispatcher reqDis = request.getRequestDispatcher("./signupForm.jsp");
			reqDis.forward(request, response);
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
%>