/* Nash Lawrence
2022 College Football Preview
'cfb_teamdata' table has data on all 77 college football teams in one of the
major 6 conferences (ACC, AAC, Big Ten, Big12, Pac12, SEC) and two independent
schools (Notre Dame and BYU). Variables include team statistics from last
year, including offensive/defensive statistics,
team wins/losses (overall, conference, home/away), returning production,
transfer/portal and recruiting rankings, etc. */

-- Use collegefootball schema
USE collegefootball;

-- Declare Primary Key
ALTER TABLE teamdata ADD PRIMARY KEY(team_id);

-- Full dataset
SELECT * FROM teamdata;



-- filter data for teams meeting criteria, ranking teams by conference, looking at data for teams in a certain category, etc. 

-- National Rankings

-- Yards per Game
SELECT row_number() OVER(order by total_offense DESC) AS 'Rank', team_name AS 'Team', total_offense AS 'Yards', 
points_perGame AS 'PPG' FROM teamdata
ORDER BY total_offense DESC;

-- Points per Game
SELECT row_number() OVER(order by points_perGame DESC) AS 'Rank', 
team_name AS 'Team', points_perGame AS 'PPG', total_offense AS 'Yards' FROM teamdata
ORDER BY points_perGame DESC;

-- Total Defense
SELECT row_number() OVER(order by total_defense) AS 'Rank', 
team_name AS 'Team', total_defense AS 'Yards Allowed', ppg_allowed AS 'Scoring Defense' FROM teamdata
ORDER BY total_defense;

-- Scoring Defense
SELECT row_number() OVER(order by ppg_allowed) AS 'Rank', 
team_name AS 'Team', ppg_allowed AS 'Scoring Defense', total_defense AS 'Yards Allowed' FROM teamdata
ORDER BY ppg_allowed;

-- Passing Offense
SELECT row_number() OVER(order by pass_offense DESC) AS 'Rank', 
team_name AS 'Team', pass_offense AS 'Pass Offense', points_perGame AS 'PPG' FROM teamdata
ORDER BY pass_offense DESC;

-- Rushing Offense
SELECT row_number() OVER(order by run_offense DESC) AS 'Rank', 
team_name AS 'Team', run_offense AS 'Run Offense', points_perGame AS 'PPG' FROM teamdata
ORDER BY run_offense DESC;

-- Pass Defense
SELECT row_number() OVER(order by pass_defense) AS 'Rank', 
team_name AS 'Team', pass_defense AS 'Pass Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
ORDER BY pass_defense;

-- Run Defense
SELECT row_number() OVER(order by run_defense) AS 'Rank', 
team_name AS 'Team', run_defense AS 'Run Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
ORDER BY run_defense;

-- Third Down Offense
SELECT row_number() OVER(order by thirdDown_offense DESC) AS 'Rank', 
team_name 'Team', thirdDown_offense AS '3rd Down Offense', points_perGame AS 'PPG' FROM teamdata
ORDER BY thirdDown_offense DESC;

-- Third Down Defense
SELECT row_number() OVER(order by thirdDown_defense) AS 'Rank', 
team_name AS 'Team', thirdDown_defense AS '3rd Down Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
ORDER BY thirdDown_defense;

-- Total Sacks
SELECT row_number() OVER(order by team_sacks DESC) AS 'Rank', 
team_name AS 'Team', team_sacks AS 'Sacks', ppg_allowed AS 'Scoring Defense' FROM teamdata
ORDER BY team_sacks DESC;

-- Sacks Allowed
SELECT row_number() OVER(order by sacks_allowed) AS 'Rank',
team_name AS 'Team', sacks_allowed AS 'Sacks Allowed', points_perGame AS 'PPG' FROM teamdata
ORDER BY sacks_allowed;

-- Redzone Offense
SELECT row_number() OVER(order by redzone_offense DESC) AS 'Rank',
team_name AS 'Team', redzone_offense AS 'Redzone Offense TD Rate', points_perGame AS 'PPG'
FROM teamdata ORDER BY redzone_offense DESC;

-- Redzone Defense
SELECT row_number() OVER(order by redzone_defense) AS 'Rank',
team_name AS 'Team', redzone_defense AS 'Redzone Defense TD Rate', ppg_allowed AS 'Scoring Defense'
FROM teamdata ORDER BY redzone_defense;

-- Turnover Margin
SELECT row_number() OVER(order by turnover_margin DESC) AS 'Rank',
team_name AS 'Team', turnover_margin AS 'Turnover Margin',
CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
ORDER BY turnover_margin DESC;

-- Returning Production
SELECT row_number() OVER(order by returning_productionPercent DESC) AS 'Rank', 
team_name 'Team', returning_productionPercent AS 'Returning Production %',
total_wins AS '2021 Wins' FROM teamdata
ORDER BY returning_productionPercent DESC;

-- Recruiting Ranks
SELECT row_number() OVER(order by recruitingRankAvg_lastTwoYr) AS 'Rank', 
team_name AS 'Team', recruitingRankAvg_lastTwoYr AS '2021/2022 Recruiting Rank', 
returning_productionPercent AS 'Returning Production %' FROM teamdata
ORDER BY recruitingRankAvg_lastTwoYr;

-- Transfer Portal
SELECT row_number() OVER(order by transferPortal_points DESC) AS 'Rank', 
team_name AS 'Team', transferPortal_points AS 'Transfer Portal Points', 
total_wins AS '2021 Wins' FROM teamdata
ORDER BY transferPortal_points DESC;


-- ACC Rankings

-- Yards per Game
SELECT row_number() OVER(order by total_offense DESC) AS 'Rank', team_name AS 'Team', total_offense AS 'Yards', 
points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "ACC"
ORDER BY total_offense DESC;

-- Points per Game
SELECT row_number() OVER(order by points_perGame DESC) AS 'Rank', 
team_name AS 'Team', points_perGame AS 'PPG', total_offense AS 'Yards' FROM teamdata
WHERE team_conference = "ACC"
ORDER BY points_perGame DESC;

-- Total Defense
SELECT row_number() OVER(order by total_defense) AS 'Rank', 
team_name AS 'Team', total_defense AS 'Yards Allowed', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "ACC"
ORDER BY total_defense;

