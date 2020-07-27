package board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import board.model.Board;
import comment.dao.CommentDao;
import comment.model.Comment;
import jdbc.ConnectionProvider;
import service.Service;

public class BoardListServiceImpl implements Service {

   
   @Override
   public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
      
      
      BoardDao bdao;
      CommentDao cdao;
      Connection conn = null;

      try {
         conn = ConnectionProvider.getConnection();
         
         bdao = BoardDao.getInstance();
         cdao = CommentDao.getInstance();

         List<Board> boardList = null;

         boardList = bdao.selectList(conn);

         System.out.println(boardList);

         request.setAttribute("boardList", boardList);

         List<Comment> commentlist = null;

         
         commentlist = cdao.selectList(conn);

         
         request.setAttribute("commentList", commentlist);
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         if(conn != null) {
            try {
               conn.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
         }
         
      }


      return "/WEB-INF/views/board/boardList.jsp";

   }
}