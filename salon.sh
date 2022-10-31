#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

SERVICES_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nWelcome to My Salon, how can I help you?\n"
  
  #get available services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

   
  #display available services
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  #read chosen service
  read SERVICE_ID_SELECTED
  RESERVED_SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  #if input not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # send to main menu
    SERVICES_MENU "I could not find that service. What would you like today?"
  else
    #if reserved service is empty
    if [[ -z $RESERVED_SERVICE  ]]
    then
      # send to main menu
      SERVICES_MENU "I could not find that service. What would you like today?"
    else
      # get customer info
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      CUSTOMER_N=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

      # if customer doesn't exist
      if [[ -z $CUSTOMER_N ]]
      then
        # get new customer name
        echo -e "\nWhat's your name?"
        read CUSTOMER_NAME

        # insert new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
        
        
      fi
      #get service time
      echo -e "\nWhat time would you like to reserve for your appointment?"
      read SERVICE_TIME
      SERVICE_TIME_FORMATED=$(echo $SERVICE_TIME | sed 's/am/:00/g;s/pm/:00/g')
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      CUSTOMER_NAMED=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      CREATE_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES ('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME_FORMATED')")
      echo -e "I have put you down for a$SERVICE_NAME at $SERVICE_TIME_FORMATED,$CUSTOMER_NAMED."
    
    fi
  fi
}

SERVICES_MENU
