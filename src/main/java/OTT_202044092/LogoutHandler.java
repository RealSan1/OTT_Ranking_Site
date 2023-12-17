package OTT_202044092;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse reponse) throws IOException{
		HttpSession session = request.getSession();
		session.invalidate();  // 현재 세션의 모든 정보 제거
		return "index.jsp";
	}

}
