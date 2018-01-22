#!/bin/bash
read x
z=10
l=1
while [ $z -le $x ]; do
z=$[z * 10]
l=$[l + 1]
done
worek=0
s=$[10 ** (l-1)]
k=1
while [ $l != 0 ]; do
v=$[ x % (k * 10)]
v=$[v - x % k]
v=$[v*s/k]
worek=$[ worek + v]
k=$[ k*10 ]
s=$[ s/10 ]
l=$[ l-1 ]
done
if [ $worek -eq  $x ]
then
echo "jest"
fi
if [ $worek !=  $x ]
then
echo "nie jest"
fi
