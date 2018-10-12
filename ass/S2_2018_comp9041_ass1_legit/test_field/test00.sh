#!/bin/bash

exe() { echo "\$ ${@/eval/}" ; "$@" ; }


#testing init
printf '\n===========CASE 00===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"

printf '\n===========CASE 01===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl initt"

printf '\n===========CASE 02===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl"

printf '\n===========CASE 03===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl in\itt"

printf '\n===========CASE 04===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "./legit.pl init"

printf '\n===========CASE 05===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init init"

#testing add
printf '\n===========CASE 06===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "./legit.pl add"

printf '\n===========CASE 07===========\n'
#test filename formats
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1 > a"
exe eval "echo line 1 > a."
exe eval "echo line 1 > a.."
exe eval "echo line 1 > a_a_"
exe eval "echo line 1 > a--"
exe eval "echo line 1 > a__a"
exe eval "echo line 1 > a@a"
exe eval "./legit.pl add a"
exe eval "./legit.pl add a."
exe eval "./legit.pl add a.."
exe eval "./legit.pl add a_a_"
exe eval "./legit.pl add a--"
exe eval "./legit.pl add a__a"
exe eval "./legit.pl add a@a"

printf '\n===========CASE 08===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1 > a"
exe eval "echo line 1 > b"
exe eval "./legit.pl add a b"

printf '\n===========CASE 09===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1 > a"
exe eval "echo line 1 > b"
exe eval "./legit.pl add *"

printf '\n===========CASE 10===========\n'
#doing two add for different set of files
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "echo line 1c > c"
exe eval "echo line 1d > d"
exe eval "./legit.pl add c d"

printf '\n===========CASE 11===========\n'
#adding file with same name and data twice
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "echo line 1a > a"
exe eval "./legit.pl add a b"

printf '\n===========CASE 11===========\n'
#adding same file twice
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl add a b"

printf '\n===========CASE 12===========\n'
#adding non_existent_file
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b non_existent_file"

#testing commit -m message
printf '\n===========CASE 13===========\n'
#adding same file twice
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""

printf '\n===========CASE 14===========\n'
#adding same file twice
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl commit -m \"first commit\""


printf '\n===========CASE 15===========\n'
#adding same file twice
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl commit -m \"second commit\""

printf '\n===========CASE 16===========\n'
#adding same file twice
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"second commit\""

printf '\n===========CASE 17===========\n'
#adding file with same name and data twice
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 1a > a"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"second commit\""

printf '\n===========CASE 18===========\n'
#no commit message
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m"

printf '\n===========CASE 19===========\n'
#empty commit message
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \" \""

printf '\n===========CASE 20===========\n'
#delete files after add but before commit
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "rm -f a b"
exe eval "./legit.pl commit -m \"first commit\""






