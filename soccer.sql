DROP DATABASE IF EXISTS  soccer_db;

CREATE DATABASE soccer_db;

\c soccer_db



CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(50),
    team_code VARCHAR(3),
    team_rank INTEGER
);


INSERT INTO teams (team_name, team_code, team_rank) VALUES
    ('Greece', 'GRE', 3),
    ('Russia', 'RUS', 5),
    ('United States', 'USA', 6),
    ('Poland', 'POL', 4),
    ('Germany', 'GER', 1),
    ('Italy', 'ITA', 2);


CREATE TABLE goals (
    goal_id SERIAL PRIMARY KEY,
    player_id INTEGER,
    match_id INTEGER
);


INSERT INTO goals (player_id, match_id) VALUES
    (4, 1),
    (4, 1),
    (1, 1),
    (7, 2),
    (7, 2),
    (8, 2),
    (13, 3),
    (14, 3),
    (13, 3),
    (16, 3);

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    player_name VARCHAR(50),
    team_id INTEGER
);


INSERT INTO players (player_name, team_id) VALUES
    ('Andreas Papadopoulos', 1),
    ('Sophia Antoniou', 1),
    ('Dimitri Katsaros', 1),
    ('Ivan Petrov', 2),
    ('Ekaterina Sokolova', 2),
    ('Sergei Ivanov', 2),
    ('Emily Johnson', 3),
    ('Benjamin Rodriguez', 3),
    ('Olivia Williams', 3),
    ('Jakub Nowak', 4),
    ('Katarzyna Kowalska', 4),
    ('Wojciech Zielinski', 4),
    ('Lena Müller', 5),
    ('Jonas Schmidt', 5),
    ('Anna Wagner', 5),
    ('Luca Rossi', 6),
    ('Sofia Conti', 6),
    ('Matteo Esposito', 6);


CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    date DATE,
    team1 VARCHAR(50),
    team2 VARCHAR(50),
    referee_name VARCHAR(50)
);

-- Insert data into 'matches' table
INSERT INTO matches (date, team1, team2, referee_name) VALUES
    ('3/5/2023', 'RUS', 'GRE', 'Martin Fernandez'),
    ('3/12/2023', 'USA', 'POL', 'Sophie Smith'),
    ('3/19/2023', 'GER', 'ITA', 'Ricardo Gonzalez'),
    ('3/26/2023', 'RUS', 'USA', 'Anna Petrovich'),
    ('4/2/2023', 'POL', 'GER', 'Carlos Ramirez');

--who was the highest scorer this season?
    SELECT players.player_name,teams.team_name, COUNT(goals.player_id) as goals_scored from players
    JOIN goals ON players.player_id=goals.player_id
    JOIN teams ON players.team_id=teams.id
    GROUP BY players.player_id,teams.team_name
    ORDER BY goals_scored desc limit 1;

