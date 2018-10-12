#!/bin/bash 

exe() { echo "\$ ${@/eval/}" ; "$@" ; }


printf '\n===========CASE 41===========\n'
exe eval "rm -rf .legit"
exe eval "./legit.pl rm"
exe eval "./legit.pl rm a"
exe eval "./legit.pl init"
exe eval "./legit.pl rm a"
exe eval "echo line 1 > a"
exe eval "./legit.pl rm a"
exe eval "echo line 1 > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl rm a"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl rm"
exe eval "./legit.pl rm a"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show 0:a"


printf '\n===========CASE 42===========\n'
#add same file after rm 
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl rm a"
exe eval "./legit.pl add a"

printf '\n===========CASE 43===========\n'
#add same file after rm --cached
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl rm --cached a"
exe eval "./legit.pl add a"

printf '\n===========CASE 44===========\n'
#commit after rm 
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl rm a"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"

printf '\n===========CASE 45===========\n'
#commit after rm <filename> --cached
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl rm a --cached"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"


printf '\n===========CASE 46===========\n'
#HEAD different from working tree rm 
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2a >> a"
exe eval "./legit.pl rm a"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl add a"

printf '\n===========CASE 47===========\n'
#HEAD different from working tree rm --force
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2a >> a"
exe eval "./legit.pl rm --force a"
exe eval "./legit.pl add a"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl add a"

printf '\n===========CASE 48===========\n'
#HEAD different from working tree --cached
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2a >> a"
exe eval "./legit.pl rm --cached a"
exe eval "./legit.pl add a"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl add a"

printf '\n===========CASE 49===========\n'
#different HEAD working tree and index rm
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2a >> a"
exe eval "./legit.pl add a"
exe eval "echo line 3a >> a"
exe eval "./legit.pl rm a"
exe eval "./legit.pl add a"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl add a"

printf '\n===========CASE 50===========\n'
#different HEAD working tree and index rm --cached
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2a >> a"
exe eval "./legit.pl add a"
exe eval "echo line 3a >> a"
exe eval "./legit.pl rm --cached a"
exe eval "./legit.pl add a"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl add a"

printf '\n===========CASE 51===========\n'
#different HEAD working tree and index rm --force
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2a >> a"
exe eval "./legit.pl add a"
exe eval "echo line 3a >> a"
exe eval "./legit.pl rm --force a"
exe eval "./legit.pl add a"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl add a"

printf '\n===========CASE 52===========\n'
#commit after rm --force --cached 
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl rm --force --cached a"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl add a"

printf '\n===========CASE 53===========\n'
#commit after rm --cached --force
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl rm --cached --force a"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl add a"

printf '\n===========CASE 54===========\n'
#commit after rm --force b --cached a
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "echo line 1c > c"
exe eval "./legit.pl add a b c"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl rm --force b --cached a"
exe eval "echo line 2c >> c"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show :c"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 0:c"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl show 1:c"
exe eval "./legit.pl add a"
exe eval "./legit.pl add b"
exe eval "./legit.pl add c"

printf '\n===========CASE 55===========\n'
#rm staged file
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "echo line 1c > c"
exe eval "./legit.pl add a b c"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2c >> c"
exe eval "./legit.pl add c"
exe eval "./legit.pl rm c"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show :c"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 0:c"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl show 1:c"
exe eval "./legit.pl add a"
exe eval "./legit.pl add b"
exe eval "./legit.pl add c"

printf '\n===========CASE 56===========\n'
#rm --cached staged file
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "echo line 1c > c"
exe eval "./legit.pl add a b c"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2c >> c"
exe eval "./legit.pl add c"
exe eval "./legit.pl rm --cached c"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show :c"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 0:c"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl show 1:c"
exe eval "./legit.pl add a"
exe eval "./legit.pl add b"
exe eval "./legit.pl add c"

