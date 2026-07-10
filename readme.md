# 🏏 Cricket SQL Database Management System

A PostgreSQL database project designed to manage cricket tournaments, teams, players, matches, batting scorecards, bowling scorecards, player awards, and umpires.
![Team Standings]("screenshots/queries/team_standings.png")
This project demonstrates SQL concepts ranging from basic queries to advanced analytics using JOINs, GROUP BY, Subqueries, CTEs, and Window Functions.

---

## 📌 Technologies Used

- PostgreSQL
- pgAdmin 4
- VS Code
- SQL

---

# Database Schema

The database consists of 9 relational tables.

1. Teams
2. Players
3. Stadiums
4. Tournaments
5. Matches
6. Batting Scorecard
7. Bowling Scorecard
8. Player Awards
9. Umpires

---

# Features

- Team Management
- Player Management
- Tournament Records
- Match Details
- Batting Statistics
- Bowling Statistics
- Player Awards
- Team Standings
- Orange Cap Leaderboard
- Purple Cap Leaderboard

---

# SQL Concepts Covered

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN
- Subqueries
- CASE
- Views
- CTEs
- Window Functions
- Ranking Functions

---

# Project Structure

```
Cricket_SQL_Project
│
├── schema.sql
├── README.md
│
├── data
│   ├── teams.sql
│   ├── players.sql
│   ├── stadiums.sql
│   ├── tournaments.sql
│   ├── matches.sql
│   ├── batting_scorecard.sql
│   ├── bowling_scorecard.sql
│   ├── player_awards.sql
│   └── umpires.sql
│
├── queries
│   └── queries.sql
│
└── screenshots
```

---

# Sample Queries

- Team Standings
- Orange Cap Leaderboard
- Purple Cap Leaderboard
- Highest Strike Rate
- Most Sixes
- Top Wicket Takers
- Player Awards
- Stadium Wise Matches
- Tournament Statistics
- Window Function Ranking

---

# How to Run

1. Create a PostgreSQL database.
2. Execute `schema.sql`.
3. Execute all SQL files inside the `data` folder.
4. Execute queries from `queries.sql`.

---

# Author

**Ansh Surve**

B.Sc Data Science Student

MIT Arts, Commerce & Science College, Alandi