-- Scoring Defense
SELECT row_number() OVER(order by ppg_allowed) AS 'Rank', 
team_name AS 'Team', ppg_allowed AS 'Scoring Defense', total_defense AS 'Yards Allowed' FROM teamdata
WHERE team_conference = "ACC"
ORDER BY ppg_allowed;

-- Passing Offense
SELECT row_number() OVER(order by pass_offense DESC) AS 'Rank', 
team_name AS 'Team', pass_offense AS 'Pass Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "ACC"
ORDER BY pass_offense DESC;

-- Rushing Offense
SELECT row_number() OVER(order by run_offense DESC) AS 'Rank', 
team_name AS 'Team', run_offense AS 'Run Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "ACC"
ORDER BY run_offense DESC;

-- Pass Defense
SELECT row_number() OVER(order by pass_defense) AS 'Rank', 
team_name AS 'Team', pass_defense AS 'Pass Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "ACC"
ORDER BY pass_defense;

-- Run Defense
SELECT row_number() OVER(order by run_defense) AS 'Rank', 
team_name AS 'Team', run_defense AS 'Run Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "ACC"
ORDER BY run_defense;

-- Third Down Offense
SELECT row_number() OVER(order by thirdDown_offense DESC) AS 'Rank', 
team_name 'Team', thirdDown_offense AS '3rd Down Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "ACC"
ORDER BY thirdDown_offense DESC;

-- Third Down Defense
SELECT row_number() OVER(order by thirdDown_defense) AS 'Rank', 
team_name AS 'Team', thirdDown_defense AS '3rd Down Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "ACC"
ORDER BY thirdDown_defense;

-- Total Sacks
SELECT row_number() OVER(order by team_sacks DESC) AS 'Rank', 
team_name AS 'Team', team_sacks AS 'Sacks', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "ACC"
ORDER BY team_sacks DESC;

-- Returning Production
SELECT row_number() OVER(order by returning_productionPercent DESC) AS 'Rank', 
team_name 'Team', returning_productionPercent AS 'Returning Production %',
total_wins AS '2021 Wins' FROM teamdata
WHERE team_conference = "ACC"
ORDER BY returning_productionPercent DESC;

-- Recruiting Ranks
SELECT row_number() OVER(order by recruitingRankAvg_lastTwoYr) AS 'Rank', 
team_name AS 'Team', recruitingRankAvg_lastTwoYr AS '2021/2022 Recruiting Rank', 
returning_productionPercent AS 'Returning Production %' FROM teamdata
WHERE team_conference = "ACC"
ORDER BY recruitingRankAvg_lastTwoYr;

-- Transfer Portal
SELECT row_number() OVER(order by transferPortal_points DESC) AS 'Rank', 
team_name AS 'Team', transferPortal_points AS 'Transfer Portal Points', 
total_wins AS '2021 Wins' FROM teamdata
WHERE team_conference = "ACC"
ORDER BY transferPortal_points DESC;


-- AAC

-- Yards per Game
SELECT row_number() OVER(order by total_offense DESC) AS 'Rank', team_name AS 'Team', total_offense AS 'Yards', 
points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "AAC"
ORDER BY total_offense DESC;

-- Points per Game
SELECT row_number() OVER(order by points_perGame DESC) AS 'Rank', 
team_name AS 'Team', points_perGame AS 'PPG', total_offense AS 'Yards' FROM teamdata
WHERE team_conference = "AAC"
ORDER BY points_perGame DESC;

-- Total Defense
SELECT row_number() OVER(order by total_defense) AS 'Rank', 
team_name AS 'Team', total_defense AS 'Yards Allowed', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "AAC"
ORDER BY total_defense;

-- Scoring Defense
SELECT row_number() OVER(order by ppg_allowed) AS 'Rank', 
team_name AS 'Team', ppg_allowed AS 'Scoring Defense', total_defense AS 'Yards Allowed' FROM teamdata
WHERE team_conference = "AAC"
ORDER BY ppg_allowed;

-- Passing Offense
SELECT row_number() OVER(order by pass_offense DESC) AS 'Rank', 
team_name AS 'Team', pass_offense AS 'Pass Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "AAC"
ORDER BY pass_offense DESC;

-- Rushing Offense
SELECT row_number() OVER(order by run_offense DESC) AS 'Rank', 
team_name AS 'Team', run_offense AS 'Run Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "AAC"
ORDER BY run_offense DESC;

-- Pass Defense
SELECT row_number() OVER(order by pass_defense) AS 'Rank', 
team_name AS 'Team', pass_defense AS 'Pass Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "AAC"
ORDER BY pass_defense;

-- Run Defense
SELECT row_number() OVER(order by run_defense) AS 'Rank', 
team_name AS 'Team', run_defense AS 'Run Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "AAC"
ORDER BY run_defense;

-- Third Down Offense
SELECT row_number() OVER(order by thirdDown_offense DESC) AS 'Rank', 
team_name 'Team', thirdDown_offense AS '3rd Down Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "AAC"
ORDER BY thirdDown_offense DESC;

-- Third Down Defense
SELECT row_number() OVER(order by thirdDown_defense) AS 'Rank', 
team_name AS 'Team', thirdDown_defense AS '3rd Down Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "AAC"
ORDER BY thirdDown_defense;

-- Total Sacks
SELECT row_number() OVER(order by team_sacks DESC) AS 'Rank', 
team_name AS 'Team', team_sacks AS 'Sacks', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "AAC"
ORDER BY team_sacks DESC;

-- Returning Production
SELECT row_number() OVER(order by returning_productionPercent DESC) AS 'Rank', 
team_name 'Team', returning_productionPercent AS 'Returning Production %',
total_wins AS '2021 Wins' FROM teamdata
WHERE team_conference = "AAC"
ORDER BY returning_productionPercent DESC;

-- Recruiting Ranks
SELECT row_number() OVER(order by recruitingRankAvg_lastTwoYr) AS 'Rank', 
team_name AS 'Team', recruitingRankAvg_lastTwoYr AS '2021/2022 Recruiting Rank', 
returning_productionPercent AS 'Returning Production %' FROM teamdata
WHERE team_conference = "AAC"
ORDER BY recruitingRankAvg_lastTwoYr;

