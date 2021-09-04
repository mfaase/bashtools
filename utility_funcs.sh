#!/usr/bin/env bash
# File funcs.sh

function plier 
{
	#accepts multiple integers as arguments
	#returns product of all integers
	sum=1

	for value in $@ 
	do
		let sum=$sum\*$value
	done

	echo $sum
}

function isiteven 
{
	#accepts single integer
	#returns 1 if even, returns 2 if uneven

	ret=$(( $1 % 2 ))	
	if [[ $ret == 1 ]]
	then
		echo 0
	else
		echo 1
	fi
}

function nevens 
{
	#accepts multiple integers
	#returns the number of even integers
	
	nev=0

	for value in $@
	do	
		sbmc=$(isiteven $value)
		let nev=$nev+$sbmc
	done

	echo $nev
}

function howodd 
{
	#accepts multiple integers
	#returns the percentage of odd integers

	evens=$(nevens $@)

	pevens=$(echo "$evens / $#"| bc -l)
	echo $(echo "1-$pevens"|bc -l)
	
}

function fib() 
{
	#accepts one integer n
	#returns n terms of the fibonacci sequence

	fibs=()
	int1=0
	int2=1

	while [[ ${#fibs[@]} -lt $1 ]]
	do
		fibs+=($int1)
		temp2=$int2
		let int2=$int1+$int2
		int1=$temp2
	done

	echo ${fibs[*]}
}
