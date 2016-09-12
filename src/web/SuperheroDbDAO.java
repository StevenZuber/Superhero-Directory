package web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SuperheroDbDAO implements HeroDAO {

	private static final String url = "jdbc:mysql://localhost:3306/superhero";
	private static final String user = "user";
	private static final String pword = "user";
	List<Hero> heroes = new ArrayList<>();
	
	public SuperheroDbDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}
	
	@Override
	public List<Hero> getHeroes() {
		try {
			Connection conn = DriverManager.getConnection(url, user, pword);
			String sqltxt;
			sqltxt = "SELECT hero_name, alter_ego, universe, has_cape, power, arch_nemesis FROM superhero";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sqltxt);
			while(rs.next()){
				heroes.add(new Hero(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)));
			}
			
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace(System.err);
		}
		return heroes;
	}

	@Override
	public Hero getHero() {
		return null;
	}

	@Override
	public void addHero(Hero hero) {
		try {
			Connection conn = DriverManager.getConnection(url, user, pword);
			String sqltxt;
			sqltxt = "INSERT INTO superhero(hero_name, alter_ego, universe, has_cape, power, arch_nemesis) " 
					+ " VALUES ( ?, ?, ?, ?, ?, ? )";
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			stmt.setString(1, hero.getHeroName());
			stmt.setString(2, hero.getAlterEgo());
			stmt.setString(3, hero.getUniverse());
			stmt.setString(4, hero.getHasCape());
			stmt.setString(5, hero.getPower());
			stmt.setString(6, hero.getArchNemesis());
			int uc = stmt.executeUpdate();
			if(uc == 1){
				System.out.println("Hero Added.");
			}
			else{
				System.err.println("No Hero Added.");
			}
			stmt.close();
			conn.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace(System.err);
		}
	}

	@Override
	public void removeHero(Hero hero) {
		try {
			Connection conn = DriverManager.getConnection(url, user, pword);
			String sqltxt;
			sqltxt = "DELETE FROM superhero WHERE hero_name = ?";
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			stmt.setString(1, hero.getHeroName());
//			stmt.setString(2, hero.getAlterEgo());
//			stmt.setString(3, hero.getUniverse());
//			stmt.setString(4, hero.getHasCape());
//			stmt.setString(5, hero.getPower());
//			stmt.setString(6, hero.getArchNemesis());
			int uc = stmt.executeUpdate();
			if(uc == 1){
				System.out.println("Hero Deleted.");
			}
			else{
				System.err.println("No Hero Deleted.");
			}
			stmt.close();
			conn.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace(System.err);
		}
	}

	@Override
	public Hero getHeroByName(String heroName) {
		Hero hero = null;
		try {
			Connection conn = DriverManager.getConnection(url, user, pword);
			String sqltxt;
			sqltxt = "SELECT hero_name, alter_ego, universe, has_cape, power, arch_nemesis FROM superhero WHERE hero_name = ?";
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			stmt.setString(1, heroName);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
				hero = new Hero(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
			}
			
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace(System.err);
		}
		return hero;
	}

	@Override
	public Hero changeName(Hero hero) {
			try {
				Connection conn = DriverManager.getConnection(url, user, pword);
				String sqltxt;
				sqltxt = "UPDATE superhero SET hero_name = ? WHERE hero_name = ?;";
				PreparedStatement stmt = conn.prepareStatement(sqltxt);
				stmt.setString(1, hero.getHeroName());
				stmt.setString(2, hero.getAlterEgo());
				stmt.setString(3, hero.getUniverse());
				stmt.setString(4, hero.getHasCape());
				stmt.setString(5, hero.getPower());
				stmt.setString(6, hero.getArchNemesis());
				int uc = stmt.executeUpdate();
				if(uc == 1){
					System.out.println("Hero Name Changes.");
					
				}
				else{
					System.err.println("No Name Change.");
				}
				stmt.close();
				conn.close();
			} catch (SQLException sqle) {
				sqle.printStackTrace(System.err);
			}
			return hero;
		
	}

	@Override
	public Hero changeName() {
		// TODO Auto-generated method stub
		return null;
	}

}
