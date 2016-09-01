package web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		mv.setViewName("view.jsp");
		return mv;
	}
	
	@RequestMapping("goToChangeHero.do")
	public ModelAndView goToChangeName(){
		ModelAndView mv = new ModelAndView();
		mv.addObject("heroList", heroDAO.getHeroes());
		mv.setViewName("changeName.jsp");
		return mv;
	}
	@RequestMapping("changeHero.do")
	public ModelAndView changeName(@RequestParam("heroName") String oldName,
									@RequestParam("newName") String newName) {
		Hero oldHero = heroDAO.getHeroByName(oldName);
		oldHero.setHeroName(newName);
		ModelAndView mv = new ModelAndView();
		mv.addObject("heroList", heroDAO.getHeroes());
		mv.setViewName("view.jsp");
		return mv;
	}
		@RequestMapping("dropDown.do")
		public ModelAndView dropDown() {
			ModelAndView mv = new ModelAndView();
			mv.addObject("heroList", heroDAO.getHeroes());
			mv.setViewName("removeHero.jsp");
			return mv;
	}
		@RequestMapping("goToKillNemesis.do")
		public ModelAndView goToKillNemesis(){
			ModelAndView mv = new ModelAndView();
			mv.addObject("heroList", heroDAO.getHeroes());
			mv.setViewName("killNemesis.jsp");
			return mv;
		}
		@RequestMapping("killNemesis.do")
		public ModelAndView KillNemesis(@RequestParam("heroName") String heroName){
			Hero murderer = heroDAO.getHeroByName(heroName);
			String deadNemesis = murderer.getArchNemesis(); 
			murderer.setArchNemesis("RIP " + deadNemesis);
			//find the nemesis associated with the incoming hero name
			//also set condition for empty string to display none if no nemesis
			ModelAndView mv = new ModelAndView();
			mv.addObject("heroList", heroDAO.getHeroes());
			mv.setViewName("view.jsp");
			return mv;
		}
}