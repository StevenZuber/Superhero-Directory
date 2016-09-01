package web;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;


public class HeroFileDAO implements HeroDAO
{
	private static final String FILE_NAME="/WEB-INF/heroesList.csv";
	private List<Hero> heroes = new ArrayList<>();
	
	@Autowired 
	private WebApplicationContext wac;

	@PostConstruct
	public void init() {
		// Retrieve an input stream from the servlet context
		// rather than directly from the file system
		try (
				InputStream is = wac.getServletContext().getResourceAsStream(FILE_NAME);
				BufferedReader buf = new BufferedReader(new InputStreamReader(is));
			) {
			String line = buf.readLine();
			while ((line = buf.readLine()) != null) {
				String[] tokens = line.split(",");
				String heroName = tokens[0];
				String alterEgo = tokens[1];
				String universe = tokens[2];
				String hasCape = tokens[3];
				String power = tokens[4];
				String archNemesis = tokens[5];
				heroes.add(new Hero(heroName, alterEgo, universe, hasCape, power, archNemesis));
			}
		} catch (Exception e) {
			System.err.println(e);

		}
		
		for (Hero hero : heroes) {
			System.out.println(hero);
			System.out.println(heroes);
		}
	}

	@Override
	public List<Hero> getHeroes() 
	{
		return heroes;
	}


	@Override
	public Hero getHeroByName(String heroName) {
		Hero h = null;
		for(Hero hero : heroes) {
			if (hero.getHeroName().equals(heroName)){
				h = hero;
				break;
			}
		}
			return h;
	}

	@Override
	public Hero getHero() {

		return null;
	}
	
	@Override
	public void addHero(Hero hero){
		heroes.add(hero);
	}
	@Override
	//find the method that removes by index number. 
	//this method also needs to match hero name to index number.
	public void removeHero(Hero hero){
		heroes.remove(hero);
	}
}
