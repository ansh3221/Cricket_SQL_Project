CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    team_name VARCHAR(50) UNIQUE NOT NULL,
    captain VARCHAR(100),
    coach VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    player_name VARCHAR(100) NOT NULL,
    age INT,
    role VARCHAR(30),
    batting_style VARCHAR(50),
    bowling_style VARCHAR(50),
    nationality VARCHAR(50),
    team_id INT,

    FOREIGN KEY (team_id)
    REFERENCES teams(team_id)
);

CREATE TABLE stadiums (
    stadium_id SERIAL PRIMARY KEY,
    stadium_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    capacity INT
);

CREATE TABLE tournaments (
    tournament_id SERIAL PRIMARY KEY,
    tournament_name VARCHAR(100),
    season INT
);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    match_date DATE,

    tournament_id INT,

    team1_id INT,
    team2_id INT,

    stadium_id INT,

    winner_team_id INT,

    toss_winner_id INT,

    FOREIGN KEY (tournament_id)
    REFERENCES tournaments(tournament_id),

    FOREIGN KEY (team1_id)
    REFERENCES teams(team_id),

    FOREIGN KEY (team2_id)
    REFERENCES teams(team_id),

    FOREIGN KEY (stadium_id)
    REFERENCES stadiums(stadium_id),

    FOREIGN KEY (winner_team_id)
    REFERENCES teams(team_id),

    FOREIGN KEY (toss_winner_id)
    REFERENCES teams(team_id)
);

CREATE TABLE batting_scorecard (
    batting_id SERIAL PRIMARY KEY,

    match_id INT,
    player_id INT,

    runs INT,
    balls INT,
    fours INT,
    sixes INT,

    strike_rate DECIMAL(5,2),

    out_status VARCHAR(30),

    FOREIGN KEY (match_id)
    REFERENCES matches(match_id),

    FOREIGN KEY (player_id)
    REFERENCES players(player_id)
);

CREATE TABLE bowling_scorecard (
    bowling_id SERIAL PRIMARY KEY,

    match_id INT,
    player_id INT,

    overs DECIMAL(3,1),

    maidens INT,

    runs_given INT,

    wickets INT,

    economy DECIMAL(4,2),

    FOREIGN KEY (match_id)
    REFERENCES matches(match_id),

    FOREIGN KEY (player_id)
    REFERENCES players(player_id)
);

CREATE TABLE player_awards (
    award_id SERIAL PRIMARY KEY,

    match_id INT,

    player_id INT,

    award_name VARCHAR(100),

    FOREIGN KEY (match_id)
    REFERENCES matches(match_id),

    FOREIGN KEY (player_id)
    REFERENCES players(player_id)
);

CREATE TABLE umpires (
    umpire_id SERIAL PRIMARY KEY,

    umpire_name VARCHAR(100),

    country VARCHAR(50),

    experience_years INT
);