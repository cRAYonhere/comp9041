#!/bin/bash 

exe() { echo "\$ ${@/eval/}" ; "$@" ; }



printf '\n===========CASE 40===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1 > a"
exe eval "echo line 1 > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2 >> a"
exe eval "./legit.pl commit -a -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 1:a"

printf '\n===========CASE 41===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1 > a"
exe eval "echo line 1 > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2 >> a"
exe eval "echo line 2 >> b"
exe eval "rm -f a"
exe eval "./legit.pl show :a"
exe eval "./legit.pl commit -a -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"

printf '\n===========CASE 42===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1 > a"
exe eval "echo line 1 > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2 >> a"
exe eval "./legit.pl show :a"
exe eval "./legit.pl commit -m -a \"second commit\""

printf '\n===========CASE 43===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1 > a"
exe eval "echo line 1 > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2 >> a"
exe eval "./legit.pl show :a"
exe eval "./legit.pl commit -m -a \" \""

