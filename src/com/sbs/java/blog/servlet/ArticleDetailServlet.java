package com.sbs.java.blog.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Ref;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.util.DBUtil;

@WebServlet("/s/article/detail")
public class ArticleDetailServlet extends HttpServlet {

	private Article getArticle(int id) {
		String url = "jdbc:mysql://site39.iu.gy:3306/site39?serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true";
		String user = "site39";
		String password = "sbs123414";
		String driverName = "com.mysql.cj.jdbc.Driver";
		// 1. 접속
		String sql = "";
		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE id = %d ", id);

		// 2 . 쿼리문 작성

		Article article = null;

		// 3. 담을 변수를 만들어야함 [ 생각은 했는데 실천에 못옮김.. 구체화가 잘안됫음 ]
		Connection conn = null;

		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, user, password);
			Map<String, Object> row = DBUtil.selectRow(conn, sql);
			// 4. DB접속은 DBUTIL 한테 다 넘기고

			article = new Article(row);

		} catch (ClassNotFoundException e) {
			System.err.println("[ClassNotFoundException 예외]");
			System.err.println("msg : " + e.getMessage());
		} catch (SQLException e) {
			System.err.println("[SQLException 예외]");
			System.err.println("msg : " + e.getMessage());
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.err.println("[SQLException 예외]");
					System.err.println("msg : " + e.getMessage());
				}
			}
		}

		return article;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		Article article = getArticle(id);
		// article 에 정보를 req 에 담음.
		req.setAttribute("article", article);
		req.getRequestDispatcher("/jsp/article/detail.jsp").forward(req, resp);

	}

}
