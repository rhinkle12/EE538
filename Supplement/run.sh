#!/bin/bash

rm parser
gcc -o parser readckt.c
wait 
./parser
