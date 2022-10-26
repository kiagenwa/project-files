#!/bin/bash

echo -e "\n~~~ Krator Salon ~~~\nWelcomes you.\n"

PSQL="psql --username=freecodecamp --dbname=salon -t -c"

MAIN_MENU() {
  echo -e "\nHere are services we are offering at the salon:"
  AVAILABLE_SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id;")
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR S_NAME
  do
    echo "$SERVICE_ID) $S_NAME"
  done
  echo -e "\nPlease select a service by its number."
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    echo -e "\nPlease select a number."
    MAIN_MENU
  fi
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
  if [[ -z $SERVICE_NAME ]]
  then
    echo -e "\nThat service is not available."
    MAIN_MENU 
  fi
  echo -e "\nPlease enter your phone number."
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nPlease enter your name."
    read CUSTOMER_NAME
    ADD_CUST_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  fi
  CUSTOMER_NAME_F=$(echo $CUSTOMER_NAME | sed -E 's/^ +| *$//g')
  echo -e "\nWelcome, $CUSTOMER_NAME!"
  echo -e "\nWhen would you like the service?"
  read SERVICE_TIME
  ADD_APT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES \
  ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ +| *$//g') \
  at $SERVICE_TIME, $CUSTOMER_NAME_F."
}

MAIN_MENU
