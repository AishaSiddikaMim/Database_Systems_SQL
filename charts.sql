(4th) 1/ --------- Team_Name & Points (CHART)

SELECT Team_Name, Points
FROM Team NATURAL JOIN Point_Table;

(Vertcal_points)


(2nd) 3/ ------Result>goal count
>winning team name, match_name, Match_date
[not solved]


(1st) 4/ match_id--->count ---- chart

Select Home Team, Team count(match_id) as total_match
From Match
union
Select Away Team,Team count(match_id) as total_match
From Match
Group by home team, away team;

Select Home_Team as Team_name_count, count(match_id) as total_match
From Match
union
Select Away_Team as Team_name_count, count(match_id) as total_match
From Match
Group by Team_name_count;

[not solved]


(3rd) 5/ stadium_name, schedule, match connects
matches per stadium

Select stadium_name, count(Match_ID) as total_match
From stadium, schedule Natural joins match
Where stadium.stadium_name = schedule.stadium;

[not implimented yet]


6/ Select refree_name, count(match_id) as total_match
from referee natural join match;


8/golden ball---->nominees

Select player_name
From player
where number_of_goals > 2 ;

[solved]

9/ number of goals highest ----> player name..... golden boot
[not solved]

10/ number of goals----rw, lw 




PENDING

1/ result form report, point report------make
2/ match form report--------make
4/ MATSER DETAIL FORM REPORT
5/ PARAMETERIZED REPORT

Select player_name, number_of_goals
Form Player
Group by player_name;
















percentage;; 30+26+24+20 // 28+26+24+18 // EVERYONE'S WORK THROUHOUT THE PROJECT 


                  30 ---------> Adip
                      26 ---------> Aisha
                          24 ---------> Anik
                               20 ---------> Tamanna


Tamanna;; Data entry format creation, data entry data excel, primary and foreign key corrections, data entry(halka)

Adip;; trigger, data entry, sql report, er diagarm, er diagram edit, sql (update, rename, create, delete), authentication, authorization, user creation, 
sequence, screenshots add in the report

Anik;; data entry data excel, form and report creation, image form report, home page slider add, master detail, sql report, paremeeterized report, aggregate,
page authentication, authorization, report writing help

Aisha;; data entry data excel, form and report creation, image entry, login page background and logo, chart, sql report, master detail, aggregate, page
authentication, authorization, report writing









