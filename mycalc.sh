#!/bin/bash

# Project: Programming Calculator
# Student Name: Jeel Mitesh Tandel
# Script Name: mycalc.sh
# Date: 09/01/2024
# Description: This script performs basic addition and subtraction.

# Function for addition
add() {
    echo $(($1 + $2))
}

# Function for subtraction
subtract() {
    echo $(($1 - $2))
}

# Function to clear the screen and wait
clear_screen() {
    sleep 3
    clear
}

# Main menu
main_menu() {
    while true; do
    	echo "Menu 1"
        echo "C) Calculation"
        echo "X) Exit"
        read -p "Choose an option: " choice
        case "${choice^^}" in
            "C") input_number ;;
            "X") exit 0 ;;
            *) echo "Invalid choice. Please try again." ;;
        esac
    done
}

# Function to input first number
input_number() {
    clear
    echo "Menu 2"
    read -p "Please enter an integer number or X to exit: " num1
    case "${num1^^}" in
        "X") clear; main_menu ;;
        *) operation_menu ;;
    esac
}

# Function to choose operation
operation_menu() {
    clear
    echo "Menu 3"
    echo "+) Add"
    echo "-) Subtract"
    echo "X) Exit"
    read -p "Choose an operation: " operation
    case "${operation^^}" in
        "+") calculate_and_display "+" ;;
        "-") calculate_and_display "-" ;;
        "X") clear; main_menu ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
}

# Function to calculate and display result
calculate_and_display() {
    clear
    read -p "Please enter a second number: " num2
    if [ "$1" = "+" ]; then
        result=$(add $num1 $num2)
    else
        result=$(subtract $num1 $num2)
    fi
    echo "Result: $result"
    clear_screen
    main_menu
}

# Check the number of parameters
if [ "$#" -eq 0 ]; then
    main_menu
elif [ "$#" -eq 3 ] && { [ "$2" = "+" ] || [ "$2" = "-" ]; }; then
    if [ "$2" = "+" ]; then
        result=$(add $1 $3)
    else
        result=$(subtract $1 $3)
    fi
    echo $result
else
    echo "Invalid number of arguments. Use either 0 or 3 arguments."
    exit 1
fi

