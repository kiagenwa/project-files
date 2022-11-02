#!/bin/bash

integer_check() {
  if [[ ! $1 =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      read NUMBER
    fi
}

S_NUMBER=$(($RANDOM % 1000 + 1))
echo "Enter your username:"
read USERNAME
PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"
USER_ID=$($PSQL "SELECT user_id FROM user_info WHERE username='$USERNAME';")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  USER_INSERT_RESULT=$($PSQL "INSERT INTO user_info (username) values ('$USERNAME');")
  USER_ID=$($PSQL "SELECT user_id FROM user_info WHERE username='$USERNAME';")
else
  GAME_INF=$($PSQL "SELECT COUNT(game_id), MIN(tries) FROM games WHERE user_id = $USER_ID GROUP BY user_id;")
  echo "$GAME_INF" | while read GAME_COUNT BAR BEST_TRIED BAR
  do
    echo "Welcome back, $USERNAME! You have played $GAME_COUNT games, and your best game took $BEST_TRIED guesses."
  done
fi
echo "Guess the secret number between 1 and 1000:"
read NUMBER
GUESS_COUNT=1
integer_check $NUMBER
while [[ $NUMBER -ne $S_NUMBER ]]
do
  if [[ $NUMBER -gt $S_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    read NUMBER
  elif [[ $NUMBER -lt $S_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    read NUMBER
  fi
  integer_check $NUMBER
  GUESS_COUNT=$(($GUESS_COUNT+1))
done
echo "You guessed it in $GUESS_COUNT tries. The secret number was $S_NUMBER. Nice job!"
GAME_INSERT_RESULT=$($PSQL "INSERT INTO games (user_id, tries) VALUES ($USER_ID, $GUESS_COUNT);")
