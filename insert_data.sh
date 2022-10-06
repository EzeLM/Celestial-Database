#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#create auxialry team names columns on games table
echo "$($PSQL "ALTER TABLE games ADD COLUMN winner_name varchar(20), ADD COLUMN opponent_name varchar(20);")"
#create temp table
echo "$($PSQL "CREATE TABLE temporary(year int,round varchar(32),winner_name varchar(32),opponent_name varchar(32),w_goals int, o_goals int);")"
#copy csv to temp table
echo "$($PSQL "\copy temporary(year,round,winner_name,opponent_name,w_goals,o_goals) FROM '/home/codeally/project/games.csv' DELIMITER ',' CSV HEADER;")"
#popuate teams table from temp table
echo "$($PSQL "INSERT INTO teams(name) SELECT winner_name FROM temporary UNION SELECT opponent_name FROM temporary;")"
#drop not null constraint on id columns of games table to insert data
echo "$($PSQL "ALTER TABLE games ALTER COLUMN winner_id DROP not null, ALTER COLUMN opponent_id DROP not null;")"
#insert csv values into games table
echo "$($PSQL "\copy games(year,round,winner_name,opponent_name,winner_goals,opponent_goals) FROM '/home/codeally/project/games.csv' DELIMITER ',' CSV HEADER;")"
#update games table with teams id from teams table
echo "$($PSQL "UPDATE games SET winner_id=(SELECT team_id FROM teams WHERE teams.name=games.winner_name);")"
#update games table with teams id from teams table
echo "$($PSQL "UPDATE games SET opponent_id=(SELECT team_id FROM teams WHERE teams.name=games.opponent_name);")"
#return not nul constraint
echo "$($PSQL "ALTER TABLE games ALTER COLUMN winner_id SET not null, ALTER COLUMN opponent_id SET not null;")"
#drop auxiliary columns
echo "$($PSQL "ALTER TABLE games DROP COLUMN winner_name, DROP COLUMN opponent_name;")"
#drop temp table
echo "$($PSQL "DROP TABLE temporary;")"