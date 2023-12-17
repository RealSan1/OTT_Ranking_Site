package OTT_202044092;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HboHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse reponse) throws IOException{
		return "/WEB-INF/Hbo.jsp";
	}

}
