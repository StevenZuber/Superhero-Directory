<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%>
<html>
<head>
<title>Heroes List</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
	<ul>
			<li><a class="active" href="Heroes.do" >See Hero Directory</a></li>
			<li><a href="addHero.html">Add Hero to Directory</a></li>
			<li><a href="goToChangeHero.do">Change a Hero's Name</a></li>
			<li><a href="goToKillNemesis.do">Kill a Nemesis</a></li>
			<li style="float:right"><a class="about" href="https://www.linkedin.com/in/steven-zuber-9849095b">About the Author</a></li>
</ul>
</head>
<body class="view">
	<div class="HeroInfo">
		<table class="table table-striped">
			<tr>
				<th>Hero Name</th>
				<th>Alter Ego</th>
				<th>Universe</th>
				<th>Has Cape</th>
				<th>Powers</th>
				<th>Arch Nemesis</th>
				<th>Remove</th>
			</tr>

		<c:forEach var="hero" items="${heroList}">
	<!-- 		<option value="${hero.heroName}">${hero.heroName}</option> -->

			
				<tr>
					<td>
					<a href="goToChangeHero.do">${hero.heroName }</a>
					</td>
					<td>${hero.alterEgo }</td>
					<td>${hero.universe }</td>
					<td>${hero.hasCape }</td>
					<td>${hero.power }</td>
					<td>${hero.archNemesis }</td>
					<td>	
						<form action="removeHero.do" method="POST">
						<input type="hidden" value="${hero.heroName}" name="heroName" />
						<input class=btn-group-lg type="submit" value="Delete Hero" />
						</form>
					</td>
				</tr>
		</c:forEach>
			</table>
	</div>

</body>
</html>