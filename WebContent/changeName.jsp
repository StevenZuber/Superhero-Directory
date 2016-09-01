<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%>
<title>Change Name</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css" />

</head>
<body>
	<h3>Change a Hero's Name</h3>
	<form action="changeHero.do" method="POST">
		<select name="heroName">
			<c:forEach var="hero" items="${heroList}">
				<option value="${hero.heroName}">${hero.heroName}</option>
			</c:forEach>
		</select> New Name: <input type="text" name="newName" placeholder="" /><br />
		<input type="submit" value="Change Name" />
	</form>
	<br>
	<a href="Heroes.do">See Hero Directory</a>
	<br>
	<a href="addHero.html">Add Hero to Directory</a>
	<br>
	<a href="goToKillNemesis.do">Kill a Nemesis</a>
</body>
</html>