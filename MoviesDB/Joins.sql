--1. Write a query in SQL to find the name of all reviewers who have rated their ratings with a NULL value. 
--SELECT * FROM Movies.Reviewer A
--JOIN Movies.Rating B ON A.rev_id = B.rev_id
--WHERE rev_stars IS NULL;

--2. Write a query in SQL to list the first and last names of all the actors who were cast in the movie 'Annie Hall'
--, and the roles they played in that production.
--SELECT A.act_fname, A.act_lname, B.role FROM Movies.Actor A
--JOIN Movies.Movie_cast B ON A.act_id = B.act_id
--JOIN Movies.Movie C ON C.mov_id = B.mov_id
--WHERE C.mov_title = 'Annie Hall';

--3. Write a query in SQL to find the name of movie and director (first and last names) who directed a movie that casted a role for 'Eyes Wide Shut'.
--SELECT C.dir_fname, C.dir_lname FROM Movies.Movie A
--JOIN Movies.Movie_Direction B ON B.mov_id = A.mov_id
--JOIN Movies.Director C ON C.dir_id = B.dir_id
--WHERE A.mov_title = 'Eyes Wide Shut';

--4. Write a query in SQL to find the name of movie and director (first and last names) who directed a movie that casted a role as Sean Maguire
--SELECT D.dir_fname, D.dir_lname, B.mov_title FROM Movies.Movie_cast A
--JOIN Movies.Movie B ON A.mov_id = B.mov_id
--JOIN Movies.Movie_Direction C ON C.mov_id = B.mov_id
--JOIN Movies.Director D ON D.dir_id = C.dir_id
--WHERE A.role = 'Sean Maguire';

--5. Write a query in SQL to list all the actors who have not acted in any movie between 1990 and 2000.
--SELECT A.act_fname, A.act_lname FROM Movies.Actor A
--JOIN Movies.Movie_cast B ON B.act_id = A.act_id
--JOIN Movies.Movie C ON C.mov_id= B.mov_id
--WHERE C.mov_year NOT BETWEEN 1990 AND 2000;

--6. Write a query in SQL to list first and last name of all the directors with number of genres movies the directed with genres name,
--and arranged the result alphabetically with the first and last name of the director.
--SELECT E.dir_fname, E.dir_lname, D.gen_title, COUNT(D.gen_title) AS Quantity FROM Movies.Movie A
--JOIN Movies.Movie_Direction B ON A.mov_id = B.mov_id
--JOIN Movies.Movie_Genres C ON C.mov_id = A.mov_id
--JOIN Movies.Genres D ON D.gen_id = C.gen_id
--JOIN Movies.Director E ON E.dir_id = B.dir_id
--GROUP BY E.dir_fname, E.dir_lname, D.gen_title; 

--7. Write a query in SQL to list all the movies with year and genres. 
--SELECT DISTINCT A.mov_title, A.mov_year, C.gen_title FROM Movies.Movie A
--JOIN Movies.Movie_Genres B ON B.mov_id = A.mov_id
--JOIN Movies.Genres C ON C.gen_id = B.gen_id;

--8. Write a query in SQL to list all the movies with year, genres, and name of the director.
--SELECT E.dir_fname, E.dir_lname, A.mov_title, A.mov_year, C.gen_title FROM Movies.Movie A
--JOIN Movies.Movie_Genres B ON B.mov_id = A.mov_id
--JOIN Movies.Genres C ON C.gen_id = B.gen_id
--JOIN Movies.Movie_Direction D ON D.mov_id = A.mov_id
--JOIN Movies.Director E ON D.dir_id = E.dir_id;

--9. Write a query in SQL to list all the movies with title, year, date of release, movie duration, 
--and first and last name of the director which released before 1st january 1989, 
--and sort the result set according to release date from highest date to lowest.
--SELECT A.mov_title, A.mov_year, A.mov_dt_rel, A.mov_time, C.dir_fname, C.dir_lname FROM Movies.Movie A
--JOIN Movies.Movie_Direction B ON B.mov_id = A.mov_id
--JOIN Movies.Director C ON C.dir_id = B.dir_id
--WHERE A.mov_dt_rel < '1989-01-01'
--ORDER BY A.mov_dt_rel DESC;

