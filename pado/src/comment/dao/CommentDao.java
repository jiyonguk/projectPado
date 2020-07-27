package comment.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import comment.model.Comment;

public class CommentDao {
   
   private CommentDao() {}
   
   static private CommentDao dao = new CommentDao();
   
   public static CommentDao getInstance() {
      return dao;
   }

   public int insertComment(Connection conn, Comment comment) throws SQLException {
      int result = 0;
      PreparedStatement pstmt = null;
      
      String sql = "Insert into project.comment (bidx, cmessage, mid) values (?,?,?)";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, comment.getBidx());
         pstmt.setString(2, comment.getCmessage());
         pstmt.setString(3, comment.getMid());
         
         result = pstmt.executeUpdate();
         System.out.println("데이터베이스 입력완료");
      } finally {
         if (pstmt != null) {
            pstmt.close();
         }
      }
      
      return result;
   }



   public List<Comment> selectList(Connection conn) {
//      public List<Integer> getBidx(Connection conn) {
      
//      List<Integer> list = new ArrayList<>();
      List<Comment> list = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      Comment comment = null;
//      String sql = "select distinct bidx from project.comment";
      String sql = "select * from project.comment order by cregdate desc";
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            comment = new Comment();
            comment.setMid(rs.getString("mid"));
            comment.setBidx(rs.getInt("bidx"));
            comment.setCidx(rs.getInt("cidx"));
            comment.setRegdate(rs.getDate("cregdate"));
            comment.setCmessage(rs.getString("cmessage"));
            list.add(comment);
            System.out.println("댓글리스트"+comment);
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         if(pstmt != null) {
            try {
               pstmt.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
         }
         if(rs != null) {
            try {
               rs.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
         }
      }
      
      
      
      
      return list;
   }

   public List<Comment> commentList(Connection conn, int bidx) {
      
      List<Comment> list = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql = "select * from project.comment where bidx=?";
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, bidx);
         rs = pstmt.executeQuery();
         while(rs.next()) {
            Comment comment = new Comment();
            comment.setCmessage(rs.getString("cmessage"));
            comment.setMid(rs.getString("mid"));
            comment.setRegdate(rs.getDate("cregdate"));
            comment.setCidx(rs.getInt("cidx"));
            comment.setBidx(rs.getInt("bidx"));
            
            list.add(comment);
            System.out.println(comment);
         }
         
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         if(pstmt != null) {
            try {
               pstmt.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
         }
         if(rs != null) {
            try {
               rs.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
         }
      }
      
      
      return list;
   }

   public int commentDel(Connection conn, int cidx) throws SQLException {
      int resultCount = 0;
      
      PreparedStatement pstmt = null;
      
      String sql = "delete from project.comment where cidx= ?";
      
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, cidx);
      resultCount = pstmt.executeUpdate();
      
      
      return resultCount;
   }


}