package OTT_202044092;

import java.sql.*;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DelBookmarkHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {

        DB db = new DB();
        Connection conn = null;
        PreparedStatement pstmt = null;

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("itemName");
        String user_id = request.getParameter("user_id");
        System.out.println("Title: "+name);
        System.out.println("User ID: "+user_id);

        try {
            conn = db.getConnection(); // DB 클래스에 getConnection() 같은 메서드가 있다고 가정합니다.

            String sql = "DELETE FROM bookmark WHERE user_id = ? AND tv_name = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            pstmt.setString(2, name);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // 성공적으로 삭제됨
                System.out.println("Bookmark 삭제 성공");
                return "/WEB-INF/mybookmark.jsp";
            } else {
                // 삭제할 데이터가 없음
                System.out.println("Bookmark 삭제 실패. 해당하는 데이터가 없습니다.");
                return "/WEB-INF/mybookmark.jsp";
            }
        } catch (SQLException e) {
            // SQL 예외 처리
            e.printStackTrace();
            // 예외를 로그에 남기거나 사용자에게 더 의미 있는 응답을 제공할 수 있습니다.
        } finally {
            // finally 블록에서 리소스를 닫습니다.
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // 에러 페이지
        return "/WEB-INF/index.jsp";
    }
}
