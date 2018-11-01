/*
DROP DATABASE kreativ;
CREATE DATABASE kreativ; */

-- The following script creates relationship and entity tables for our freelance matchmaking platform along with insertion statements. 

USE  kreativ;


CREATE TABLE user_account (
	user_account_id int  NOT NULL AUTO_INCREMENT ,
    password  varchar(32)  NOT NULL,
    email varchar(128)  NOT NULL,
    first_name varchar(128)  NOT NULL,
    last_name varchar(128)  NOT NULL,
    phone varchar(128)  NOT NULL,
    registration_date date  NOT NULL,
    location varchar(32)  NOT NULL,
    PRIMARY KEY (user_account_id));
    
CREATE TABLE portfolio (
    portfolio_id int NOT NULL AUTO_INCREMENT,
    portfolio_name varchar(128)  NOT NULL,
    portfolio_upload BLOB,   
	PRIMARY KEY (portfolio_id));


CREATE TABLE Artist (
    artist_id int  NOT NULL AUTO_INCREMENT,
    short_bio text  NOT NULL,
    hours_worked int  NOT NULL,
    user_account_id int, 
    portfolio_id int, 
    PRIMARY KEY (artist_id),
	FOREIGN KEY (portfolio_id) REFERENCES portfolio(portfolio_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (user_account_id) REFERENCES user_account(user_account_id)    ON UPDATE CASCADE ON DELETE CASCADE);
    
CREATE TABLE skill (
    skill_id  int NOT NULL AUTO_INCREMENT,
	skill_name varchar(128)  NOT NULL,
	PRIMARY KEY (skill_id)
);

CREATE TABLE artist_has_skill (
   skill_id  int NOT NULL AUTO_INCREMENT,
   user_account_id int,
   index(skill_id),
   index(user_account_id),
   FOREIGN KEY (skill_id ) REFERENCES  skill(skill_id),
   FOREIGN KEY (user_account_id) REFERENCES user_account(user_account_id)
);


CREATE TABLE proposal(    
	proposal_id int  NOT NULL AUTO_INCREMENT, 
    proposal_name varchar(128)  NOT NULL,
	proposal_upload BLOB, 
    accepted  BINARY(2), 
	PRIMARY KEY (proposal_id));
    

CREATE TABLE recruiter (
   recruiter_id int  NOT NULL AUTO_INCREMENT,
   company_name varchar(128) ,
   user_account_id int, 
   PRIMARY KEY (recruiter_id),
   FOREIGN KEY (user_account_id) REFERENCES user_account(user_account_id));




CREATE TABLE active_projects ( 
	project_id int  NOT NULL AUTO_INCREMENT, 
    project_name varchar(32)  NOT NULL,
    project_status int, 
    user_account_id int ,
    artist_id int, 
    recruiter_id int, 
	PRIMARY KEY (project_id),
	FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
	FOREIGN KEY (user_account_id) REFERENCES user_account(user_account_id),
	FOREIGN KEY (recruiter_id) REFERENCES recruiter(recruiter_id)) ;
    
    
CREATE TABLE  project_contracts(
	project_id int ,
    proposal_id int , 
	FOREIGN KEY (project_id ) REFERENCES active_projects(project_id ),
	FOREIGN KEY (proposal_id ) REFERENCES proposal(proposal_id )) ;

    

CREATE TABLE timeline(
	project_timeline varchar(128)  NOT NULL,
    start_date datetime, 
    project_id int,
	FOREIGN KEY (project_id ) REFERENCES active_projects(project_id )) ;

   


 
 -- INSERTION 

INSERT INTO user_account (user_account_id ,password, email, first_name, last_name ,phone, registration_date, location  ) VALUES ( 12, "ppppp", "a@gmail.com", "ali", "hassan", 12345,"1999-12-12", "bremen"  );
INSERT INTO user_account (user_account_id ,password, email, first_name, last_name ,phone, registration_date, location  ) VALUES ( 13, "aaaa", "b@gmail.com", "asjs", "jimmy", 12345,"1999-12-12", "hannover"  );
INSERT INTO user_account (user_account_id ,password, email, first_name, last_name ,phone, registration_date, location  ) VALUES ( 14,"vbbbb", "g@gmail.com", "john", "hjinm", 12345,"1999-12-12", "berlin"  );
INSERT INTO user_account (user_account_id , password, email, first_name, last_name ,phone, registration_date, location  ) VALUES (15, "xxxx", "d@gmail.com", "first", "alex", 12345,"1999-12-12", "tunis"  );


INSERT INTO portfolio ( portfolio_name , portfolio_upload , portfolio_id ) VALUES ( "art_demo" , "see link" , 122);
INSERT INTO portfolio ( portfolio_name , portfolio_upload , portfolio_id ) VALUES ( "art_demo_1", "see link", 123);
INSERT INTO portfolio ( portfolio_name , portfolio_upload, portfolio_id ) VALUES ( "art_demo_2", "see link", 124 );
INSERT INTO portfolio ( portfolio_name , portfolio_upload, portfolio_id ) VALUES ( "art_demo_3", "see link" , 125);


INSERT INTO Artist ( short_bio , hours_worked , portfolio_id, user_account_id)  VALUES
    ( 'I like drawing', 44,(SELECT portfolio_id from portfolio WHERE portfolio_id=122),(SELECT user_account_id from user_account WHERE user_account_id=12)),
    ( 'I specialize in photography', 120,(SELECT portfolio_id from portfolio WHERE portfolio_id=123),(SELECT user_account_id from user_account WHERE user_account_id=13)),
    ( 'I like specialize in films ', 125,(SELECT portfolio_id from portfolio WHERE portfolio_id=124),(SELECT user_account_id from user_account WHERE user_account_id=14)),
    ( 'I specialize in acting', 10,(SELECT portfolio_id from portfolio WHERE portfolio_id=124),(SELECT user_account_id from user_account WHERE user_account_id=15));


 
INSERT INTO recruiter ( company_name,  user_account_id)  VALUES
(  "company1",(SELECT user_account_id from user_account WHERE user_account_id=12)),
    (  "company2",(SELECT user_account_id from user_account WHERE user_account_id=13)),
    (  "company3",(SELECT user_account_id from user_account WHERE user_account_id=14)),
    ("company4",(SELECT user_account_id from user_account WHERE user_account_id=15)); 


 
 
INSERT INTO skill( skill_name ) VALUES ( "photography" );
INSERT INTO skill( skill_name ) VALUES ( "graphic design" );
INSERT INTO skill( skill_name ) VALUES ( "painting" );
INSERT INTO skill( skill_name ) VALUES ( "advertising" );
 


INSERT INTO proposal (proposal_name,proposal_upload,accepted ) VALUES (  "bbbbb", "proposal1",1 );
INSERT INTO proposal (proposal_name,proposal_upload,accepted ) VALUES (  "aaa", "proposal2",0 ); 
INSERT INTO proposal (proposal_name,proposal_upload,accepted ) VALUES (  "bababa", "proposal3",0 );  
INSERT INTO proposal (proposal_name,proposal_upload,accepted ) VALUES (  "ahshs", "proposal4",1 );



INSERT INTO active_projects ( project_status,project_name, artist_id, user_account_id , recruiter_id)  VALUES
    ( 50,"website design",(SELECT artist_id from artist WHERE artist_id=1),(SELECT user_account_id from user_account WHERE user_account_id=12),(SELECT recruiter_id from recruiter WHERE recruiter_id=1)) ,
	( 40,"photography", (SELECT artist_id from artist WHERE artist_id=2),(SELECT user_account_id from user_account WHERE user_account_id=13),(SELECT recruiter_id from recruiter WHERE recruiter_id=2)) ,
    ( 30,"singing",(SELECT artist_id from artist WHERE artist_id=3),(SELECT user_account_id from user_account WHERE user_account_id=14),(SELECT recruiter_id from recruiter WHERE recruiter_id=3)) ,
    ( 20,"acting",(SELECT artist_id from artist WHERE artist_id=4),(SELECT user_account_id from user_account WHERE user_account_id=15),(SELECT recruiter_id from recruiter WHERE recruiter_id=4));
   
/*

The following queries showcase the most important features of our artist recruiter matchmaking platform : 
1.
  2. Select artists according to skills and number of hours they have worked . This feature important because it allows the recruiter to see the artist's skills and experience. 
*/

INSERT INTO timeline(project_timeline, start_date, project_id) VALUES 
("30 days", "1999-12-12",(SELECT project_id from active_projects WHERE project_id = 1)),
("40 days", "1998-10-10",(SELECT project_id from active_projects WHERE project_id = 2)), 
 ("7 weeks", "2007-11-12",(SELECT project_id from active_projects WHERE project_id = 3)), 
("2 weeks", "1974-11-11",(SELECT project_id from active_projects WHERE project_id = 4));

 
INSERT INTO project_contracts (project_id, proposal_id) VALUES 
((SELECT project_id from active_projects WHERE project_id = 1), (SELECT proposal_id from proposal WHERE proposal_id = 1)),
 ((SELECT project_id from active_projects WHERE project_id = 2), (SELECT proposal_id from proposal WHERE proposal_id = 2)), 
 ((SELECT project_id from active_projects WHERE project_id = 3), (SELECT proposal_id from proposal WHERE proposal_id = 3)),
 ((SELECT project_id from active_projects WHERE project_id = 4), (SELECT proposal_id from proposal WHERE proposal_id = 4));

INSERT INTO artist_has_skill (skill_id, user_account_id ) VALUES
((SELECT skill_id FROM skill WHERE skill_id = 1), (SELECT user_account_id from user_account WHERE user_account_id = 12)),
((SELECT skill_id FROM skill WHERE skill_id = 2), (SELECT user_account_id from user_account WHERE user_account_id = 13)),
((SELECT skill_id FROM skill WHERE skill_id =3), (SELECT user_account_id from user_account WHERE user_account_id = 14)),
((SELECT skill_id FROM skill WHERE skill_id = 4), (SELECT user_account_id from user_account WHERE user_account_id = 15));



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


/*  
  4. Order  artists by the number of projects they have accepted */
  
  /*SELECT  U.first_name AS artist_first_name , U.last_name AS artist_last_name, A.artist_id , COUNT(*) AS Num_Projects 
  FROM active_projects P
  JOIN user_account U  ON P.user_account_id = U.user_account_id 
    JOIN  artist A ON A.user_account_id = U.user_account_id 
      WHERE A.artist_id IS NOT NULL
      GROUP BY A.user_account_id ; */

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

  
