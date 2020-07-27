package comment.service;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.dao.CommentDao;
import comment.model.Comment;
import jdbc.ConnectionProvider;
import service.Service;

public class CommentRegServiceImpl implements Service {

   CommentDao dao;

   @Override
   public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
      int resultCnt = 0;
      
      Connection conn = null;

      try {
         
         request.setCharacterEncoding("utf-8");
         response.setContentType("text/html;utf-8");

         int bidx = Integer.parseInt(request.getParameter("bidx"));
         String mid = request.getParameter("mid");
         String cmessage = request.getParameter("cmessage");
        
         
         Comment comment = new Comment();
         comment.setBidx(bidx);
         comment.setMid(mid);
         comment.setCmessage(cmessage);

         conn = ConnectionProvider.getConnection();

         dao = CommentDao.getInstance();

         resultCnt = dao.insertComment(conn, comment);

         request.setAttribute("resultCnt", resultCnt);
         System.out.println("댓글 입력 성공 1==" + resultCnt);

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (UnsupportedEncodingException e) {
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

      return "/WEB-INF/views/comment/commentReg.jsp";
   }

}