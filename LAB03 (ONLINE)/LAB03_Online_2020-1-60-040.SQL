--------------- A.

CREATE TABLE ACTORS(
id                NUMBER,
first_name   VARCHAR2(30),
last_name    VARCHAR2(30),
gender        CHAR(30),
CONSTRAINT MOVIES_PK PRIMARY KEY (id)
);

--------------- B.

CREATE TABLE MOVIES(
id                NUMBER,
name           VARCHAR2(30),
year            NUMBER,
CONSTRAINT ACTORS_PK PRIMARY KEY (id)
);

--------------- C.

CREATE TABLE ROLES(
actor_id                NUMBER,
movie_id              NUMBER,
role                      VARCHAR2(20),
CONSTRAINT ROLES_PK PRIMARY KEY (actor_id, movie_id),
CONSTRAINT ACT_FK FOREIGN KEY (actor_id) REFERENCES ACTORS (id),
CONSTRAINT MOV_FK FOREIGN KEY (movie_id) REFERENCES MOVIES (id)
);

---------------- INSERT VALUES

INSERT INTO ACTORS VALUES (433259, 'William',    'Shatner',  'M');
INSERT INTO ACTORS VALUES (797926, 'Britney',    'Spears',    'F');
INSERT INTO ACTORS VALUES (433259, 'Sigourney', 'Weaver',  'F');

INSERT INTO MOVIES VALUES (112290, 'Fight Club',            1999);
INSERT INTO MOVIES VALUES (209658, 'Meet the Parents',  2000);
INSERT INTO MOVIES VALUES (210511, 'Momento',             2000);

INSERT INTO ROLES VALUES (433259, 313398, 'Capt. James T. Kirk');
INSERT INTO ROLES VALUES (433259, 407323, 'Sgt T. J Hooker');
INSERT INTO ROLES VALUES (433259, 342189, 'Herself');

-----------------------Single table queries

------------------------------A.

SELECT *
FROM ACTORS
WHERE first_name = 'Julia';

------------------------------B.

SELECT MOVIES.id, name
FROM MOVIES
WHERE year BETWEEN 1994 AND 2001;

------------------------------C.

SELECT actor_id
FROM MOVIES
WHERE id  = 112290;

-----------------------Multiple table queries

------------------------------A.

SELECT role
FROM MOVIES, ROLES
WHERE MOVIES.id = ROLES.movie_id AND  MOVIES.name ='Pi';

------------------------------B.

SELECT first_name, last_name, role
FROM ACTORS, MOVIES, ROLES
WHERE ACTORS.id = ROLES.actor_id AND MOVIES.id = ROLES.movie_id AND  MOVIES.name ='Pi';

------------------------------C.

SELECT first_name, last_name
FROM MOVIES, ACTORS, ROLES
WHERE ACTORS.id = ROLES.actor_id AND MOVIES.id = ROLES.movie_id AND  MOVIES.name = 'Kill Bill : Vol .1' AND  MOVIES.name = 'Kill Bill : Vol .2';



