#!/bin/bash


if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
  exit 0
fi
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"
if [[ $1 =~ ^[A-Z]$ || $1 =~ ^[A-Z][a-z]$ ]]
then
  ELEMENT_INF=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, \
  melting_point_celsius, boiling_point_celsius FROM elements LEFT JOIN properties \
  USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol = '$1';")
elif [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT_INF=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, \
  melting_point_celsius, boiling_point_celsius FROM elements LEFT JOIN properties \
  USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number = '$1';")
elif [[ $1 =~ ^[A-Z][a-z]+$ ]]
then
  ELEMENT_INF=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, \
  melting_point_celsius, boiling_point_celsius FROM elements LEFT JOIN properties \
  USING(atomic_number) LEFT JOIN types USING(type_id) WHERE name = '$1';")
fi
if [[ -z $ELEMENT_INF ]]
then
  echo "I could not find that element in the database."
  exit 0
fi
echo "$ELEMENT_INF" | while read ATM_N BAR NAME BAR SYMB BAR TYPE BAR ATM_M BAR MT_P BAR BL_P
do
  echo "The element with atomic number $ATM_N is $NAME ($SYMB). It's a $TYPE, with a mass of $ATM_M amu. $NAME has a melting point of $MT_P celsius and a boiling point of $BL_P celsius."
done
