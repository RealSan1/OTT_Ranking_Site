package OTT_202044092;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindIDHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse reponse) throws IOException{
		return "/WEB-INF/Find_Id.jsp";
	}

}
