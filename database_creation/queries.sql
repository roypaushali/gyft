
-- QUERIES IMPORTANT TO OUR FREELANCE ARTIST MATCHMAKING PLATFORM.

/*1.  Select artists according to skills and number of hours they have worked . This feature important because it allows the recruiter to see the artist's skills and experience. */

SELECT t1.first_name, t1.last_name, t2.hours_worked  
	FROM user_account t1 
   JOIN artist t2 
	ON t1.user_account_id = t2.user_account_id; 

/*  2.  Display combinations of project names  and  the recruiters behind them */

SELECT P.project_name, U.first_name AS recruiter_first_name , U.last_name AS recruiter_last_name, R.recruiter_id
	FROM active_projects P
	JOIN user_account U  ON P.user_account_id = U.user_account_id 
    JOIN  recruiter R ON R.user_account_id = U.user_account_id 
      WHERE R.recruiter_id IS NOT NULL; 
 
/*  3.  Display combinations of project names and   the artists behind them */

SELECT P.project_name, U.first_name AS artist_first_name , U.last_name AS artist_last_name, A.artist_id
	FROM active_projects P
	JOIN user_account U  ON P.user_account_id = U.user_account_id 
    JOIN  artist A ON A.user_account_id = U.user_account_id 
      WHERE A.artist_id IS NOT NULL; 


SELECT * FROM active_projects;
/*  
  4. Order  artists by the number of projects they have accepted */
  
  SELECT  U.first_name AS artist_first_name , U.last_name AS artist_last_name, A.artist_id , COUNT(*) AS Num_Projects 
  FROM active_projects P
  JOIN user_account U  ON P.user_account_id = U.user_account_id 
    JOIN  artist A ON A.user_account_id = U.user_account_id 
      WHERE A.artist_id IS NOT NULL
      GROUP BY A.user_account_id ; 

/*  5. Display active projects and their timelines */

SELECT P.project_name, T.project_timeline
    FROM active_projects P
	JOIN  timeline T ON T.project_id = P.project_id;
  
  /*  6. Average hours of work experience per artist */


SELECT AVG(hours_worked) FROM  Artist;

 /*  7. MAXIMUM of hours worked per artist */


SELECT MAX(hours_worked) FROM  Artist ;

 /*  8. MINIMUM of hours worked per artist*/
 
SELECT MIN(hours_worked) FROM  Artist As least_experienced;

/*9. The name of the most experienced artist */

 SELECT  U.first_name AS artist_first_name , U.last_name AS artist_last_name, A.artist_id , A.hours_worked
  FROM user_account U
    JOIN  artist A ON A.user_account_id = U.user_account_id 
      WHERE A.hours_worked = (SELECT MAX(hours_worked) FROM  Artist) ;

/*9. The name of the least experienced artist */

 SELECT  U.first_name AS artist_first_name , U.last_name AS artist_last_name, A.artist_id , A.hours_worked
  FROM user_account U
    JOIN  artist A ON A.user_account_id = U.user_account_id 
	HAVING A.hours_worked = (SELECT MIN(hours_worked) FROM  Artist) ;

  /* 10. STATISTICS ON THE PLATFORM : TOTAL NUMBER OF ARTISTS AND RECRUITERS*/
  
SELECT COUNT( recruiter_id), "number of recruiters" FROM recruiter 
UNION SELECT COUNT( artist_id),"number of artists" FROM artist ;

/*11.The users whoSE PASSWORD LENGTH IS LESS THAN 5 */

SELECT first_name, last_name FROM user_account 
	WHERE LENGTH(password) < 5;
    
/* Select users whose email is not valid  */
SELECT  first_name, last_name FROM user_account WHERE email NOT LIKE '%_@__%.__%';
