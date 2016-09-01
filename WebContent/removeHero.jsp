<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
<meta charset="UTF-8">
<title>Hero Remover</title>
</head>
<body>
	<div class="heroSelect">
		<form action="removeHero.do" method="POST">
			<select name="heroName">
				<c:forEach var="hero" items="${heroList}">
					<option value="${hero.heroName}">${hero.heroName}</option>
				</c:forEach>
			</select> 
			<br>
			<input type="submit" name="button" value="Remove Hero" /><br>
		</form>
	</div>
</body>
</html>