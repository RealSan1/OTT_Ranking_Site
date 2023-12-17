package OTT_202044092;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="*.do",
		initParams= {@WebInitParam(name="config", value="/WEB-INF/commandHandler.properties")})
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	// <커맨드, 핸들러인스턴스> 매핑 정보 저장
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	//서블릿을 생성하고 초기화할 떄 제일 먼저 호출되는 init() 메소드를 이용
	public void init(ServletConfig config) throws ServletException {
		String configFile = config.getInitParameter("config");
		Properties prop = new Properties();
		String configFilePath = config.getServletContext().getRealPath(configFile);
		System.out.println("Config File Path: " + configFilePath);
		// 설정 파일을 prop 객체 로드
		try(FileInputStream fis = new FileInputStream(configFilePath)){
			prop.load(fis);
		}catch (FileNotFoundException e) {
		    // 파일을 찾을 수 없는 경우
		    e.printStackTrace();
		    throw new ServletException("Config file not found: " + configFilePath, e);
		} catch (IOException e) {
		    // 파일을 읽을 수 없는 경우
		    e.printStackTrace();
		    throw new ServletException("Error loading config file: " + configFilePath, e);
		}
		
		// 설정 파일을 하나씩 읽어서 키값(호출패턴)과 실행명령 핸들러명을 읽어 맵에 저장
		Iterator<Object> keyIter = prop.keySet().iterator();
		while (keyIter.hasNext()) {
		    String command = (String) keyIter.next();
		    String handlerClassName = prop.getProperty(command);
		    //System.out.println("Command: " + command + ", Handler Class: " + handlerClassName);
		    try {
		        Class<?> handlerClass = Class.forName(handlerClassName);
		        CommandHandler handlerInstance = (CommandHandler) handlerClass.newInstance();
		        commandHandlerMap.put(command, handlerInstance);
		    } catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
		        throw new ServletException(e);
		    }
		}
		
	}
	
	
    public ControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비즈니스 로직을 처리하는 부분
		
		// request.getRequestURI() => /week11/hello.do
		String command = request.getRequestURI();
		command = command.substring(request.getContextPath().length() + 1);
		System.out.println("command : "+ command);
		// 위 명령문 실행 결과 command = hello.do
		
		// 인터페이스 변수 선언
		// 인터페이스 변수 = 구현 객체
		CommandHandler handler = commandHandlerMap.get(command);
		String viewPage = null;
		viewPage = handler.process(request, response);
		
		if(viewPage != null) {
			RequestDispatcher rd = request.getRequestDispatcher(viewPage);
			rd.forward(request, response);
		}
		
	}

}
