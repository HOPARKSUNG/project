#!/bin/bash
x=1
while [ $x -le 10 ]
do
  curl www.test.com:30494/version
  x=$(( $x + 1 ))
sleep 0.4
done
