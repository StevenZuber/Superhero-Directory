package web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
//@SessionAttributes("oldBoss")
public class SuperheroDirectoryController {
	@Autowired
	private HeroDAO HeroDAO;

	
	@RequestMapping("Heroes.do")
	public ModelAndView firstBoss(String firstBoss) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("view.jsp");
		mv.addObject("heroList", HeroDAO.getHeroes());
		return mv;	
	}
	@RequestMapping(path="addHero.do", method=RequestMethod.POST)
	public ModelAndView newHero(Hero hero) {
		HeroDAO.addHero(hero);
		ModelAndView mv = new ModelAndView();
		mv.addObject("heroList", HeroDAO.getHeroes());
		mv.setViewName("view.jsp");
		return mv;
}
}