-- Transfer Portal
SELECT row_number() OVER(order by transferPortal_points DESC) AS 'Rank', 
team_name AS 'Team', transferPortal_points AS 'Transfer Portal Points', 
total_wins AS '2021 Wins' FROM teamdata
WHERE team_conference = "AAC"
ORDER BY transferPortal_points DESC;


-- Big Ten

-- Yards per Game
SELECT row_number() OVER(order by total_offense DESC) AS 'Rank', team_name AS 'Team', total_offense AS 'Yards', 
points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "Big Ten"
ORDER BY total_offense DESC;

-- Points per Game
SELECT row_number() OVER(order by points_perGame DESC) AS 'Rank', 
team_name AS 'Team', points_perGame AS 'PPG', total_offense AS 'Yards' FROM teamdata
WHERE team_conference = "Big Ten"
ORDER BY points_perGame DESC;

-- Total Defense
SELECT row_number() OVER(order by total_defense) AS 'Rank', 
team_name AS 'Team', total_defense AS 'Yards Allowed', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Big Ten"
ORDER BY total_defense;

-- Scoring Defense
SELECT row_number() OVER(order by ppg_allowed) AS 'Rank', 
team_name AS 'Team', ppg_allowed AS 'Scoring Defense', total_defense AS 'Yards Allowed' FROM teamdata
WHERE team_conference = "Big Ten"
ORDER BY ppg_allowed;

-- Passing Offense
SELECT row_number() OVER(order by pass_offense DESC) AS 'Rank', 
team_name AS 'Team', pass_offense AS 'Pass Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "Big Ten"
ORDER BY pass_offense DESC;

-- Rushing Offense
SELECT row_number() OVER(order by run_offense DESC) AS 'Rank', 
team_name AS 'Team', run_offense AS 'Run Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "Big Ten"
ORDER BY run_offense DESC;

-- Pass Defense
SELECT row_number() OVER(order by pass_defense) AS 'Rank', 
team_name AS 'Team', pass_defense AS 'Pass Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Big Ten"
ORDER BY pass_defense;

-- Run Defense
SELECT row_number() OVER(order by run_defense) AS 'Rank', 
team_name AS 'Team', run_defense AS 'Run Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Big Ten"
ORDER BY run_defense;

-- Third Down Offense
SELECT row_number() OVER(order by thirdDown_offense DESC) AS 'Rank', 
team_name 'Team', thirdDown_offense AS '3rd Down Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "Big Ten"
ORDER BY thirdDown_offense DESC;

-- Third Down Defense
SELECT row_number() OVER(order by thirdDown_defense) AS 'Rank', 
team_name AS 'Team', thirdDown_defense AS '3rd Down Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Big Ten"
ORDER BY thirdDown_defense;

-- Total Sacks
SELECT row_number() OVER(order by team_sacks DESC) AS 'Rank', 
team_name AS 'Team', team_sacks AS 'Sacks', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Big Ten"
ORDER BY team_sacks DESC;

-- Returning Production
SELECT row_number() OVER(order by returning_productionPercent DESC) AS 'Rank', 
team_name 'Team', returning_productionPercent AS 'Returning Production %',
total_wins AS '2021 Wins' FROM teamdata
WHERE team_conference = "Big Ten"
ORDER BY returning_productionPercent DESC;

-- Recruiting Ranks
SELECT row_number() OVER(order by recruitingRankAvg_lastTwoYr) AS 'Rank', 
team_name AS 'Team', recruitingRankAvg_lastTwoYr AS '2021/2022 Recruiting Rank', 
returning_productionPercent AS 'Returning Production %' FROM teamdata
WHERE team_conference = "Big Ten"
ORDER BY recruitingRankAvg_lastTwoYr;

-- Transfer Portal
SELECT row_number() OVER(order by transferPortal_points DESC) AS 'Rank', 
team_name AS 'Team', transferPortal_points AS 'Transfer Portal Points', 
total_wins AS '2021 Wins' FROM teamdata
WHERE team_conference = "Big Ten"
ORDER BY transferPortal_points DESC;


-- Big 12

-- Yards per Game
SELECT row_number() OVER(order by total_offense DESC) AS 'Rank', team_name AS 'Team', total_offense AS 'Yards', 
points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "Big12"
ORDER BY total_offense DESC;

-- Points per Game
SELECT row_number() OVER(order by points_perGame DESC) AS 'Rank', 
team_name AS 'Team', points_perGame AS 'PPG', total_offense AS 'Yards' FROM teamdata
WHERE team_conference = "Big12"
ORDER BY points_perGame DESC;

-- Total Defense
SELECT row_number() OVER(order by total_defense) AS 'Rank', 
team_name AS 'Team', total_defense AS 'Yards Allowed', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Big12"
ORDER BY total_defense;

-- Scoring Defense
SELECT row_number() OVER(order by ppg_allowed) AS 'Rank', 
team_name AS 'Team', ppg_allowed AS 'Scoring Defense', total_defense AS 'Yards Allowed' FROM teamdata
WHERE team_conference = "Big12"
ORDER BY ppg_allowed;

-- Passing Offense
SELECT row_number() OVER(order by pass_offense DESC) AS 'Rank', 
team_name AS 'Team', pass_offense AS 'Pass Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "Big12"
ORDER BY pass_offense DESC;

-- Rushing Offense
SELECT row_number() OVER(order by run_offense DESC) AS 'Rank', 
team_name AS 'Team', run_offense AS 'Run Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "Big12"
ORDER BY run_offense DESC;

-- Pass Defense
SELECT row_number() OVER(order by pass_defense) AS 'Rank', 
team_name AS 'Team', pass_defense AS 'Pass Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Big12"
ORDER BY pass_defense;

-- Run Defense
SELECT row_number() OVER(order by run_defense) AS 'Rank', 
team_name AS 'Team', run_defense AS 'Run Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Big12"
ORDER BY run_defense;

-- Third Down Offense
SELECT row_number() OVER(order by thirdDown_offense DESC) AS 'Rank', 
team_name 'Team', thirdDown_offense AS '3rd Down Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "Big12"
ORDER BY thirdDown_offense DESC;

-- Third Down Defense
SELECT row_number() OVER(order by thirdDown_defense) AS 'Rank', 
team_name AS 'Team', thirdDown_defense AS '3rd Down Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Big12"
ORDER BY thirdDown_defense;

