-- Query 1: Display all teams
SELECT * FROM teams;

-- Query 2: Display all players
SELECT * FROM players;

-- Query 3: Display all stadiums
SELECT * FROM stadiums;

-- Query 4: Display all tournaments
SELECT * FROM tournaments;

-- Query 5: Display all matches
SELECT * FROM matches;

-- Query 6: Players older than 30
SELECT player_name, age
FROM players
WHERE age > 30;

-- Query 7: Left-handed batsmen
SELECT player_name, batting_style
FROM players
WHERE batting_style = 'Left-hand Bat';

-- Query 8: Right-arm fast bowlers
SELECT player_name, bowling_style
FROM players
WHERE bowling_style = 'Right-arm Fast';

-- Query 9: Stadiums in India
SELECT stadium_name, city
FROM stadiums
WHERE country = 'India';

-- Query 10: Teams in alphabetical order
SELECT *
FROM teams
ORDER BY team_name;

-- Query 11: Players sorted by age
SELECT player_name, age
FROM players
ORDER BY age DESC;

-- Query 12: Top 5 highest scores
SELECT player_id, runs
FROM batting_scorecard
ORDER BY runs DESC
LIMIT 5;

-- Query 13: Bowlers with 4+ wickets
SELECT player_id, wickets, economy
FROM bowling_scorecard
WHERE wickets >= 4;

-- Query 14: Matches won by India
SELECT *
FROM matches
WHERE winner_team_id = 1;

-- Query 15: Display all awards
SELECT *
FROM player_awards;

-- Query 16: Players with their team names
SELECT p.player_name, t.team_name
FROM players p
JOIN teams t
ON p.team_id = t.team_id;

-- Query 17: Number of players in each team
SELECT t.team_name, COUNT(p.player_id) AS total_players
FROM teams t
JOIN players p
ON t.team_id = p.team_id
GROUP BY t.team_name;

-- Query 18: Average age of players in each team
SELECT t.team_name, ROUND(AVG(p.age),2) AS average_age
FROM teams t
JOIN players p
ON t.team_id = p.team_id
GROUP BY t.team_name;

-- Query 19: Total runs scored by each player
SELECT p.player_name, SUM(b.runs) AS total_runs
FROM players p
JOIN batting_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
ORDER BY total_runs DESC;

-- Query 20: Total wickets taken by each player
SELECT p.player_name, SUM(b.wickets) AS total_wickets
FROM players p
JOIN bowling_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
ORDER BY total_wickets DESC;

-- Query 21: Highest individual score by each player
SELECT p.player_name, MAX(b.runs) AS highest_score
FROM players p
JOIN batting_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
ORDER BY highest_score DESC;

-- Query 22: Best bowling figures
SELECT p.player_name, MAX(b.wickets) AS best_figures
FROM players p
JOIN bowling_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
ORDER BY best_figures DESC;

-- Query 23: Players who scored a century
SELECT p.player_name, b.runs
FROM players p
JOIN batting_scorecard b
ON p.player_id = b.player_id
WHERE b.runs >= 100;

-- Query 24: Players who scored a half-century
SELECT p.player_name, b.runs
FROM players p
JOIN batting_scorecard b
ON p.player_id = b.player_id
WHERE b.runs >= 50;

-- Query 25: Average strike rate of each player
SELECT p.player_name, ROUND(AVG(b.strike_rate),2) AS avg_strike_rate
FROM players p
JOIN batting_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
ORDER BY avg_strike_rate DESC;

-- Query 26: Average economy of each bowler
SELECT p.player_name, ROUND(AVG(b.economy),2) AS avg_economy
FROM players p
JOIN bowling_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
ORDER BY avg_economy;

-- Query 27: Number of matches won by each team
SELECT t.team_name, COUNT(*) AS wins
FROM teams t
JOIN matches m
ON t.team_id = m.winner_team_id
GROUP BY t.team_name
ORDER BY wins DESC;

-- Query 28: Matches played at each stadium
SELECT s.stadium_name, COUNT(*) AS total_matches
FROM stadiums s
JOIN matches m
ON s.stadium_id = m.stadium_id
GROUP BY s.stadium_name;

-- Query 29: Number of matches in each tournament
SELECT t.tournament_name, COUNT(m.match_id) AS total_matches
FROM tournaments t
JOIN matches m
ON t.tournament_id = m.tournament_id
GROUP BY t.tournament_name;

-- Query 30: Players who received awards
SELECT p.player_name, a.award_name
FROM players p
JOIN player_awards a
ON p.player_id = a.player_id;

-- Query 31: Players with more than 100 total runs
SELECT p.player_name, SUM(b.runs) AS total_runs
FROM players p
JOIN batting_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
HAVING SUM(b.runs) > 100;

-- Query 32: Players with more than 5 wickets
SELECT p.player_name, SUM(b.wickets) AS total_wickets
FROM players p
JOIN bowling_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
HAVING SUM(b.wickets) > 5;

