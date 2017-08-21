package take.a.talent;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
		return "main";
	}

	@RequestMapping(value = "/teammember", method = RequestMethod.GET)
	public String teammember(Locale locale, Model model)
	{
		return "layout/teammember";
	}

	@RequestMapping(value = "/mainform", method = RequestMethod.GET)
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
