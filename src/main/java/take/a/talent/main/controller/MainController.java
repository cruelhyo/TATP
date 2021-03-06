package take.a.talent.main.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController
{
	// 두번째 커밋 테스트
	// 세번째 커밋 테스트
	// 관리자 계정 확인 커밋 테스트
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, Model model)
	{
		logger.info("메인요청 테스트");
		return "main";
	}

	@RequestMapping(value = "/anonymous/teammember", method = RequestMethod.GET)
	public String teammember(Locale locale, Model model)
	{
		return "layout/teammember";
	}

	@RequestMapping(value = "/anonymous/mainform", method = RequestMethod.GET)
	public String formtest()
	{
		return "layout/form";
	}
	
	@RequestMapping(value = "/anonymous/usePage", method = RequestMethod.GET)
	public String howToUse()
	{
		return "user/usePage";
	}
	
	@RequestMapping(value = "/anonymous/classSearch", method = RequestMethod.GET)
	public String classSearch()
	{
		return "user/classSearch";
	}
	
	@RequestMapping(value = "/anonymous/fileuploadform", method = RequestMethod.GET)
	public String fileupload()
	{
		return "file/fileUploadForm";
	}
	
}
