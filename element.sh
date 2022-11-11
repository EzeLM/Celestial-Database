#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
fi

element=''
if [[ $1 =~ ^[0-9] ]]
then
  element=$($PSQL "SELECT name FROM elements WHERE atomic_number=$1;")
  else
  element=$($PSQL "SELECT name FROM elements WHERE name='$1' OR symbol='$1';")
fi

element_atomic_n=$($PSQL "SELECT atomic_number FROM elements WHERE name='$element';")
element_symbol=$($PSQL "SELECT symbol FROM elements WHERE name LIKE '$element';")
element_type=$($PSQL "SELECT type FROM types as t LEFT JOIN properties as p ON(t.type_id=p.type_id) WHERE atomic_number=$(($element_atomic_n));")
element_atom_mass=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$(($element_atomic_n));")
element_melting=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$(($element_atomic_n));")
element_boiling=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$(($element_atomic_n));")

if [[ -z $element ]] && [[ ! -z $1 ]]
then
 echo -e "I could not find that element in the database."
 else
  if [[ ! -z $element ]] && [[ ! -z $1 ]]
  then
    echo -e "The element with atomic number $(($element_atomic_n)) is $element ($element_symbol). It's a $element_type, with a mass of $element_atom_mass amu. $element has a melting point of $element_melting celsius and a boiling point of $element_boiling celsius."
  fi
fi
