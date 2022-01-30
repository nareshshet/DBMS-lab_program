CREATE TABLE ACTOR (
    ACT_ID INT (5) PRIMARY KEY,
    ACT_NAME VARCHAR (20),
    ACT_GENDER CHAR (1)
);

CREATE TABLE DIRECTOR (
    DIR_ID INT (5) PRIMARY KEY,
    DIR_NAME VARCHAR (20),
    DIR_PHONE BIGINT
);

CREATE TABLE MOVIES (
    MOV_ID INT (4) PRIMARY KEY,
    MOV_TITLE VARCHAR (50),
    MOV_YEAR INT (4),
    MOV_LANG VARCHAR (20),
    DIR_ID INT (5),
    FOREIGN KEY (DIR_ID) REFERENCES DIRECTOR(DIR_ID)
);

CREATE TABLE MOVIES_CAST (
    ACT_ID INT (5),
    MOV_ID INT (5),
    ROLE VARCHAR (20),
    PRIMARY KEY (ACT_ID, MOV_ID),
    FOREIGN KEY (ACT_ID) REFERENCES ACTOR (ACT_ID),
    FOREIGN KEY (MOV_ID) REFERENCES MOVIES (MOV_ID)
);

CREATE TABLE RATING (
    MOV_ID INT (5) PRIMARY KEY,
    REV_STARS VARCHAR (25),
    FOREIGN KEY (MOV_ID) REFERENCES MOVIES (MOV_ID)
);

INSERT INTO
    ACTOR
VALUES
    (1, ’ MADHURI DIXIT ’, ’ F ’);

INSERT INTO
    ACTOR
VALUES
    (2, ’ AAMIR KHAN ’, ’ M ’);

INSERT INTO
    ACTOR
VALUES
    (3, ’ JUHI CHAWLA ’, ’ F ’);

INSERT INTO
    ACTOR
VALUES
    (4, ’ SRIDEVI ’, ’ F ’);

INSERT INTO
    DIRECTOR
VALUES
    (100, ’ SUBHASH KAPOOR ’, 9563400156);

INSERT INTO
    DIRECTOR
VALUES
    (102, 'ALAN TAYLOR', 9971960035);

INSERT INTO
    DIRECTOR
VALUES
    (103, ’ SANTHOSH ANANDDRAM ’, 9934611125);

INSERT INTO
    DIRECTOR
VALUES
    (104, ’ IMTIAZ ALI ’, 8539920975);

INSERT INTO
    DIRECTOR
VALUES
    (105, 'HITCHCOCK', 7766138911);

INSERT INTO
    DIRECTOR
VALUES
    (106, 'STEVEN SPIELBERG', 9966138934);

INSERT INTO
    MOVIES
VALUES
    (501, 'JAB HARRY MET SEJAL', 2017, 'HINDI', 104);

INSERT INTO
    MOVIES
VALUES
    (502, 'RAJAKUMARA', 2017, 'KANNADA', 103);

INSERT INTO
    MOVIES
VALUES
    (503, 'JOLLY LLB 2', 2013, 'HINDI', 100);

INSERT INTO
    MOVIES
VALUES
    (504, 'TERMINATOR GENESYS', 2015, 'ENGLISH', 102);

INSERT INTO
    MOVIES
VALUES
    (505, 'JAWS', 1975, 'ENGLISH', 106);

INSERT INTO
    MOVIES
VALUES
    (506, 'BRIDGE OF SPIES', 2015, 'ENGLISH', 106);

INSERT INTO
    MOVIES
VALUES
    (507, 'VERTIGO', 1943, 'ENGLISH', 105);

INSERT INTO
    MOVIES
VALUES
    (
        508,
        ’ SHADOW OF A DOUBT ',1943,' ENGLISH ', 105);




















































INSERT INTO MOVIES_CAST VALUES (1, 501,' HEROINE ');
INSERT INTO MOVIES_CAST VALUES (1, 502,' HEROINE ');
INSERT INTO MOVIES_CAST VALUES (3, 503,' COMEDIAN ');
INSERT INTO MOVIES_CAST VALUES (4, 504,' GUEST ');
INSERT INTO MOVIES_CAST VALUES (4, 501,' HERO ');




















































INSERT INTO RATING VALUES (501, 4);
INSERT INTO RATING VALUES (502, 2);
INSERT INTO RATING VALUES (503, 5);
INSERT INTO RATING VALUES (504, 4);
INSERT INTO RATING VALUES (505, 3);
INSERT INTO RATING VALUES (506, 2);






















1. List the titles of all movies directed by ‘Hitchcock’.
SELECT MOV_TITLE FROM MOVIES M, DIRECTOR D WHERE M.DIR_ID=D.DIR_ID
AND DIR_NAME=' HITCHCOCK ';
































Find the movie names where one or more actors acted in two or more movies.
SELECT MOV_TITLE FROM MOVIES M,MOVIES_CAST MV
WHERE M.MOV_ID=MV.MOV_ID AND ACT_ID IN(SELECT ACT_ID FROM
MOVIES_CAST GROUP BY ACT_ID HAVING COUNT(ACT_ID)>1);








List all actors who acted in a movie before 2000 and also in a movie after 2015 (use JOIN
operation).
SELECT ACT_NAME, MOV_TITLE, MOV_YEAR FROM ACTOR A JOIN
MOVIE_CAST C ON A.ACT_ID=C.ACT_ID INNER JOIN MOVIES M
ON C.MOV_ID=M.MOV_ID WHERE M.MOV_YEAR NOT BETWEEN 2000 AND 2015;














Find the title of movies and number of stars for each movie that has at least one rating and
find the highest number of stars that movie received. Sort the result by movie title.
SELECT MOV_TITLE,MAX(REV_STARS) FROM MOVIES M ,RATING R WHERE
M.MOV_ID=R.MOV_ID GROUP BY R.MOV_ID HAVING MAX(REV_STARS)>0 ORDER
BY MOV_TITLE;













Update rating of all movies directed by ‘Steven Spielberg’ to 5
UPDATE RATING SET REV_STARS=5 WHERE MOV_ID IN(SELECT MOV_ID FROM
MOVIES WHERE DIR_ID IN(SELECT DIR_ID FROM DIRECTOR
WHERE DIR_NAME=' STEVEN SPIELBERG '));