-- Total Sacks
SELECT row_number() OVER(order by team_sacks DESC) AS 'Rank', 
team_name AS 'Team', team_sacks AS 'Sacks', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Big12"
ORDER BY team_sacks DESC;

-- Returning Production
SELECT row_number() OVER(order by returning_productionPercent DESC) AS 'Rank', 
team_name 'Team', returning_productionPercent AS 'Returning Production %',
total_wins AS '2021 Wins' FROM teamdata
WHERE team_conference = "Big12"
ORDER BY returning_productionPercent DESC;

-- Recruiting Ranks
SELECT row_number() OVER(order by recruitingRankAvg_lastTwoYr) AS 'Rank', 
team_name AS 'Team', recruitingRankAvg_lastTwoYr AS '2021/2022 Recruiting Rank', 
returning_productionPercent AS 'Returning Production %' FROM teamdata
WHERE team_conference = "Big12"
ORDER BY recruitingRankAvg_lastTwoYr;

-- Transfer Portal
SELECT row_number() OVER(order by transferPortal_points DESC) AS 'Rank', 
team_name AS 'Team', transferPortal_points AS 'Transfer Portal Points', 
total_wins AS '2021 Wins' FROM teamdata
WHERE team_conference = "Big12"
ORDER BY transferPortal_points DESC;


-- Pac12

-- Yards per Game
SELECT row_number() OVER(order by total_offense DESC) AS 'Rank', team_name AS 'Team', total_offense AS 'Yards', 
points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "Pac12"
ORDER BY total_offense DESC;

-- Points per Game
SELECT row_number() OVER(order by points_perGame DESC) AS 'Rank', 
team_name AS 'Team', points_perGame AS 'PPG', total_offense AS 'Yards' FROM teamdata
WHERE team_conference = "Pac12"
ORDER BY points_perGame DESC;

-- Total Defense
SELECT row_number() OVER(order by total_defense) AS 'Rank', 
team_name AS 'Team', total_defense AS 'Yards Allowed', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Pac12"
ORDER BY total_defense;

-- Scoring Defense
SELECT row_number() OVER(order by ppg_allowed) AS 'Rank', 
team_name AS 'Team', ppg_allowed AS 'Scoring Defense', total_defense AS 'Yards Allowed' FROM teamdata
WHERE team_conference = "Pac12"
ORDER BY ppg_allowed;

-- Passing Offense
SELECT row_number() OVER(order by pass_offense DESC) AS 'Rank', 
team_name AS 'Team', pass_offense AS 'Pass Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "Pac12"
ORDER BY pass_offense DESC;

-- Rushing Offense
SELECT row_number() OVER(order by run_offense DESC) AS 'Rank', 
team_name AS 'Team', run_offense AS 'Run Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "Pac12"
ORDER BY run_offense DESC;

-- Pass Defense
SELECT row_number() OVER(order by pass_defense) AS 'Rank', 
team_name AS 'Team', pass_defense AS 'Pass Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Pac12"
ORDER BY pass_defense;

-- Run Defense
SELECT row_number() OVER(order by run_defense) AS 'Rank', 
team_name AS 'Team', run_defense AS 'Run Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Pac12"
ORDER BY run_defense;

-- Third Down Offense
SELECT row_number() OVER(order by thirdDown_offense DESC) AS 'Rank', 
team_name 'Team', thirdDown_offense AS '3rd Down Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "Pac12"
ORDER BY thirdDown_offense DESC;

-- Third Down Defense
SELECT row_number() OVER(order by thirdDown_defense) AS 'Rank', 
team_name AS 'Team', thirdDown_defense AS '3rd Down Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Pac12"
ORDER BY thirdDown_defense;

-- Total Sacks
SELECT row_number() OVER(order by team_sacks DESC) AS 'Rank', 
team_name AS 'Team', team_sacks AS 'Sacks', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "Pac12"
ORDER BY team_sacks DESC;

-- Returning Production
SELECT row_number() OVER(order by returning_productionPercent DESC) AS 'Rank', 
team_name 'Team', returning_productionPercent AS 'Returning Production %',
total_wins AS '2021 Wins' FROM teamdata
WHERE team_conference = "Pac12"
ORDER BY returning_productionPercent DESC;

-- Recruiting Ranks
SELECT row_number() OVER(order by recruitingRankAvg_lastTwoYr) AS 'Rank', 
team_name AS 'Team', recruitingRankAvg_lastTwoYr AS '2021/2022 Recruiting Rank', 
returning_productionPercent AS 'Returning Production %' FROM teamdata
WHERE team_conference = "Pac12"
ORDER BY recruitingRankAvg_lastTwoYr;

-- Transfer Portal
SELECT row_number() OVER(order by transferPortal_points DESC) AS 'Rank', 
team_name AS 'Team', transferPortal_points AS 'Transfer Portal Points', 
total_wins AS '2021 Wins' FROM teamdata
WHERE team_conference = "Pac12"
ORDER BY transferPortal_points DESC;



-- SEC

-- Yards per Game
SELECT row_number() OVER(order by total_offense DESC) AS 'Rank', team_name AS 'Team', total_offense AS 'Yards', 
points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "SEC"
ORDER BY total_offense DESC;

-- Points per Game
SELECT row_number() OVER(order by points_perGame DESC) AS 'Rank', 
team_name AS 'Team', points_perGame AS 'PPG', total_offense AS 'Yards' FROM teamdata
WHERE team_conference = "SEC"
ORDER BY points_perGame DESC;

-- Total Defense
SELECT row_number() OVER(order by total_defense) AS 'Rank', 
team_name AS 'Team', total_defense AS 'Yards Allowed', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "SEC"
ORDER BY total_defense;

-- Scoring Defense
SELECT row_number() OVER(order by ppg_allowed) AS 'Rank', 
team_name AS 'Team', ppg_allowed AS 'Scoring Defense', total_defense AS 'Yards Allowed' FROM teamdata
WHERE team_conference = "SEC"
ORDER BY ppg_allowed;

-- Passing Offense
SELECT row_number() OVER(order by pass_offense DESC) AS 'Rank', 
team_name AS 'Team', pass_offense AS 'Pass Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "SEC"
ORDER BY pass_offense DESC;

-- Rushing Offense
SELECT row_number() OVER(order by run_offense DESC) AS 'Rank', 
team_name AS 'Team', run_offense AS 'Run Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "SEC"
ORDER BY run_offense DESC;

