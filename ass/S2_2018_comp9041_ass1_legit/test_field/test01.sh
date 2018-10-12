#!/bin/bash

exe() { echo "\$ ${@/eval/}" ; "$@" ; }

printf '\n===========CASE 21===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl log"
exe eval "./legit.pl logg"
exe eval "./legit.pl log \" \""
exe eval "./legit.pl log log"


printf '\n===========CASE 22===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl log"
exe eval "echo line 2a >> a"
exe eval "echo line 3b >> b"
exe eval "echo line 1c > c"
exe eval "echo line 1d > d"
exe eval "./legit.pl add c d"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl log"

printf '\n===========CASE 23===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl log"
exe eval "echo line 2a >> a"
exe eval "echo line 3b >> b"
exe eval "echo line 1c > c"
exe eval "echo line 1d > d"
exe eval "./legit.pl add c d"
exe eval "rm -f c d"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl log"

printf '\n===========CASE 24===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl log"
exe eval "echo line 2a >> a"
exe eval "echo line 3b >> b"
exe eval "echo line 1c > c"
exe eval "echo line 1d > d"
exe eval "./legit.pl add c d"
exe eval "rm -f c d"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl log"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:c"
exe eval "./legit.pl show 1:d"

printf '\n===========CASE 25===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl log"
exe eval "echo line 2a >> a"
exe eval "echo line 3b >> b"
exe eval "echo line 1c > c"
exe eval "echo line 1d > d"
exe eval "./legit.pl add c d"
exe eval "rm -f c d"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl log"
exe eval "./legit.pl show ::"
exe eval "./legit.pl show :"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show 1:"
exe eval "./legit.pl show 5:d"
exe eval "./legit.pl show 0:d"

printf '\n===========CASE 26===========\n'
#checking log and show without commit
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl log"
exe eval "./legit.pl show 0:a"

printf '\n===========CASE 27===========\n'
#checking order of error detection for file format, non existent file and not commited for log and show
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl log"
exe eval "./legit.pl show 0:@"

printf '\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl log"
exe eval "./legit.pl show 5:a"

printf '\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl log"
exe eval "./legit.pl show 5:non_existent"




