-- creation
create table Fixtures (
	MatchNumber int primary key,
	HomeTeam varchar(20),
	AwayTeam varchar(20),
	Venue varchar(30),
	TeamWon varchar(20),
	TeamLost varchar(20),
	Dummy_Column int
);

create table TeamDetails (
	SI_No int primary key,
	Team_Name varchar(200) not null,
	Captain varchar(200),
	Owner varchar(200),
	Home_Ground varchar(200),
	Dummy_Column int
);

create table points (
	Team_Name varchar(20) primary key,
	no_of_wins int,
	no_of_loss int,
	points int
);

select * from teamdetails;

-- other milestones

select count(si_no) from teamdetails;

copy zip_codes FROM 'C:\Users\nsaikj\Downloads\fixtures.txt' DELIMITER ',' CSV
COPY teamdetails FROM 'C:\Users\nsaikj\Downloads\fixtures.txt' WITH (FORMAT csv);

select * from fixtures where 'RCB' ~ hometeam;
SELECT VENUE, TEAMLOST FROM FIXTURES WHERE 'KOLKATA' ~ VENUE;

INSERT INTO POINTS (TEAM_NAME, NO_OF_WINS)
SELECT TEAM_WON AS TEAM_NAME, COUNT(TEAM_WON) AS NO_OF_WINS FROM FIXTURES
GROUP BY TEAM_WON
HAVING COUNT(TEAM_WON) > 8
ORDER BY COUNT(TEAM_WON) DESC

INSERT INTO POINTS (TEAM_NAME, NO_OF_LOSS)
SELECT TEAM_LOST AS TEAM_NAME, COUNT(TEAM_LOST) AS NO_OF_LOSS FROM FIXTURES
GROUP BY TEAM_LOST
HAVING COUNT(TEAM_LOST) = 8
ORDER BY COUNT(TEAM_LOST) DESC

INSERT INTO POINTS (TEAM_NAME, NO_OF_WINS)
SELECT TEAM_WON AS TEAM_NAME,COUNT(TEAM_WON) AS NO_OF_WINS FROM FIXTURES
WHERE TEAM_WON NOT IN (
	SELECT TEAM_NAME FROM POINTS
)

GROUP BY TEAM_WON
HAVING COUNT(TEAM_WON) BETWEEN 6 AND 7
ORDER BY COUNT(TEAM_WON) DESC

INSERT INTO POINTS (TEAM_NAME, NO_OF_WINS, POINTS)
SELECT TEAM_WON AS TEAM_NAME,COUNT(TEAM_WON) AS NO_OF_WINS, COUNT(TEAM_WON) * 2  AS POINTSS FROM FIXTURES…

SELECT TEAM_NAME, NO_OF_LOSS FROM POINTS WHERE TEAM_NAME ~ 'PK'


SELECT TEAM_NAME, POINTSS FROM POINTS
WHERE POINTSS > (
	SELECT POINTSS FROM POINTS WHERE TEAM_NAME ~ 'RR'
)
