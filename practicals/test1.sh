#!/bin/bash
read -p " Enter the day :" DAY 
a=
case "$DAY" in
       monday)
		echo "The day is monday"
		;;
       tuesday)
		echo "The day is Tuesday"
		;;
        wednesday)
                echo "The day is Wednesday"
                ;;
        thursday)
                echo "The day is Thursday"
                ;;
        friday)
                echo "The day is friday"
                ;;
        saturday)
                echo "The day is Saturday"
                ;;
	sunday)
                echo "The day is Sunday"
                ;;
	*)
                echo "invalid"
esac









