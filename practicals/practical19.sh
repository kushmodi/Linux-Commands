#!/bin/bash 

my_logger() {
  local TEXT= $RANDOM
  echo "$TEXT"
  logger -i -t randomly -p user.info "$TEXT"
}

my_logger "Random number: $RANDOM"
my_logger "Random number: $RANDOM"
my_logger "Random number: $RANDOM"
