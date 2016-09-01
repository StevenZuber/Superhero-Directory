<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%>
<html>
<head>
<title>Heroes List</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css" />

</head>
<body>
	<div class="HeroInfo">
		<table class="table table-striped">
			<tr>
				<th>Hero Name</th>
				<th>Alter Ego</th>
				<th>Universe</th>
				<th>Has Cape</th>
				<th>Powers</th>
				<th>Arch Nemesis</th>
			</tr>

		<c:forEach var="hero" items="${heroList}">
	<!-- 		<option value="${hero.heroName}">${hero.heroName}</option> -->

			
				<tr>
					<td>${hero.heroName}</td>
					<td>${hero.alterEgo }</td>
					<td>${hero.universe }</td>
					<td>${hero.hasCape }</td>
					<td>${hero.power }</td>
					<td>${hero.archNemesis }</td>
					<td>	
						<form action="removeHero.do" method="POST">
						<input type="hidden" value="${hero.heroName}" name="heroName" />
						<input type="submit" value="Delete Hero" />
						</form>
					</td>
				</tr>
		</c:forEach>
			</table>
	</div>
	<br>
			<a href="addHero.html">Add Hero to Directory</a>
			<br>
			<a href="goToChangeHero.do">Change a Hero's Name</a>
			<br>
			<a href="goToKillNemesis.do">Kill a Nemesis</a>

</body>
</html>