-- Pass Defense
SELECT row_number() OVER(order by pass_defense) AS 'Rank', 
team_name AS 'Team', pass_defense AS 'Pass Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "SEC"
ORDER BY pass_defense;

-- Run Defense
SELECT row_number() OVER(order by run_defense) AS 'Rank', 
team_name AS 'Team', run_defense AS 'Run Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "SEC"
ORDER BY run_defense;

-- Third Down Offense
SELECT row_number() OVER(order by thirdDown_offense DESC) AS 'Rank', 
team_name 'Team', thirdDown_offense AS '3rd Down Offense', points_perGame AS 'PPG' FROM teamdata
WHERE team_conference = "SEC"
ORDER BY thirdDown_offense DESC;

-- Third Down Defense
SELECT row_number() OVER(order by thirdDown_defense) AS 'Rank', 
team_name AS 'Team', thirdDown_defense AS '3rd Down Defense', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "SEC"
ORDER BY thirdDown_defense;

-- Total Sacks
SELECT row_number() OVER(order by team_sacks DESC) AS 'Rank', 
team_name AS 'Team', team_sacks AS 'Sacks', ppg_allowed AS 'Scoring Defense' FROM teamdata
WHERE team_conference = "SEC"
ORDER BY team_sacks DESC;

-- Returning Production
SELECT row_number() OVER(order by returning_productionPercent DESC) AS 'Rank', 
team_name 'Team', returning_productionPercent AS 'Returning Production %',
total_wins AS '2021 Wins' FROM teamdata
WHERE team_conference = "SEC"
ORDER BY returning_productionPercent DESC;

-- Recruiting Ranks
SELECT row_number() OVER(order by recruitingRankAvg_lastTwoYr) AS 'Rank', 
team_name AS 'Team', recruitingRankAvg_lastTwoYr AS '2021/2022 Recruiting Rank', 
returning_productionPercent AS 'Returning Production %' FROM teamdata
WHERE team_conference = "SEC"
ORDER BY recruitingRankAvg_lastTwoYr;

-- Transfer Portal
SELECT row_number() OVER(order by transferPortal_points DESC) AS 'Rank', 
team_name AS 'Team', transferPortal_points AS 'Transfer Portal Points', 
total_wins AS '2021 Wins' FROM teamdata
WHERE team_conference = "SEC"
ORDER BY transferPortal_points DESC;







-- Filters

-- Teams with new Coaches
SELECT team_name AS 'Team', CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE new_headCoach = "Y"
ORDER BY team_conference;

-- Teams above average in total offense and defense (Off = 402.2, Def = 375.6)
SELECT team_name AS 'Team', total_offense AS 'Yards', total_defense AS 'Yards Allowed', 
CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE total_offense > (SELECT AVG(total_offense) FROM teamdata)
AND total_defense < (SELECT AVG(total_defense) FROM teamdata)
ORDER BY total_offense DESC;

-- Teams below average in total offense (402.2) and total defense (375.6)
SELECT team_name AS 'Team', total_offense AS 'Yards', total_defense AS 'Yards Allowed',
CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE total_offense < (SELECT AVG(total_offense) FROM teamdata)
AND total_defense > (SELECT AVG(total_defense) FROM teamdata)
ORDER BY total_defense;

-- Teams top 25 in recruiting with 7 or more wins last year (22 teams without the 7 wins filter)
SELECT team_name AS 'Team', recruitingRankAvg_lastTwoYr AS '2021/2022 Recruiting Rank',
CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE recruitingRankAvg_lastTwoYr < 25.5 AND total_wins >= 7
ORDER BY total_wins DESC;

-- Teams outside the top 40 in recruiting with 7 or more wins last year
SELECT team_name AS 'Team', recruitingRankAvg_lastTwoYr AS '2021/2022 Recruiting Rank',
returning_productionPercent AS 'Returning Production %', transferPortal_points AS 'Transfer Portal Points',
CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE recruitingRankAvg_lastTwoYr > 39.5 AND total_wins >=7
ORDER BY total_wins DESC;

-- Teams above average in third down offense (0.4) and thrid down defense (0.39)
SELECT team_name AS 'Team', thirdDown_offense AS '3rd Down Off %',
thirdDown_defense AS '3rd Down Def %' FROM teamdata
WHERE thirdDown_offense > (SELECT AVG(thirdDown_offense) FROM teamdata)
AND thirdDown_defense < (SELECT AVG(thirdDown_defense) FROM teamdata)
ORDER BY thirdDown_offense DESC;

-- Teams below average in third down offense (0.4) and third down defense (0.39)
SELECT team_name AS 'Team', thirdDown_offense AS '3rd Down Off %',
thirdDown_defense AS '3rd Down Def %' FROM teamdata
WHERE thirdDown_offense < (SELECT AVG(thirdDown_offense) FROM teamdata)
AND thirdDown_defense > (SELECT AVG(thirdDown_defense) FROM teamdata)
ORDER BY thirdDown_defense;

-- Teams above average in redzone offense TD rate (0.61) and redzone defense TD rate (0.58)
SELECT team_name AS 'Team', redzone_offense AS 'Redzone Offense Efficiency',
redzone_defense AS 'Redzone Defense Efficiency',
CONCAT(total_wins, '-', total_losses) AS '2021 Record'  FROM teamdata
WHERE redzone_offense > (SELECT AVG(redzone_offense) FROM teamdata)
AND redzone_defense < (SELECT AVG(redzone_defense) FROM teamdata)
ORDER BY total_wins DESC;

-- Teams below average in redzone offense TD rate (0.61) and redzone defense TD rate (0.58)
SELECT team_name AS 'Team', redzone_offense AS 'Redzone Offense Efficiency',
redzone_defense AS 'Redzone Defense Efficiency',
CONCAT(total_wins, '-', total_losses) AS '2021 Record'  FROM teamdata
WHERE redzone_offense < (SELECT AVG(redzone_offense) FROM teamdata)
AND redzone_defense > (SELECT AVG(redzone_defense) FROM teamdata)
ORDER BY total_wins DESC;

