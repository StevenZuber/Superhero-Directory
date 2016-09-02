<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%>
<title>Change Name</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
	<ul>
			<li><a href="Heroes.do" >See Hero Directory</a></li>
			<li><a href="addHero.html">Add Hero to Directory</a></li>
			<li><a class="active" href="goToChangeHero.do">Change a Hero's Name</a></li>
			<li><a href="goToKillNemesis.do">Kill a Nemesis</a></li>
</ul>
</head>
<body>
	<h3>Change a Hero's Name</h3>
	<form class=flat:hover action="changeHero.do" method="POST">
		<select name="heroName">
			<c:forEach var="hero" items="${heroList}">
				<option value="${hero.heroName}">${hero.heroName}</option>
			</c:forEach>
		</select> New Name: <input type="text" name="newName" placeholder="" /><br />
		<input type="submit" value="Change Name" />
	</form>

</body>
</html>