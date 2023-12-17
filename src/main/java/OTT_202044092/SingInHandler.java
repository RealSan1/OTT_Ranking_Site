package OTT_202044092;
import ex.user_info;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SingInHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse reponse) throws IOException{
		return "/WEB-INF/Sing_In.jsp";
	}

}