-- Teams above average in redzone offense TD rate (0.61) and 3rd Down Offense (0.4)
SELECT team_name AS 'Team', thirdDown_offense AS 'Third Down Offense',
redzone_offense AS 'Redzone Offense Efficiency', total_offense AS 'Yards per Game',
pass_offense AS 'Pass Offense' FROM teamdata
WHERE thirdDown_offense > (SELECT AVG(thirdDown_offense) FROM teamdata)
AND redzone_offense > (SELECT AVG(redzone_offense) FROM teamdata)
ORDER BY thirdDown_offense DESC;

-- Teams below average in redzone offense TD rate (0.61) and 3rd Down Offense (0.4)
SELECT team_name AS 'Team', thirdDown_offense AS 'Third Down Offense',
redzone_offense AS 'Redzone Offense Efficiency', total_offense AS 'Yards per Game',
pass_offense AS 'Pass Offense' FROM teamdata
WHERE thirdDown_offense < (SELECT AVG(thirdDown_offense) FROM teamdata)
AND redzone_offense < (SELECT AVG(redzone_offense) FROM teamdata)
ORDER BY thirdDown_offense DESC;

-- Teams above average in redzone defense TD rate (0.58) and 3rd Down Defense (0.39)
SELECT team_name AS 'Team', thirdDown_defense AS 'Third Down Defense',
redzone_defense AS 'Redzone Defense Efficiency', total_defense AS 'Yards Allowed' FROM teamdata
WHERE thirdDown_defense < (SELECT AVG(thirdDown_defense) FROM teamdata)
AND redzone_defense < (SELECT AVG(redzone_defense) FROM teamdata)
ORDER BY thirdDown_defense;

-- Teams below average in redzone defense TD rate (0.58) and 3rd Down Defense (0.39)
SELECT team_name AS 'Team', thirdDown_defense AS 'Third Down Defense',
redzone_defense AS 'Redzone Defense Efficiency', total_defense AS 'Yards Allowed' FROM teamdata
WHERE thirdDown_defense > (SELECT AVG(thirdDown_defense) FROM teamdata)
AND redzone_defense > (SELECT AVG(redzone_defense) FROM teamdata)
ORDER BY thirdDown_defense;

-- Teams above average in passing offense (237) and passing defense (225.2)
SELECT team_name AS 'Team', pass_offense AS 'Pass Offense', pass_defense AS 'Pass Defense',
CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE pass_offense > (SELECT AVG(pass_offense) FROM teamdata)
AND pass_defense < (SELECT AVG(pass_defense) FROM teamdata) ORDER BY total_wins DESC;

-- Teams with at least 70% of their production returning and a .500 or better conference record in 2021
SELECT team_name AS 'Team', returning_productionPercent AS 'Returning Production',
CONCAT(conf_wins, '-', conf_losses) AS 'Conference Record' FROM teamdata
WHERE returning_productionPercent >= 70 AND conf_wins >= conf_losses
ORDER BY returning_productionPercent DESC;

-- Teams top 30 in recruiting and above average Transfer Portal Points (32.9)
SELECT team_name AS 'Team', recruitingRankAvg_lastTwoYr AS 'Recruiting Ranking',
transferPortal_points AS 'Transfer Portal Points', returning_productionPercent AS 'Returning Production %',
CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE recruitingRankAvg_lastTwoYr < 30.5
AND transferPortal_points > (SELECT AVG(transferPortal_points) FROM teamdata)
ORDER BY total_wins DESC; 


-- Teams above average in yardage margin and points margin
SELECT team_name AS 'Team', ROUND(total_offense - total_defense, 2) AS 'Yardage Margin',
ROUND(points_perGame - ppg_allowed, 2) AS 'Points Margin',
CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE (total_offense - total_defense) > (SELECT AVG(total_offense - total_defense) FROM teamdata)
AND (points_perGame - ppg_allowed) > (SELECT AVG(points_perGame - ppg_allowed) FROM teamdata)
ORDER BY (total_offense - total_defense) DESC;

-- Teams with positive yardage margin, positive sack margin, positive turnover margin
SELECT team_name AS 'Team', ROUND(total_offense - total_defense, 2) AS 'Yardage Margin',
(team_sacks - sacks_allowed) AS 'Sack Margin', turnover_margin AS 'Turnover Margin',
CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE (total_offense - total_defense) >= 0.01 AND (team_sacks - sacks_allowed) >= 0
AND turnover_margin >= 0
ORDER BY (total_offense - total_defense) DESC;

-- Teams with negative sack margin and turnover margin
SELECT team_name AS 'Team', (team_sacks - sacks_allowed) AS 'Sack Margin',
turnover_margin AS 'Turnover Margin',
CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE (team_sacks - sacks_allowed) < 0 AND turnover_margin < 0
ORDER BY total_wins DESC;

-- Teams with below average run defense (150.3) and run offense (165.2)
SELECT team_name AS 'Team', run_offense AS 'Rush Offense', run_defense AS 'Rush Defense',
timeOf_posession AS 'Time of Possession', CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE run_offense < (SELECT AVG(run_offense) FROM teamdata)
AND run_defense > (SELECT AVG(run_defense) FROM teamdata)
ORDER BY timeOf_posession;

-- Teams undefeated at home in the regular season
SELECT team_name AS 'Team', CONCAT(home_wins, '-', home_losses) AS 'Home Record',
CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE home_losses = 0
ORDER BY total_wins DESC;

-- Teams winless on the road/neutral games in the regular season
SELECT team_name AS 'Team', CONCAT(road_wins, '-', road_losses) AS 'Away Record',
CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE road_wins = 0
ORDER BY total_wins DESC;

-- Teams above average in run defense (150.4), pass defense (225.2), and third down defense (0.39)
SELECT team_name AS 'Team', total_defense AS 'Total Defense', run_defense AS 'Run Defense',
pass_defense AS 'Pass Defense', thirdDown_defense AS 'Third Down Defense' FROM teamdata
WHERE run_defense < (SELECT AVG(run_defense) FROM teamdata)
AND pass_defense < (SELECT AVG(pass_defense) FROM teamdata)
AND thirdDown_defense < (SELECT AVG(thirdDown_defense) FROM teamdata)
ORDER BY total_defense;

