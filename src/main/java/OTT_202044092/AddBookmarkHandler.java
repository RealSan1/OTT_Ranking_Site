package OTT_202044092;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//북마크 중복방지 추가필요
public class AddBookmarkHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {

		DB db = new DB();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ArrayList<String> temp = new ArrayList<>();
		boolean status = false;

		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("result");
		String user_id = request.getParameter("user_id");
		System.out.println("User ID: " + user_id);

		// 이전 페이지 URL 저장
		String URL = request.getParameter("current_url");
		System.out.println("URL 주소: " + URL);

		try {
			conn = db.getConnection();
			String sql = "insert into bookmark values (?, ?)";
			String check = "select tv_name from bookmark where user_id ='" + user_id + "'";
			Statement stmt_c = conn.createStatement();
			ResultSet rs_c = stmt_c.executeQuery(check);

			while (rs_c.next()) {
				temp.add(rs_c.getString("tv_name"));
			}

			status = true; // 신규 유저인경우
			for (int i = 0; i < temp.size(); i++) {
				if (temp.get(i).equals(title)) // 중복방지
				{
					status = false;
					break;
				} else {
					status = true;
				}
			}
			if (status == true) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user_id);
				pstmt.setString(2, title);
				pstmt.executeUpdate();
				System.out.println("Bookmark 성공(" + title + ")");

				response.getWriter().write("<script>");
				response.getWriter().write("window.location.href = '" + URL + "';");
				response.getWriter().write("</script>");

				return null;

			} else {

				System.out.println("이미 북마크한 내용");
				response.getWriter().write("<script>");
				response.getWriter().write("window.location.href = '" + URL + "';");
				response.getWriter().write("</script>");

				return null;
			}

		} catch (SQLException e) {
			// SQL 예외가 발생한 경우 처리
			e.printStackTrace(); // 콘솔에 예외 정보 출력
			// 실패했을 경우 추가 작업
			System.out.println("Bookmark 실패(SQL오류)");
			return "index.jsp";
		} finally {
			// 자원 해제
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}
}
