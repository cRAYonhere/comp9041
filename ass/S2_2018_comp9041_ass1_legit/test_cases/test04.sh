#!/bin/bash 

exe() { echo "\$ ${@/eval/}" ; "$@" ; }

printf '\n===========CASE 73===========\n'
exe eval "rm -rf .legit"
exe eval "rm a b c d e f g h"
exe eval "/home/cs2041/bin/legit init"
exe eval "touch a b c d e f g h"
exe eval "/home/cs2041/bin/legit add a b c d e f"
exe eval "/home/cs2041/bin/legit commit -m \"first commit\""
exe eval "echo hello >a"
exe eval "echo hello >b"
exe eval "echo hello >c"
exe eval "/home/cs2041/bin/legit add a b"
exe eval "echo world >a"
exe eval "rm d"
exe eval "/home/cs2041/bin/legit rm e"
exe eval "/home/cs2041/bin/legit add g"
exe eval "/home/cs2041/bin/legit status"

printf '\n===========CASE 74===========\n'
exe eval "rm -rf .legit"
exe eval "rm a b c d e f g h"
exe eval "/home/cs2041/bin/legit init"
exe eval "touch a b c d e f g h"
exe eval "/home/cs2041/bin/legit add a b c d e f"
exe eval "/home/cs2041/bin/legit commit -m \"first commit\""
exe eval "echo hello >a"
exe eval "echo hello >b"
exe eval "echo hello >c"
exe eval "/home/cs2041/bin/legit add a b"
exe eval "echo world >a"
exe eval "rm d"
exe eval "/home/cs2041/bin/legit rm e"
exe eval "/home/cs2041/bin/legit add g"
exe eval "/home/cs2041/bin/legit status d"

printf '\n===========CASE 75===========\n'
exe eval "rm -rf .legit"
exe eval "rm a b c d e f g h"
exe eval "/home/cs2041/bin/legit init"
exe eval "touch a b c d e f g h"
exe eval "/home/cs2041/bin/legit add a b c d e f"
exe eval "/home/cs2041/bin/legit commit -m \"first commit\""
exe eval "echo hello >a"
exe eval "echo hello >b"
exe eval "echo hello >c"
exe eval "/home/cs2041/bin/legit add a b f"
exe eval "echo world >a"
exe eval "rm d"
exe eval "/home/cs2041/bin/legit rm e"
exe eval "/home/cs2041/bin/legit add g"
exe eval "/home/cs2041/bin/legit status a"===CASE 75===a