-- Teams below average in run defense (150.4), pass defense (225.2), and third down defense (0.39)
SELECT team_name AS 'Team', total_defense AS 'Total Defense', run_defense AS 'Run Defense',
pass_defense AS 'Pass Defense', thirdDown_defense AS 'Third Down Defense' FROM teamdata
WHERE run_defense > (SELECT AVG(run_defense) FROM teamdata)
AND pass_defense > (SELECT AVG(pass_defense) FROM teamdata)
AND thirdDown_defense > (SELECT AVG(thirdDown_defense) FROM teamdata)
ORDER BY total_defense;


-- Teams with a negative yardage margin and 6 or more wins
SELECT team_name AS 'Team', CONCAT(total_wins, '-', total_losses) AS '2021 Record',
ROUND((total_offense - total_defense), 2) AS 'Yardage Margin',
turnover_margin AS 'Turnover Margin' FROM teamdata
WHERE (total_offense - total_defense) <= 0 AND total_wins >= 6
ORDER BY total_wins DESC;

-- Teams with a positive yardage margin and less than 6 wins
SELECT team_name AS 'Team', CONCAT(total_wins, '-', total_losses) AS '2021 Record',
ROUND((total_offense - total_defense), 2) AS 'Yardage Margin',
turnover_margin AS 'Turnover Margin' FROM teamdata
WHERE (total_offense - total_defense) >= 0 AND total_wins < 6
ORDER BY total_wins DESC;







-- Extra filters

-- Above average run defense, pass defense, 3rd Down defense, redzone defense, sacks, and a positive turnover margin
SELECT team_name AS 'Team', total_defense AS 'Total Defense', run_defense AS 'Run Defense',
pass_defense AS 'Pass Defense', thirdDown_defense AS 'Third Down Defense',
redzone_defense AS 'Redzone Defense TD Rate', team_sacks AS 'Sacks' FROM teamdata
WHERE run_defense < (SELECT AVG(run_defense) FROM teamdata)
AND pass_defense < (SELECT AVG(pass_defense) FROM teamdata)
AND thirdDown_defense < (SELECT AVG(thirdDown_defense) FROM teamdata)
AND redzone_defense < (SELECT AVG(redzone_defense) FROM teamdata)
AND team_sacks > (SELECT AVG(team_sacks) FROM teamdata)
AND turnover_margin > 0 ORDER BY total_defense;

-- Below average run defense, pass defense, 3rd Down defense, redzone defense, sacks, and a negative turnover margin
SELECT team_name AS 'Team', total_defense AS 'Total Defense', run_defense AS 'Run Defense',
pass_defense AS 'Pass Defense', thirdDown_defense AS 'Third Down Defense',
redzone_defense AS 'Redzone Defense TD Rate', team_sacks AS 'Sacks' FROM teamdata
WHERE run_defense > (SELECT AVG(run_defense) FROM teamdata)
AND pass_defense > (SELECT AVG(pass_defense) FROM teamdata)
AND thirdDown_defense > (SELECT AVG(thirdDown_defense) FROM teamdata)
AND redzone_defense > (SELECT AVG(redzone_defense) FROM teamdata)
AND team_sacks < (SELECT AVG(team_sacks) FROM teamdata)
AND turnover_margin < 0 ORDER BY total_defense DESC;

-- Above average rushing offense, passing offense, 3rd down offense
SELECT team_name AS 'Team', total_offense AS 'Total Offense', run_offense AS 'Run Offense',
pass_offense AS 'Pass Offense', thirdDown_offense AS 'Third Down Offense' FROM teamdata
WHERE run_offense > (SELECT AVG(run_offense) FROM teamdata)
AND pass_offense > (SELECT AVG(pass_offense) FROM teamdata)
AND thirdDown_offense > (SELECT AVG(thirdDown_offense) FROM teamdata);

-- Teams below average in points per game, passing offense, 3rd down offense
SELECT team_name AS 'Team', points_perGame AS 'PPG', pass_offense AS 'Pass Offense',
thirdDown_offense AS '3rd Down Offense' FROM teamdata
WHERE points_perGame < (SELECT AVG(points_perGame) FROM teamdata)
AND pass_offense < (SELECT AVG(pass_offense) FROM teamdata)
AND thirdDown_offense < (SELECT AVG(thirdDown_offense) FROM teamdata) ORDER BY points_perGame DESC;

 -- Teams with winning record on the road
 SELECT team_name AS 'Team', CONCAT(road_wins, '-', road_losses) AS 'Road/N Record',
 CONCAT(total_wins, '-', total_losses) AS 'Overall Record' FROM teamdata
 WHERE road_wins > road_losses ORDER BY road_wins DESC;
 
 -- Teams with 7 or more wins but a losing record on the road
 SELECT team_name AS 'Team', CONCAT(total_wins, '-', total_losses) AS 'Overall Record',
 CONCAT(road_wins, '-', road_losses) AS 'Road/N Record' FROM teamdata
 WHERE road_wins < road_losses AND total_wins >= 7 ORDER BY total_wins DESC;
 
 -- Teams with more home losses than road losses
 SELECT team_name AS 'Team', CONCAT(home_wins, '-', home_losses) AS 'Home Record',
 CONCAT(road_wins, '-', road_losses) AS 'Road/N Record' FROM teamdata
 WHERE home_losses > road_losses ORDER BY total_wins DESC;
 
 -- Teams with 6 or more wins and a losing record in conference
 SELECT team_name AS 'Team', CONCAT(total_wins, '-', total_losses) AS '2021 Record',
 CONCAT(conf_wins, '-', conf_losses) AS 'Conference Record' FROM teamdata
 WHERE total_wins >= 6 AND conf_wins < conf_losses ORDER BY total_wins DESC;
 
 -- Above average total offense, total defense, and a positive turnover margin
SELECT team_name AS 'Team', total_offense AS 'Yards', total_defense AS 'Yards Allowed', 
turnover_margin AS 'Turnover Margin',
CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE total_offense > (SELECT AVG(total_offense) FROM teamdata)
AND total_defense < (SELECT AVG(total_defense) FROM teamdata)
AND turnover_margin > 0
ORDER BY total_offense DESC;

