<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Heroes List</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css" />

</head>
<body>
	<div class="HeroInfo">
		<table>
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
					
				</tr>
		</c:forEach>
			</table>



	</div>

</body>
</html>