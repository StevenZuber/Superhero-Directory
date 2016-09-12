package web;

import java.util.List;
public interface HeroDAO {
	
		public List<Hero> getHeroes();
		public Hero getHero();
		void addHero(Hero hero);
		void removeHero(Hero hero);
		Hero getHeroByName(String heroName);
		public Hero changeName();
		public Hero changeName(Hero hero);
	}


