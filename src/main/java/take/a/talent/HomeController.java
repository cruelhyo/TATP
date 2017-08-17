package take.a.talent;

import java.text.DateFormat;
import java.util.Date;
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
//컨트롤러 부여 취소
/*@Controller*/
public class HomeController
{
	// 두번째 커밋 테스트
	// 세번째 커밋 테스트
	// 관리자 계정 확인 커밋 테스트
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Locale locale, Model model)
	{
		return "main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login()
	{
		return "user/login";
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String formtest()
	{
		return "layout/form";
	}

}


/*
 * logger.info("Welcome home! The client locale is {}.", locale);
 * 
 * Date date = new Date(); DateFormat dateFormat =
 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
 * 
 * String formattedDate = dateFormat.format(date);
 * 
 * model.addAttribute("serverTime", formattedDate);
 */