--10. Write a query in SQL to compute a report which contain the genres of those movies 
--with their average time and number of movies for each genres.
--SELECT C.gen_title, AVG(A.mov_time) AS AvgTime, COUNT(A.mov_id) AS QUANTITY FROM Movies.Movie A
--JOIN Movies.Movie_Genres B ON A.mov_id = B.mov_id
--JOIN Movies.Genres C ON C.gen_id = B.gen_id
--GROUP BY C.gen_title;

--11. Write a query in SQL to find those lowest duration movies along with the year,
--director's name, actor's name and his/her role in that production.
--SELECT A.mov_year, A.mov_time, C.dir_fname, C.dir_lname, E.act_fname, E.act_lname, D.role FROM Movies.Movie A
--JOIN Movies.Movie_Direction B ON B.mov_id = A.mov_id
--JOIN Movies.Director C ON C.dir_id = B.dir_id
--JOIN Movies.Movie_cast D ON D.mov_id = A.mov_id
--JOIN Movies.Actor E ON E.act_id = D.act_id
--WHERE A.mov_time = (SELECT MIN(A.mov_time) FROM Movies.Movie A);

--12. Write a query in SQL to find name and years which produced a movie that received a rating of 3 or 4, 
--and sort the result in increasing order. 
--SELECT A.mov_title, A.mov_year, B.rev_stars FROM Movies.Movie A
--JOIN Movies.Rating B ON B.mov_id = A.mov_id
--WHERE B.rev_stars IN (3, 4);

--13. Write a query in SQL to return the reviewer name, movie title, and stars in an order that reviewer name will come first,
--then by movie title, and lastly by number of stars.
--SELECT A.rev_name, C.mov_title, B.rev_stars FROM Movies.Reviewer A
--JOIN Movies.Rating B ON B.rev_id = A.rev_id
--JOIN Movies.Movie C ON C.mov_id = B.mov_id
--WHERE A.rev_name IS NOT NULL AND
--	B.rev_stars IS NOT NULL
--ORDER BY A.rev_name ASC, C.mov_title ASC, B.rev_stars ASC

--14. Write a query in SQL to find movie title and number of stars for each movie 
--that has at least one rating and find the highest number of stars that movie received and sort the result by movie title.
--SELECT A.mov_title, MAX(B.rev_stars) AS Stars FROM Movies.Movie A
--JOIN Movies.Rating B ON B.mov_id = A.mov_id
--GROUP BY A.mov_title
--HAVING MAX(B.rev_stars) > 0
--ORDER BY A.mov_title;

--15. Write a query in SQL to find the director's first and last name together with the title of the movie(s)
--they directed and received the rating.
--SELECT CONCAT(A.dir_fname, ' ', A.dir_lname) AS FullName, C.mov_title, D.rev_stars FROM Movies.Director A
--JOIN Movies.Movie_Direction B ON B.dir_id = A.dir_id
--JOIN Movies.Movie C ON C.mov_id = B.mov_id
--JOIN Movies.Rating D ON D.mov_id = B.mov_id
--WHERE D.rev_stars IS NOT NULL;

--16. Write a query in SQL to find the movie title, actor first and last name, and the role for 
--those movies where one or more actors acted in two or more movies.
--SELECT C.act_fname, C.act_lname, A.mov_title FROM Movies.Movie A
--JOIN Movies.Movie_cast B ON B.mov_id = A.mov_id
--JOIN Movies.Actor C ON C.act_id = B.act_id
--WHERE C.act_id IN (
--	SELECT B.act_id FROM Movies.Movie_cast B
--	GROUP BY B.act_id
--	HAVING COUNT(B.act_id) > 1);

--17. Write a query in SQL to find the first and last name of a director and the movie he or she directed, and the actress appeared 
--which first name was Claire and last name was Danes along with her role in that movie.
--SELECT A.act_fname, A.act_lname, E.mov_title, B.role, D.dir_fname, D.dir_lname FROM Movies.Actor A
--JOIN Movies.Movie_cast B ON B.act_id = A.act_id
--JOIN Movies.Movie_Direction C ON C.mov_id = B.mov_id
--JOIN Movies.Director D ON D.dir_id = C.dir_id
--JOIN Movies.Movie E ON E.mov_id = B.mov_id
--WHERE A.act_fname = 'Claire' AND
--	a.act_lname = 'Danes';

