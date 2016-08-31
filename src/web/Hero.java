package web;

public class Hero {
	private String heroName;
	private String alterEgo;
	private String universe;
	private String hasCape;
	private String power;
	private String archNemesis;
	
	public Hero(){}
	
	public Hero(String heroName, String alterEgo, String universe, String hasCape, String power, String archNemesis) {
		super();
		this.heroName = heroName;
		this.alterEgo = alterEgo;
		this.universe = universe;
		this.hasCape = hasCape;
		this.power = power;
		this.archNemesis = archNemesis;
	}



	public String getHeroName() {
		return heroName;
	}
	
	
	public void setHeroName(String heroName) {
		this.heroName = heroName;
	}
	public String getAlterEgo() {
		return alterEgo;
	}
	public void setAlterEgo(String alterEgo) {
		this.alterEgo = alterEgo;
	}
	public String getUniverse() {
		return universe;
	}
	public void setUniverse(String universe) {
		this.universe = universe;
	}
	public String getHasCape() {
		return hasCape;
	}
	public void setHasCape(String hasCape) {
		this.hasCape = hasCape;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public String getArchNemesis() {
		return archNemesis;
	}
	public void setArchNemesis(String archNemesis) {
		this.archNemesis = archNemesis;
	}

	@Override
	public String toString() {
		return "Hero [heroName=" + heroName + ", alterEgo=" + alterEgo + ", universe=" + universe + ", hasCape="
				+ hasCape + ", power=" + power + ", archNemesis=" + archNemesis + "]";
	}
}
