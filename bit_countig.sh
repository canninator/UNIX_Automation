#!/bin/bash
n=$1
s=0

if [[ $n == 0 ]]
then
echo 0
exit 0
elif [[ $n == 1 ]]
then
echo 1
exit 0
fi

while [[ $n -ge 2 ]]
do
r=`expr $n % 2`
if [[ $r == 1 ]]
then
s=`expr $s + 1`
fi
n=`expr $n / 2`
if [[ $n == 1 ]]
then
s=`expr $s + 1`
fi
done
echo $s
