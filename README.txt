This website was created as the weekend project at the end of week 7 of Skill Distillery and was written by Steven Zuber.
The goal of the project was to create a website that incorporated CRUD (Create, Read, Update, and Delete)
functionality work with at least one of the objects through a web gui.

I chose to make a simple superhero directory for this project. Users are able to view the full directory,
add new heroes (complete with various specifications) to the directory, delete heroes, and "kill" the hero's arch nemesis.

Technologies used include Java, Spring MVC, basic jsp, and html/css. The css is rather simple and doesn't utilize a bootstrap.

I would like to add a live search bar where the user can begin typing on the main directory page and see the
list update live as they type characters.

The primary stumbling block I encountered was making pages that were accessed by links contain all of the intended content.
Doing this involved including a step where clicks would redirect to a short method that passed the appropriate information to the page,
then forwarded the request to a separate method.  