--18. Write a query in SQL to find the first and last name of an actor with their role in the movie which was also directed by themselve.
--SELECT A.act_fname, A.act_lname, C.mov_title, B.role FROM Movies.Actor A
--JOIN Movies.Movie_cast B ON B.act_id = A.act_id
--JOIN Movies.Movie C ON C.mov_id = C.mov_id
--JOIN Movies.Movie_Direction D ON D.mov_id = C.mov_id
--JOIN Movies.Director E ON E.dir_id = D.dir_id
--WHERE E.dir_fname = A.act_fname AND
--	E.dir_lname = A.act_lname;

--19. Write a query in SQL to find the cast list for the movie Chinatown.
--SELECT C.act_fname, C.act_lname FROM Movies.Movie A
--JOIN Movies.Movie_cast B ON B.mov_id = A.mov_id
--JOIN Movies.Actor C ON C.act_id = B.act_id
--WHERE A.mov_title = 'Chinatown';

--20. Write a query in SQL to find the movie in which the actor appeared whose first and last name are 'Harrison' and 'Ford'.
--SELECT A.mov_title FROM Movies.Movie A
--JOIN Movies.Movie_cast B ON B.mov_id = A.mov_id
--JOIN Movies.Actor C ON C.act_id = B.act_id
--WHERE C.act_fname = 'Harrison' AND
--	C.act_lname = 'Ford';

--21. Write a query in SQL to find the highest-rated movie, and report its title, year, rating, and releasing country.
--SELECT A.mov_title, A.mov_year, A.mov_rel_country, B.rev_stars FROM Movies.Movie A
--JOIN Movies.Rating B ON B.mov_id = A.mov_id
--WHERE B.rev_stars IN ( SELECT MAX(A.rev_stars) FROM Movies.Rating A);

--22. Write a query in SQL to find the highest-rated Mystery movie, and report the title, year, and rating.
--SELECT A.mov_title, A.mov_year, B.rev_stars FROM Movies.Movie A
--JOIN Movies.Rating B ON B.mov_id = A.mov_id 
--JOIN Movies.Movie_Genres C ON C.mov_id = A.mov_id
--JOIN Movies.Genres D ON D.gen_id = C.gen_id
--WHERE D.gen_title = 'Mystery'
--	AND B.rev_stars IN (
--		SELECT MAX(A.rev_stars) FROM Movies.Rating A
--		JOIN Movies.Movie_Genres B ON B.mov_id = A.mov_id
--		JOIN Movies.Genres C ON B.gen_id = C.gen_id
--		WHERE C.gen_title = 'Mystery');

--23. Write a query in SQL to generate a report which shows the year when the Mystery
--movies produces title and rating. 
--SELECT A.mov_title, A.mov_year, S.BestRating FROM Movies.Movie A,
--	(SELECT A.mov_id, MAX(A.rev_stars) AS BestRating FROM Movies.Rating A
--	JOIN Movies.Movie_Genres B ON B.mov_id = A.mov_id
--	JOIN Movies.Genres C ON C.gen_id = B.gen_id
--	WHERE C.gen_title = 'Mystery'
--	GROUP BY A.mov_id) AS S
--WHERE S.mov_id = A.mov_id;

--24. Write a query in SQL to generate a report which contain the columns movie title, name of the female actor,
--year of the movie, role, movie genres, the director, date of release, and rating of that movie.
--SELECT A.mov_title, A.mov_year, A.mov_dt_rel, E.dir_fname, E.dir_lname, C.act_fname, C.act_lname, F.rev_stars, G.role FROM Movies.Movie A
--JOIN Movies.Movie_cast B ON B.mov_id = A.mov_id
--JOIN Movies.Actor C ON C.act_id = B.act_id
--JOIN Movies.Movie_Direction D ON D.mov_id = A.mov_id
--JOIN Movies.Director E ON E.dir_id = D.dir_id
--JOIN Movies.Rating F ON F.mov_id = A.mov_id
--JOIN Movies.Movie_cast G ON G.act_id = C.act_id 
--WHERE C.act_gender = 'F';