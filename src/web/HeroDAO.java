package web;

import java.util.List;
public interface HeroDAO {
	
		public List<Hero> getHeroes();
		public Hero getHero();
		Hero getFindHero(String heroName);
		void addHero(Hero hero);

	}


