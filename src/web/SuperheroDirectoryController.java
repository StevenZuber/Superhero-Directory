package web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
// @SessionAttributes("oldBoss")
public class SuperheroDirectoryController {
	@Autowired
	private HeroDAO heroDAO;

	@RequestMapping("Heroes.do")
	public ModelAndView view() {
		ModelAndView mv = new ModelAndView();
//		mv.setViewName("removeHero.jsp");
		mv.setViewName("view.jsp");
		mv.addObject("heroList", heroDAO.getHeroes());
		return mv;
	}

	@RequestMapping(path = "addHero.do", method = RequestMethod.POST)
	public ModelAndView newHero(Hero hero) {
		heroDAO.addHero(hero);
		ModelAndView mv = new ModelAndView();
		mv.addObject("heroList", heroDAO.getHeroes());
		mv.setViewName("view.jsp");
		return mv;
	}
	@RequestMapping("removeHero.do")
	public ModelAndView removeHero(String heroName) {
		heroDAO.removeHero(heroDAO.getHeroByName(heroName));
		ModelAndView mv = new ModelAndView();
		mv.addObject("heroList", heroDAO.getHeroes());
		System.out.println("+++++++++" + heroName);
		mv.setViewName("view.jsp");
		return mv;
	}
		@RequestMapping("dropDown.do")
		public ModelAndView dropDown() {
			ModelAndView mv = new ModelAndView();
			mv.addObject("heroList", heroDAO.getHeroes());
//			System.out.println("============="+HeroDAO.getHeroes());
			mv.setViewName("removeHero.jsp");
			return mv;
	}
}