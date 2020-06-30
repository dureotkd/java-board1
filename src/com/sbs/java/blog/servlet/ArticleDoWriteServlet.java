package com.sbs.java.blog.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/s/article/doWrite")
public class ArticleDoWriteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			
			throws ServletException, IOException {
//		1 .한글설정 해주고 
		response.setContentType("text/html; charset=UTF-8");
// 	   2. url 접속 코드 넣어주고		
		String url = "jdbc:mysql://site39.iu.gy:3306/site39?serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true";
		String user = "site39";
		String password = "sbs123414";
		String driverName = "com.mysql.cj.jdbc.Driver";//		3. title ,body 값 넣어주고
		String title = request.getParameter("title");
		String body = request.getParameter("body");
// sqp 연결 널 해주고		
		Connection connection = null;
		
//sql 저장소 널 해주고
		Statement stmt = null;
		
		
		
		String sql = "";
		sql += String.format("Insert Into article ");
		sql += String.format("SET regDate = NOW() ");
		sql += String.format(", updataDate = NOW() ");
		sql += String.format(", title = ' %s ' " , title);
		sql += String.format(", body = ' %s ' ", body );
		
		 
		try {
			Class.forName(driverName);
			connection = DriverManager.getConnection(url, user, password);
			stmt = connection.createStatement();
			stmt.executeUpdate(sql);
			
			
			
			} catch (SQLException e) {
			System.err.printf("[SQL 예외] : %s\n", e.getMessage());
		} catch (ClassNotFoundException e) {
			System.err.printf("[드라이버 클래스 로딩 예외] : %s\n", e.getMessage());
		} finally {
			if ( connection != null ) {
				try {
					connection.close();
				} catch (SQLException e ) {
					System.err.printf(" [ SQL 예외 ] : %s \n" ,e.getMessage());
				} 
			}
			
			if (stmt!= null ) {
				try {
					stmt.close();
				} catch (SQLException e ) {
					System.err.printf(" [ SQL 예외 ] : %s \n" ,e.getMessage());
				} 
			}
			
		}
		response.getWriter().append("안녕하세요 ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			
			throws ServletException, IOException {

		doGet(request, response);
	}

}