-- Query 33: Total fours hit by each player
SELECT p.player_name, SUM(b.fours) AS total_fours
FROM players p
JOIN batting_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
ORDER BY total_fours DESC;

-- Query 34: Total sixes hit by each player
SELECT p.player_name, SUM(b.sixes) AS total_sixes
FROM players p
JOIN batting_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
ORDER BY total_sixes DESC;

-- Query 35: Players and their awards (including players with no awards)
SELECT p.player_name, a.award_name
FROM players p
LEFT JOIN player_awards a
ON p.player_id = a.player_id;

-- Query 36: Orange Cap (Highest Run Scorer)
SELECT p.player_name, SUM(b.runs) AS total_runs
FROM players p
JOIN batting_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
ORDER BY total_runs DESC
LIMIT 1;

-- Query 37: Purple Cap (Highest Wicket Taker)
SELECT p.player_name, SUM(b.wickets) AS total_wickets
FROM players p
JOIN bowling_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
ORDER BY total_wickets DESC
LIMIT 1;

-- Query 38: Top 5 Run Scorers
SELECT p.player_name, SUM(b.runs) AS total_runs
FROM players p
JOIN batting_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
ORDER BY total_runs DESC
LIMIT 5;

-- Query 39: Top 5 Wicket Takers
SELECT p.player_name, SUM(b.wickets) AS total_wickets
FROM players p
JOIN bowling_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
ORDER BY total_wickets DESC
LIMIT 5;

-- Query 40: Rank Players by Total Runs
SELECT
    p.player_name,
    SUM(b.runs) AS total_runs,
    RANK() OVER (ORDER BY SUM(b.runs) DESC) AS rank
FROM players p
JOIN batting_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name;

-- Query 41: Dense Rank Bowlers by Wickets
SELECT
    p.player_name,
    SUM(b.wickets) AS total_wickets,
    DENSE_RANK() OVER (ORDER BY SUM(b.wickets) DESC) AS rank
FROM players p
JOIN bowling_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name;

-- Query 42: Row Number Based on Highest Individual Score
SELECT
    p.player_name,
    b.runs,
    ROW_NUMBER() OVER (ORDER BY b.runs DESC) AS row_no
FROM players p
JOIN batting_scorecard b
ON p.player_id = b.player_id;

-- Query 43: Running Total of Runs for Each Player
SELECT
    player_id,
    match_id,
    runs,
    SUM(runs) OVER (
        PARTITION BY player_id
        ORDER BY match_id
    ) AS running_total
FROM batting_scorecard;

-- Query 44: Player(s) with Above Average Runs
SELECT player_name
FROM players
WHERE player_id IN
(
    SELECT player_id
    FROM batting_scorecard
    GROUP BY player_id
    HAVING AVG(runs) >
    (
        SELECT AVG(runs)
        FROM batting_scorecard
    )
);

-- Query 45: Team with Most Wins
SELECT team_name
FROM teams
WHERE team_id =
(
    SELECT winner_team_id
    FROM matches
    GROUP BY winner_team_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Query 46: Players Who Never Won an Award
SELECT player_name
FROM players
WHERE NOT EXISTS
(
    SELECT 1
    FROM player_awards a
    WHERE a.player_id = players.player_id
);

-- Query 47: Categorize Batting Performance
SELECT
    player_id,
    runs,
    CASE
        WHEN runs >= 100 THEN 'Century'
        WHEN runs >= 50 THEN 'Half Century'
        ELSE 'Below 50'
    END AS performance
FROM batting_scorecard;

-- Query 48: CTE - Total Runs by Player
WITH total_runs AS
(
    SELECT
        player_id,
        SUM(runs) AS runs
    FROM batting_scorecard
    GROUP BY player_id
)
SELECT
    p.player_name,
    t.runs
FROM total_runs t
JOIN players p
ON t.player_id = p.player_id
ORDER BY t.runs DESC;

-- Query 49: CTE - Total Wickets by Player
WITH total_wickets AS
(
    SELECT
        player_id,
        SUM(wickets) AS wickets
    FROM bowling_scorecard
    GROUP BY player_id
)
SELECT
    p.player_name,
    t.wickets
FROM total_wickets t
JOIN players p
ON t.player_id = p.player_id
ORDER BY t.wickets DESC;

-- Query 50: Players Scoring More Runs Than Virat Kohli
SELECT
    p.player_name,
    SUM(b.runs) AS total_runs
FROM players p
JOIN batting_scorecard b
ON p.player_id = b.player_id
GROUP BY p.player_name
HAVING SUM(b.runs) >
(
    SELECT SUM(b2.runs)
    FROM batting_scorecard b2
    JOIN players p2
    ON b2.player_id = p2.player_id
    WHERE p2.player_name = 'Virat Kohli'
);

-- Query 51: Team Standings
SELECT
    t.team_name,
    COUNT(m.match_id) AS wins
FROM teams t
LEFT JOIN matches m
ON t.team_id = m.winner_team_id
GROUP BY t.team_name
ORDER BY wins DESC;