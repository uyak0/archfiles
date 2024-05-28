#!/usr/bin/env bash

re='^[0-9]+$'	# Regex for number checking

# Check for todos.md
if [ ! -f todos.md ]; then
	read -p "Todo file not found! Do you want to create one? (Y/N): " confirm
	if [ "$confirm" == 'Y' ] || [ "$confirm" == 'y' ]; then
		touch todos.md
		echo "Todo file created!"
		exit 1
	else
		exit 1
	fi
fi

if (( $# == 1 )); then
	if [ "$1" == "clean" ]; then
		completed=$(grep "[x]" todos.md)
		if [ "$completed" ]; then
			sed -i "/\[x\]/d" todos.md
			echo "Todos cleaned!"
			cat -n todos.md
			exit 1
		else
			echo "No completed todos found!"
			exit 1
		fi
	fi
	echo "Usage: todo [action] [item]"
	exit 1
else 
	action=$1
	item=$2
fi

if [ "$action" == 'add' ]; then
	if [ -s todos.md ]; then
		sed -i "1s/^/- [ ] $item\n/" ~/todos.md
	else
		echo "- [ ] $item" > ~/todos.md
	fi

	echo "Todo $item added!"
	echo "Todos:"

elif [ "$action" == "done" ]; then
	if ! [[ $item =~ $re ]]; then
		echo "Invalid todo number!"
		exit 1
	fi

	sed -i "$item s/\[ \]/\[x\]/" todos.md
	echo "Todo $item completed!"

elif [ "$action" = "undo" ]; then
	if ! [[ $item =~ $re ]]; then
		echo "Invalid todo number!"
		exit 1
	fi

	sed -i "$item s/\[x\]/\[ \]/" todos.md
	echo "Todo $item marked as incomplete!"

elif [ "$action" == "remove" ]; then
	if ! [[ $item =~ $re ]]; then
		echo "Invalid todo number!"
		exit 1
	fi

	sed -i "$item"d todos.md

fi 

cat -n todos.md
