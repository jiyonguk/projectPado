package comment.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.dao.CommentDao;
import jdbc.ConnectionProvider;
import service.Service;

public class CommentDelServiceImpl implements Service {

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {

		int resultCount = 0;
		int cidx = Integer.parseInt(request.getParameter("cidx"));

		Connection conn = null;
		CommentDao dao = null;

		try {
			conn = ConnectionProvider.getConnection();

			dao = dao.getInstance();

			resultCount = dao.commentDel(conn, cidx);

			request.setAttribute("resultCount", resultCount);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return "/WEB-INF/views/comment/commentDel.jsp";
	}

}