printf '\n===========CASE 57===========\n'
#rm --force staged file
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "echo line 1c > c"
exe eval "./legit.pl add a b c"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2c >> c"
exe eval "./legit.pl add c"
exe eval "./legit.pl rm --force c"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show :c"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 0:c"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl show 1:c"
exe eval "./legit.pl add a"
exe eval "./legit.pl add b"
exe eval "./legit.pl add c"

printf '\n===========CASE 58===========\n'
#commit after rm <filename> <filename> --force --cached
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl rm a b --force --cached"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl add a"
exe eval "./legit.pl add b"


printf '\n===========CASE 59===========\n'
#commit after rm a b --force --force --force --force
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl rm a b --force --force --force --force"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl add a"
exe eval "./legit.pl add b"

printf '\n===========CASE 60===========\n'
#commit after rm a b --cached --force --cached --force
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl rm a b --cached --force --cached --force"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl add a"
exe eval "./legit.pl add b"

printf '\n===========CASE 61===========\n'
#commit after rm a b --cached --cached --force --force
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl rm a b --cached --cached --force --force"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl add a"
exe eval "./legit.pl add b"

printf '\n===========CASE 62===========\n'
#HEAD has different files compared to working tree 
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 1a > a"
exe eval "rm b"
exe eval "./legit.pl rm a"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl add a"

printf '\n===========CASE 63===========\n'
#different staged file and working tree rm --cached
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "echo line 1c > c"
exe eval "./legit.pl add a b c"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2c >> c"
exe eval "./legit.pl add c"
exe eval "echo line 1c > c"
exe eval "./legit.pl rm c --cached"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show :c"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 0:c"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl show 1:c"
exe eval "./legit.pl add a"
exe eval "./legit.pl add b"
exe eval "./legit.pl add c"

printf '\n===========CASE 64===========\n'
#different staged file and working tree rm --force
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "echo line 1c > c"
exe eval "./legit.pl add a b c"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "echo line 2c >> c"
exe eval "./legit.pl add c"
exe eval "echo line 3c >> c"
exe eval "./legit.pl rm c "
exe eval "./legit.pl commit -m \"second commit\""
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl show :c"
exe eval "./legit.pl show 0:a"
exe eval "./legit.pl show 0:b"
exe eval "./legit.pl show 0:c"
exe eval "./legit.pl show 1:a"
exe eval "./legit.pl show 1:b"
exe eval "./legit.pl show 1:c"
exe eval "./legit.pl add a"
exe eval "./legit.pl add b"
exe eval "./legit.pl add c"

printf '\n===========CASE 65===========\n'
# check removal of multiple files
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "echo line 1c > c"
exe eval "./legit.pl add a b c"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl rm c"
exe eval "echo line 2a >> a"
exe eval "echo line 2b >> b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "echo line 1c > c"
exe eval "./legit.pl add c"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"
exe eval "./legit.pl rm a b"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :b"


printf '\n===========CASE 66===========\n'
# check removal of multiple files
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "echo line 1c > c"
exe eval "./legit.pl add a b c"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl rm c"
exe eval "echo line 2a >> a"
exe eval "echo line 2b >> b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"second commit\""
exe eval "echo line 1c > c"
exe eval "./legit.pl add c"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :c"
exe eval "./legit.pl rm a c"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :c"

printf '\n===========CASE 67===========\n'
# stage same files as the last commit
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl add a b"
exe eval "./legit.pl rm a"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :c"

printf '\n===========CASE 68===========\n'
# HEAD and Stage are same but workingTree is different
#legit.pl: error: 'b' in repository is different to working file
exe eval "rm -rf .legit"
exe eval "./legit.pl init"
exe eval "echo line 1a > a"
exe eval "echo line 1b > b"
exe eval "./legit.pl add a b"
exe eval "./legit.pl commit -m \"first commit\""
exe eval "./legit.pl add a b"
exe eval "echo line 2b >> b"
exe eval "./legit.pl rm b"
exe eval "./legit.pl show :a"
exe eval "./legit.pl show :c"


