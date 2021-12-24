#!/bin/bash

#echo "Enter the Time including AM or PM" Enter date
 
grep "$1" $2_Dealer_schedule |  awk -F" " '{print $1, $2, $5, $6}'