-- Below average 3rd down offense, 3rd down defense, redzone offense, redzone defense
SELECT team_name AS 'Team', thirdDown_offense AS '3rd Down Offense', thirdDown_defense AS '3rd Down Defense',
redzone_offense AS 'Redzone Offense Efficiency', redzone_defense AS 'Redzone Defense Efficiency',
CONCAT(total_wins, '-', total_losses) AS '2021 Record'  FROM teamdata
WHERE redzone_offense < (SELECT AVG(redzone_offense) FROM teamdata)
AND redzone_defense > (SELECT AVG(redzone_defense) FROM teamdata)
AND thirdDown_offense < (SELECT AVG(thirdDown_offense) FROM teamdata)
AND thirdDown_defense > (SELECT AVG(thirdDown_defense) FROM teamdata)
ORDER BY total_wins DESC;

 -- Above Average Redzone offense, below average passing offense
select team_name as 'Team', pass_offense as 'Pass Offense', redzone_offense as 'Redzone Offense'
from teamdata where pass_offense < (select avg(pass_offense) from teamdata)
and redzone_offense > (select avg(redzone_offense) from teamdata) order by pass_offense DESC;

-- Above average Redzone offense, below average rushing offense
select team_name as 'Team', run_offense as 'Rushing Offense', redzone_offense as 'Redzone Offense'
from teamdata where run_offense < (select avg(run_offense) from teamdata)
and redzone_offense > (select avg(redzone_offense) from teamdata);
 
 
 

-- Functions

-- Find the number of new head coaches per conference
SELECT team_conference AS 'Conference', count(new_headCoach) AS 'New Coaches'
FROM teamdata WHERE new_headCoach = "Y"
GROUP BY team_conference
ORDER BY team_conference;

-- Take the averages of total offense and defense, grouped by number of wins
SELECT total_wins AS '2021 Wins', ROUND(AVG(total_offense), 2) AS 'Yards per Game Average',
ROUND(AVG(total_defense), 2) AS 'Yards Allowed Average', ROUND(AVG(points_perGame), 2) AS 'PPG Average',
ROUND(AVG(ppg_allowed), 2) AS 'Average Scoring Defense',
ROUND(AVG(points_perGame - ppg_allowed), 2) AS 'Points Margin' FROM teamdata
GROUP BY total_wins
ORDER BY total_wins DESC;

SELECT * from teamdata where team_name = "Louisville";

-- Take the minimum value, the mean, the standard deviation, and the max value of turnover margin
SELECT MIN(turnover_margin) AS 'Worst TO Margin', ROUND(AVG(turnover_margin), 3) AS 'Average TO Margin',
ROUND(STD(turnover_margin), 3) AS 'Standard Deviation', MAX(turnover_margin) AS 'Best TO Margin'
FROM teamdata;

-- Get the number of teams in each conference
SELECT team_conference AS 'Conference', count(team_name) AS 'Number of Teams' FROM teamdata
GROUP BY team_conference ORDER BY team_conference;

-- Find the name and record of all teams who start with a the letter 'C'
SELECT team_name AS 'Teams who start with C', CONCAT(total_wins, '-', total_losses) AS '2021 Record'
FROM teamdata WHERE team_name LIKE 'C%' ORDER BY team_name;

-- Find the name and record of all teams who start with a letter 'A', 'E', or 'T'
SELECT team_name AS 'Teams who start with A, E, or T',
CONCAT(total_wins, '-', total_losses) AS '2021 Record' FROM teamdata
WHERE team_name REGEXP '^(A|E|T)' ORDER BY team_name;

-- Show last year's record for each team with a new coach this season, sorted by wins
SELECT team_name AS 'Team', CONCAT(total_wins, '-', total_losses) AS '2021 Record'
FROM teamdata WHERE new_headCoach = "Y" ORDER BY total_wins DESC;

-- Show each team's percentage of passing yards and rushing yards, ordered by pass heavy teams
SELECT team_name AS 'Team', CONCAT(ROUND(((pass_offense/total_offense) * 100), 2), ' %') AS 'Pass Usage',
CONCAT(ROUND(((run_offense/total_offense) * 100), 2), ' %') AS 'Run Usage', total_offense AS 'Yards per Game'
FROM teamdata ORDER BY (pass_offense/total_offense) DESC;

-- Show each team's percentage of passing yards and rushing yards, ordered by run heavy teams
SELECT team_name AS 'Team', CONCAT(ROUND(((run_offense/total_offense) * 100), 2), ' %') AS 'Run Usage',
CONCAT(ROUND(((pass_offense/total_offense) * 100), 2), ' %') AS 'Pass Usage', total_offense AS 'Yards per Game'
FROM teamdata ORDER BY (run_offense/total_offense) DESC;


-- random
SELECT * FROM teamdata
WHERE team_name = "Navy";

SELECT AVG(total_offense) AS 'totOffAVg' FROM teamdata;

SELECT team_name AS 'Team', transferPortal_points 
FROM teamdata
ORDER BY transferPortal_points DESC;

SELECT team_name AS 'Team', run_defense
FROM teamdata
ORDER BY run_defense;

SELECT team_name AS 'Team', thirdDown_defense
FROM teamdata
ORDER BY thirdDown_defense;

SELECT team_name AS 'Team', team_sacks
FROM teamdata
ORDER BY team_sacks DESC;

SELECT team_name AS 'Team', run_offense
FROM teamdata
ORDER BY run_offense DESC;

SELECT team_name AS 'Team', sacks_allowed
FROM teamdata
ORDER BY sacks_allowed;

SELECT team_name AS 'Team', pass_offense
FROM teamdata
ORDER BY pass_offense DESC;

SELECT team_name AS 'Team', pass_defense
FROM teamdata
ORDER BY pass_defense DESC;

SELECT team_name AS 'Team', run_defense
FROM teamdata
ORDER BY run_defense;


SELECT team_name, total_wins, recruitingRankAvg_lastTwoYr, transferPortal_points
FROM teamdata
WHERE new_headCoach = "Y";

SELECT team_name, timeOf_posession, run_offense FROM teamdata
ORDER BY timeOf_posession DESC;

SELECT ROUND(AVG(timeOf_posession), 2) FROM teamdata;

SELECT min(thirdDown_offense)
FROM teamdata;

SELECT COUNT(team_name) FROM teamdata
WHERE recruitingRankAvg_lastTwoYr < 45.5;

select count(team_name) from teamdata
where turnover_margin > -12 and turnover_margin < -4;

Select team_name from teamdata
where new_headCoach = "Y" and team_conference = "SEC";


